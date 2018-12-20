public class FileCapabilitiesMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case `Type` = 0
        case Flags = 1
        case Directory = 2
        case MaxCount = 3
        case MaxSize = 4
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.FileCapabilities))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getMessageIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 254, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMessageIndex(_ messageIndex: UInt16) {
        setFieldValue(fieldNum: 254, fieldArrayIndex: 0, value: messageIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getType() -> FitFileType? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitFileType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setType(_ type: FitFileType) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: type.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFlags() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFlags(_ flags: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: flags, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDirectory() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getDirectoryAsString() -> String? {
        if let val = getDirectory() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setDirectory(_ directory: String) {
        if var data = directory.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setDirectory(_ directory: [UInt8]) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: directory, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxCount() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMaxCount(_ maxCount: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: maxCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxSize() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setMaxSize(_ maxSize: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: maxSize, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
