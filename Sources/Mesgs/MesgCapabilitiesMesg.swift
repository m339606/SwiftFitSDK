public class MesgCapabilitiesMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case File = 0
        case MesgNum = 1
        case CountType = 2
        case Count = 3
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.MesgCapabilities))
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
    
    public func getFile() -> FitFileType? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitFileType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setFile(_ file: FitFileType) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: file.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMesgNum() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMesgNum(_ mesgNum: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: mesgNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCountType() -> MesgCount? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return MesgCount(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setCountType(_ countType: MesgCount) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: countType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCount() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCount(_ count: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: count, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
