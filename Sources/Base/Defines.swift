
public enum ProtocolVersion {
    
    case v10
    case v20
    
}

extension ProtocolVersion {
    
    private struct DetailedProtocolVersion {
        
        public private(set) var majorVersion: UInt8
        
        public private(set) var minorVersion: UInt8
        
        public var version: UInt8 {
            get {
                return majorVersion << Fit.protocolVersionMajorShift | minorVersion
            }
        }
        
        public init(major: UInt8, minor: UInt8) {
            self.majorVersion = major
            self.minorVersion = minor
        }
    }
    
    private static var s_versionMap: [ProtocolVersion : DetailedProtocolVersion] {
        get {
            return [ProtocolVersion.v10: DetailedProtocolVersion(major: 1, minor: 0),
                    ProtocolVersion.v20: DetailedProtocolVersion(major: 2, minor: 0)]
        }
    }
    
    public func getMajorVersion() -> UInt8 {
        return ProtocolVersion.s_versionMap[self]!.majorVersion
    }
    
    public func getMinorVersion() -> UInt8 {
        return ProtocolVersion.s_versionMap[self]!.minorVersion
    }
    
    public func getVersionByte() -> UInt8 {
        return ProtocolVersion.s_versionMap[self]!.version
    }

}

public struct Fit {

    public static let protocolVersionMajorShift = 4
    public static let protocolVersionMajorMask: UInt8 = (0x0F << protocolVersionMajorShift)
    
    
    
    public static let protocolVersion = ProtocolVersion.v20.getVersionByte()
    public static let protocolMajorVersion = ProtocolVersion.v20.getMajorVersion()
    public static let protocolMinorVersion = ProtocolVersion.v20.getMinorVersion()
    
    public static let profileVersion: UInt16 = (profileMajorVersion * 100) + profileMinorVersion
    public static let profileMajorVersion: UInt16 = 20
    public static let profileMinorVersion: UInt16 = 76
    
    public static let headerTypeMask: UInt8 = 0xF0
    public static let compressedHeaderMask: UInt8 = 0x80
    public static let compressedTimeMask: UInt8 = 0x1F
    public static let compressedLocalMesgNumMask: UInt8 = 0x60
    
    public static let mesgDefinitionMask: UInt8 = 0x40
    public static let devDataMask: UInt8 = 0x20
    public static let mesgHeaderMask: UInt8 = 0x00
    public static let localMesgNumMask: UInt8 = 0x0F
    public static let maxLocalMesgs: UInt8 = localMesgNumMask + 1
    
    public static let mesgDefinitionReserved: UInt8 = 0x00
    public static let littleEndian: UInt8 = 0x00
    public static let bigEndian: UInt8 = 0x01
    
    public static let maxMesgSize: UInt8 = 255
    public static let maxFieldSize: UInt8 = 255
    
    public static let headerWithCRCSize: UInt8 = 14
    public static let headerWithoutCRCSize: UInt8 = (headerWithCRCSize - 2)
    
    public static let fieldNumInvalid: UInt8 = 255
    public static let fieldNumTimeStamp: UInt8 = 253

    public static let subfieldIndexMainField: UInt16 = subfieldIndexActiveSubfield + 1
    public static let subfieldIndexActiveSubfield: UInt16 = 0xFFFE
    public static let subfieldNameMainField: String = ""
    
