public class GoalMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Sport = 0
        case SubSport = 1
        case StartDate = 2
        case EndDate = 3
        case `Type` = 4
        case Value = 5
        case Repeat = 6
        case TargetValue = 7
        case Recurrence = 8
        case RecurrenceValue = 9
        case Enabled = 10
        case Source = 11
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Goal))
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
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSubSport() -> SubSport? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSubSport(_ subSport: SubSport) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: subSport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartDate() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setStartDate(_ startDate: FitDateTime) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: startDate.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEndDate() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setEndDate(_ endDate: FitDateTime) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: endDate.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getType() -> Goal? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Goal(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setType(_ type: Goal) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: type.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getValue() -> UInt32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setValue(_ value: UInt32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: value, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRepeat() -> FitBool? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setRepeat(_ repeats: FitBool) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: repeats.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTargetValue() -> UInt32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTargetValue(_ targetValue: UInt32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: targetValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRecurrence() -> GoalRecurrence? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return GoalRecurrence(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setRecurrence(_ recurrence: GoalRecurrence) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: recurrence.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRecurrenceValue() -> UInt16? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setRecurrenceValue(_ recurrenceValue: UInt16) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: recurrenceValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEnabled(_ enabled: FitBool) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: enabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSource() -> GoalSource? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return GoalSource(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSource(_ source: GoalSource) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: source.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
