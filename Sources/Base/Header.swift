
public class Header {
    
    private var dataType: String = ""
    private var _size: UInt8 = 0
    
    public var size: UInt8 {
        get {
            return _size
        }
        set {
            if newValue == Fit.headerWithCRCSize || newValue == Fit.headerWithoutCRCSize {
                _size = newValue
            } else {
                fatalError("Tried to set Header Size to \(newValue)")
            }
        }
    }
    
    public var protocolVersion: UInt8 = 0
    public var profileVersion: UInt16 = 0
    public var dataSize: UInt32 = 0
    public var crc: UInt16 = 0
    
    public init(version: ProtocolVersion) {
        _size = Fit.headerWithCRCSize
        protocolVersion = version.getVersionByte()
        profileVersion = Fit.profileVersion
        dataSize = 0
        dataType = ".FIT"
        crc = 0
        updateCRC()
    }
    
    public init(fitData: PositionableData) {
        read(fitData: fitData)
    }
    
    public func isValid() -> Bool {
        return dataType == ".FIT"
    }
    
    public func read(fitData: PositionableData) {
        let binReader = BinaryReader(fitData)
        size = binReader.readByte()
        protocolVersion = binReader.readByte()
        profileVersion = binReader.readUInt16()
        dataSize = binReader.readUInt32()
        dataType = String(data: Data(bytes: binReader.readBytes(count: 4)), encoding: String.Encoding.ascii) ?? ""
        if size == Fit.headerWithCRCSize {
            crc = binReader.readUInt16()
        } else {
            crc = 0x0000
        }
    }
    
    public func write(fitData: PositionableData) {
        let bw = BinaryWriter(fitData)
        bw.write(size)
        bw.write(protocolVersion)
        bw.write(profileVersion)
        bw.write(dataSize)
        bw.write(Array<UInt8>(dataType.data(using: String.Encoding.ascii)!))
        if size == Fit.headerWithCRCSize {
            bw.write(crc)
        }
    }
    
    public func updateCRC() {
        let fitData = PositionableData();
        write(fitData: fitData)
        crc = CRC.calc16(dataBlock: fitData.data, size: fitData.count - 2)
    }
}
