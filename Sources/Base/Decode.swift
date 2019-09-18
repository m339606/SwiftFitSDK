
public class Decode {
    
    private let crcSize = 2
    private let invalid_data_size = 0
    
    private var localMesgDefs = Array<MesgDefinition?>(repeating: nil, count: Int(Fit.maxLocalMesgs))
    private var fileHeader: Header! = nil
    private var timestamp: UInt32 = 0
    private var lastTimeOffset: UInt32 = 0
    public var invalidDataSize: Bool = false
    private var accumulator: Accumulator = Accumulator()
    private let lookup: DeveloperDataLookup = DeveloperDataLookup()

    public weak var delegate: DecodeDelegate? = nil
    
    public init() {
        
    }
    
    public func isFIT(_ fitData: PositionableData) -> Bool {
        let position = fitData.position
        let header = Header(fitData: fitData)
        fitData.position = position
        return header.isValid()
    }
    
    public func checkIntegrity(_ fitData: PositionableData) -> Bool {
        var isValid = true
        let position = fitData.position
        var fileSize = 0
        
        while (fitData.position < fitData.count) && isValid {
            let header = Header(fitData: fitData)
            isValid = header.isValid()
            
            if Int(header.dataSize) > invalid_data_size {
                fileSize = Int(header.size) + Int(header.dataSize) + crcSize
                fitData.position = fitData.position - Int(header.size)
                if(fileSize == fitData.count){
                    let data = fitData.read(count: fileSize)
                    isValid = isValid && CRC.calc16(dataBlock: data, size: data.count) == 0x0000
                }else{
                    invalidDataSize = true
                    isValid = false
                }
            } else {
                invalidDataSize = true
                isValid = false
            }
        }
        
        fitData.position = position
        return isValid
    }
    
    public func read(_ fitData: PositionableData) -> Bool {
        var status = true
        let position = fitData.position
        
        while fitData.position < fitData.count && status {
            status = read(fitData, .Normal)
        }
        
        fitData.position = position
        return status
    }
    
    public func read(_ fitData: PositionableData, _ mode: DecodeMode) -> Bool {
        var readOK = true
        var fileSize = 0
        let filePosition = fitData.position
        
        if mode == DecodeMode.Normal {
            fileHeader = Header(fitData: fitData)
            readOK = readOK && fileHeader.isValid()
            
            if !invalidDataSize {
                fileSize = Int(fileHeader.size) + Int(fileHeader.dataSize) + crcSize
            } else {
                fileSize = fitData.count
            }
            
            if !readOK {
                fatalError("FIT decode error: File is not FIT format. Check file header data type. Error at stream position: \(fitData.position)")
            }
            
            if ((fileHeader.protocolVersion & Fit.protocolVersionMajorMask) > (Fit.protocolMajorVersion << Fit.protocolVersionMajorShift))
            {
                fatalError("FIT decode error: Protocol Version {0}.X not supported by SDK Protocol Ver\((fileHeader.protocolVersion & Fit.protocolVersionMajorMask) >> Fit.protocolVersionMajorShift).\(Fit.protocolMajorVersion, Fit.protocolMinorVersion) ")
            }
        } else if mode == .InvalidHeader {
            fitData.position += Int(Fit.headerWithCRCSize)
            fileSize = fitData.count
        } else if mode == .DataOnly {
            fitData.position = 0
            fileSize = fitData.count
        } else {
            fatalError("Invalid Decode Mode Provided to read")
        }
        
        while fitData.position < (filePosition + fileSize - crcSize) {
            decodeNextMessage(fitData)
        }
        
        if (mode == DecodeMode.Normal) && !invalidDataSize {
            fitData.position = filePosition
            let data = fitData.read(count: fitData.count)
            readOK = readOK && CRC.calc16(dataBlock: data, size: data.count) == 0x0000
            fitData.position = filePosition + fileSize
        }
        
        return readOK
    }
    
