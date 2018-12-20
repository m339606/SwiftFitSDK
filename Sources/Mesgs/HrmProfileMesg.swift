public class HrmProfileMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Enabled = 0
        case HrmAntId = 1
        case LogHrv = 2
        case HrmAntIdTransType = 3
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.HrmProfile))
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
    
    public func getEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEnabled(_ enabled: FitBool) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: enabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHrmAntId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setHrmAntId(_ hrmAntId: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: hrmAntId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLogHrv() -> FitBool? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setLogHrv(_ logHrv: FitBool) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: logHrv.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHrmAntIdTransType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHrmAntIdTransType(_ hrmAntIdTransType: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: hrmAntIdTransType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
