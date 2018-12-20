public class TotalsMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Timestamp = 253
        case TimerTime = 0
        case Distance = 1
        case Calories = 2
        case Sport = 3
        case ElapsedTime = 4
        case Sessions = 5
        case ActiveTime = 6
        case SportIndex = 9
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Totals))
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
    
    public func getTimerTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTimerTime(_ timerTime: UInt32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: timerTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDistance() -> UInt32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDistance(_ distance: UInt32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: distance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalories() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCalories(_ calories: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: calories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getElapsedTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setElapsedTime(_ elapsedTime: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: elapsedTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSessions() -> UInt16? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setSessions(_ sessions: UInt16) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: sessions, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActiveTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setActiveTime(_ activeTime: UInt32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: activeTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSportIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setSportIndex(_ sportIndex: UInt8) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: sportIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
