public class OhrSettingsMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case Enabled = 0
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.OhrSettings))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 253, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setTimestamp(_ timestamp: FitDateTime) {
        setFieldValue(fieldNum: 253, fieldArrayIndex: 0, value: timestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnabled() -> Switch? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Switch(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEnabled(_ enabled: Switch) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: enabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