    public func decodeNextMessage(_ fitData: PositionableData) {
        let br = BinaryReader(fitData)
        let nextByte = br.readByte()
        
        if (nextByte & Fit.compressedHeaderMask) == Fit.compressedHeaderMask {
            let mesgBuffer = PositionableData()
            let timeOffset = UInt32(nextByte & Fit.compressedTimeMask)
            timestamp += (timeOffset - lastTimeOffset) & UInt32(Fit.compressedTimeMask)
            lastTimeOffset = timestamp
            var timestampField = Field(field: Profile.getMesg(globalMesgNum: MesgNum.Record).getField(fieldName: "Timestamp"))
            timestampField.setValue(value: timestamp)
            
            let localMesgNum = (nextByte & Fit.compressedLocalMesgNumMask) >> 5
            mesgBuffer.write(localMesgNum)
            if localMesgDefs[Int(localMesgNum)] == nil {
                fatalError("Decode:DecodeNextMessage - FIT decode error: Missing message definition for local message number \(localMesgNum) at stream position \(fitData.position)")
            }
            let fieldsSize = localMesgDefs[Int(localMesgNum)]!.getMesgSize() - 1
            let read = br.readBytes(count: fieldsSize)
            mesgBuffer.write(read)
            
            let newMesg = Mesg(fitData: mesgBuffer, defnMesg: localMesgDefs[Int(localMesgNum)]!)
            newMesg.insertField(index: 0, field: timestampField)
            didReadMesg(newMesg)
        } else if (nextByte & Fit.mesgDefinitionMask) == Fit.mesgDefinitionMask {
            let mesgDefBuffer = PositionableData()

            mesgDefBuffer.write(nextByte)
            mesgDefBuffer.write(br.readBytes(count: 4))
            let numFields = br.readByte()
            mesgDefBuffer.write(numFields)
            var numBytes = Int(numFields) * 3
            var read = br.readBytes(count: numBytes)
            mesgDefBuffer.write(read)
            
            if (nextByte & Fit.devDataMask) == Fit.devDataMask {
                let numDevFields = br.readByte()
                mesgDefBuffer.write(numDevFields)
                numBytes = Int(numDevFields) * 3
                read = br.readBytes(count: numBytes)
                mesgDefBuffer.write(read)
            }
            
            let newMesgDef = MesgDefinition(fitSource: mesgDefBuffer, lookup: lookup)
            localMesgDefs[Int(newMesgDef.localMesgNum)] = newMesgDef
            self.delegate?.didReadMesgDefinition(mesgDef: newMesgDef)
        } else if nextByte & Fit.mesgDefinitionMask == Fit.mesgHeaderMask {
            let mesgBuffer = PositionableData()

            let localMesgNum = nextByte & Fit.localMesgNumMask
            mesgBuffer.write(localMesgNum)
            if localMesgDefs[Int(localMesgNum)] == nil {
                fatalError("Decode:DecodeNextMessage - FIT decode error: Missing message definition for local message number \(localMesgNum) at stream position \(fitData.position)")
            }
            let fieldsSize = localMesgDefs[Int(localMesgNum)]!.getMesgSize() - 1
            let read = br.readBytes(count: fieldsSize)
            mesgBuffer.write(read)
            
            let newMesg = Mesg(fitData: mesgBuffer, defnMesg: localMesgDefs[Int(localMesgNum)]!)
            
            if let timestampField = newMesg.getField(fieldName: "Timestamp") {
                if let tsValue = timestampField.getValue() {
                    timestamp = numericCast(tsValue)
                    lastTimeOffset = timestamp & UInt32(Fit.compressedTimeMask)
                }
            }
            
            for field in newMesg.fields {
                if field.isAccumulated {
                    for i in 0 ..< field.getNumValues() {
                        
                        var value = numericCast(field.getRawValue(index: i)!, Int64.self)
                        
                        for fieldIn in newMesg.fields {
                            for fc in fieldIn.components {
                                if (fc.fieldNum == field.num) && fc.accumulate {
                                    value = Int64((((Float64(value) / field.scale) - field.offset) + fc.offset) * fc.scale)
                                }
                            }
                        }
                        accumulator.set(mesgNum: Int32(newMesg.num), destFieldNum: Int32(field.num), value: value)
                    }
                }
            }
            
            newMesg.expandComponents(accumulator: accumulator)
            
            didReadMesg(newMesg)
        } else {
            fatalError("Decode:Read - FIT decode error: Unexpected Record Header Byte \(String(format: "%02hhX-", nextByte)) at stream position: \(fitData.position)")
        }
    }
    
    private func didReadMesg(_ newMesg: Mesg) {
        
        if newMesg.num == MesgNum.DeveloperDataId {
            let mesg = DeveloperDataIdMesg(newMesg)
            lookup.add(mesg: mesg)
        } else if newMesg.num == MesgNum.FieldDescription {
            let mesg = FieldDescriptionMesg(newMesg)
            if let desc = lookup.add(mesg: mesg) {
                self.delegate?.didReadDeveloperFieldDescription(fieldDesc: desc)
            }
        }
        
        self.delegate?.didReadMesg(mesg: newMesg)
    }
}
