public class MonitoringInfoMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case LocalTimestamp = 0
        case ActivityType = 1
        case CyclesToDistance = 3
        case CyclesToCalories = 4
        case RestingMetabolicRate = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.MonitoringInfo))
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
    
    public func getLocalTimestamp() -> UInt32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setLocalTimestamp(_ localTimestamp: UInt32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: localTimestamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumActivityType() -> Int {
        return getNumFieldValues(fieldNum: 1, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getActivityType(_ index: Int) -> ActivityType? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ActivityType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setActivityType(_ index: Int, _ activityType: ActivityType) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: index, value: activityType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCyclesToDistance() -> Int {
        return getNumFieldValues(fieldNum: 3, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCyclesToDistance(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCyclesToDistance(_ index: Int, _ cyclesToDistance: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: index, value: cyclesToDistance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCyclesToCalories() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCyclesToCalories(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCyclesToCalories(_ index: Int, _ cyclesToCalories: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: cyclesToCalories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRestingMetabolicRate() -> UInt16? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setRestingMetabolicRate(_ restingMetabolicRate: UInt16) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: restingMetabolicRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
