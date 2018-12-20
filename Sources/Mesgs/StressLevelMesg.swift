public class StressLevelMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case StressLevelValue = 0
        case StressLevelTime = 1
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.StressLevel))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getStressLevelValue() -> Int16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int16
        } else {
            return nil
        }
    }
    
    public func setStressLevelValue(_ stressLevelValue: Int16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: stressLevelValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStressLevelTime() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setStressLevelTime(_ stressLevelTime: FitDateTime) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: stressLevelTime.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
