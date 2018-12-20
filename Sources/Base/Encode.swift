
public class Encode {
    
    private var lastMesgDef = Array<MesgDefinition?>(repeating: nil, count: Int(Fit.maxLocalMesgs))
    private var mesgsData: PositionableData
    private let validator: IValidator
    public var header: Header

    public init(_ version: ProtocolVersion) {
        self.header = Header(version: version)
        self.validator = ProtocolValidator(version: version)
        mesgsData = PositionableData()
    }
    
    public func write(_ mesgDefinition: MesgDefinition) {
        if !validator.validateMesgDefn(defn: mesgDefinition) {
            fatalError("Encode:Write - mesgDefinition contains incompatible protocol Features")
        }
        
        mesgDefinition.write(fitDest: mesgsData)
        lastMesgDef[Int(mesgDefinition.localMesgNum)] = mesgDefinition
    }
    
    public func write(_ mesg: Mesg) {
        if !validator.validateMesg(mesg: mesg) {
            fatalError("Encode:Write - mesg contains incompatible protocol Features")
        }
        
        if lastMesgDef[Int(mesg.localNum)] == nil || !lastMesgDef[Int(mesg.localNum)]!.supports(mesg: mesg) {
            write(MesgDefinition(mesg: mesg))
        }
        mesg.write(outData: mesgsData, mesgDef: lastMesgDef[Int(mesg.localNum)]!)
    }
    
    public func write(_ mesgs: Array<Mesg>) {
        for mesg in mesgs {
            write(mesg)
        }
    }
    
    public func close() -> PositionableData {
        
        let fullFitData = PositionableData()
        header.dataSize = UInt32(mesgsData.count)
        header.updateCRC()
        header.write(fitData: fullFitData)
        
        fullFitData.write(mesgsData.data)
        
        let fileCrc = CRC.calc16(dataBlock: fullFitData.data, size: fullFitData.count)
        
        let bw = BinaryWriter(fullFitData)
        bw.write(fileCrc)
        return fullFitData
    }
    
}
