public class HrMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case FractionalTimestamp = 0
        case Time256 = 1
        case FilteredBpm = 6
        case EventTimestamp = 9
        case EventTimestamp12 = 10
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Hr))
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
    
    public func getFractionalTimestamp() -> Float32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setFractionalTimestamp(_ fractionalTimestamp: Float32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: fractionalTimestamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTime256() -> Float32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTime256(_ time256: Float32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: time256, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumFilteredBpm() -> Int {
        return getNumFieldValues(fieldNum: 6, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFilteredBpm(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFilteredBpm(_ index: Int, _ filteredBpm: UInt8) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: index, value: filteredBpm, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumEventTimestamp() -> Int {
        return getNumFieldValues(fieldNum: 9, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEventTimestamp(_ index: Int) -> UInt32? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setEventTimestamp(_ index: Int, _ eventTimestamp: UInt32) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: index, value: eventTimestamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumEventTimestamp12() -> Int {
        return getNumFieldValues(fieldNum: 10, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEventTimestamp12(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setEventTimestamp12(_ index: Int, _ eventTimestamp12: UInt8) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: index, value: eventTimestamp12, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