    public static var baseType: [FitType] {
        get {
            return [FitType(endianAbility: false,
                            baseTypeField: 0x00,
                            typeName: "enum",
                            invalidValue: 0xFF as UInt8,
                            size: 1,
                            isSigned: false,
                            isInteger: false),
                    FitType(endianAbility: false,
                            baseTypeField: 0x01,
                            typeName: "sint8",
                            invalidValue: 0x7F as Int8,
                            size: 1,
                            isSigned: true,
                            isInteger: true),
                    FitType(endianAbility: false,
                            baseTypeField: 0x02,
                            typeName: "uint8",
                            invalidValue: 0xFF as UInt8,
                            size: 1,
                            isSigned: false,
                            isInteger: true),
                    FitType(endianAbility: true,
                            baseTypeField: 0x83,
                            typeName: "sint16",
                            invalidValue: 0x7FFF as Int16,
                            size: 2,
                            isSigned: true,
                            isInteger: true),
                    FitType(endianAbility: true,
                            baseTypeField: 0x84,
                            typeName: "uint16",
                            invalidValue: 0xFFFF as UInt16,
                            size: 2,
                            isSigned: false,
                            isInteger: true),
                    FitType(endianAbility: true,
                            baseTypeField: 0x85,
                            typeName: "sint32",
                            invalidValue: 0x7FFFFFFF as Int32,
                            size: 4,
                            isSigned: true,
                            isInteger: true),
                    FitType(endianAbility: true,
                            baseTypeField: 0x86,
                            typeName: "uint32",
                            invalidValue: 0xFFFFFFFF as UInt32,
                            size: 4,
                            isSigned: false,
                            isInteger: true),
                    FitType(endianAbility: false,
                            baseTypeField: 0x07,
                            typeName: "string",
                            invalidValue: 0x00 as UInt8,
                            size: 1,
                            isSigned: false,
                            isInteger: false),
                    FitType(endianAbility: true,
                            baseTypeField: 0x88,
                            typeName: "float32",
                            invalidValue: 0xFFFFFFFF as Float32,
                            size: 4,
                            isSigned: true,
                            isInteger: false),
                    FitType(endianAbility: true,
                            baseTypeField: 0x89,
                            typeName: "float64",
                            invalidValue: 0xFFFFFFFFFFFFFFFF as Float64,
                            size: 8,
                            isSigned: true,
                            isInteger: false),
                    FitType(endianAbility: false,
                            baseTypeField: 0x0A,
                            typeName: "uint8z",
                            invalidValue: 0x00 as UInt8,
                            size: 1,
                            isSigned: false,
                            isInteger: true),
                    FitType(endianAbility: true,
                            baseTypeField: 0x8B,
                            typeName: "uint16z",
                            invalidValue: 0x0000 as UInt16,
                            size: 2,
                            isSigned: false,
                            isInteger: true),
                    FitType(endianAbility: true,
                            baseTypeField: 0x8C,
                            typeName: "uint32z",
                            invalidValue: 0x00000000 as UInt32,
                            size: 4,
                            isSigned: false,
                            isInteger: true),
                    FitType(endianAbility: false,
                            baseTypeField: 0x0D,
                            typeName: "byte",
                            invalidValue: 0xFF as UInt8,
                            size: 1,
                            isSigned: false,
                            isInteger: false),
                    FitType(endianAbility: true,
                            baseTypeField: 0x8E,
                            typeName: "sint64",
                            invalidValue: 0x7FFFFFFFFFFFFFFF as Int64,
                            size: 8,
                            isSigned: true,
                            isInteger: true),
                    FitType(endianAbility: true,
                            baseTypeField: 0x8F,
                            typeName: "uint64",
                            invalidValue: 0xFFFFFFFFFFFFFFFF as UInt64,
                            size: 8,
                            isSigned: false,
                            isInteger: true),
                    FitType(endianAbility: true,
                            baseTypeField: 0x90,
                            typeName: "uint64z",
                            invalidValue: 0x0000000000000000 as UInt64,
                            size: 8,
                            isSigned: false,
                            isInteger: true)
            ]
        }
    }
    
    public struct FitType {
        public var endianAbility: Bool
        public var baseTypeField: UInt8
        public var typeName: String
        public var invalidValue: Any
        public var size: UInt8
        public var isSigned: Bool
        public var isInteger: Bool
    }
    
    // Index into the BaseTypes array
    public static var Enum: UInt8 = 0x00
    public static var SInt8: UInt8 = 0x01
    public static var UInt8: UInt8 = 0x02
    public static var SInt16: UInt8 = 0x03
    public static var UInt16: UInt8 = 0x04
    public static var SInt32: UInt8 = 0x05
    public static var UInt32: UInt8 = 0x06
    public static var String: UInt8 = 0x07
    public static var Float32: UInt8 = 0x08
    public static var Float64: UInt8 = 0x09
    public static var UInt8z: UInt8 = 0x0A
    public static var UInt16z: UInt8 = 0x0B
    public static var UInt32z: UInt8 = 0x0C
    public static var Byte: UInt8 = 0x0D
    public static var SInt64: UInt8 = 0x0E
    public static var UInt64: UInt8 = 0x0F
    public static var UInt64z: UInt8 = 0x10

    public static var baseTypeNumMask: UInt8 = 0x1F
    
}
