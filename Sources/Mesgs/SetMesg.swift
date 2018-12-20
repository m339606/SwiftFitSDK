public class SetMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 254
        case Duration = 0
        case Repetitions = 3
        case Weight = 4
        case SetType = 5
        case StartTime = 6
        case Category = 7
        case CategorySubtype = 8
        case WeightDisplayUnit = 9
        case MessageIndex = 10
        case WktStepIndex = 11
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Set))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 254, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setTimestamp(_ timestamp: FitDateTime) {
        setFieldValue(fieldNum: 254, fieldArrayIndex: 0, value: timestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDuration() -> Float32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDuration(_ duration: Float32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: duration, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRepetitions() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setRepetitions(_ repetitions: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: repetitions, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWeight() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setWeight(_ weight: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: weight, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSetType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setSetType(_ setType: UInt8) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: setType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartTime() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setStartTime(_ startTime: FitDateTime) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: startTime.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCategory() -> Int {
        return getNumFieldValues(fieldNum: 7, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getCategory(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCategory(_ index: Int, _ category: UInt16) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: index, value: category, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCategorySubtype() -> Int {
        return getNumFieldValues(fieldNum: 8, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCategorySubtype(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCategorySubtype(_ index: Int, _ categorySubtype: UInt16) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: index, value: categorySubtype, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWeightDisplayUnit() -> UInt16? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setWeightDisplayUnit(_ weightDisplayUnit: UInt16) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: weightDisplayUnit, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMessageIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMessageIndex(_ messageIndex: UInt16) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: messageIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWktStepIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setWktStepIndex(_ wktStepIndex: UInt16) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: wktStepIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
