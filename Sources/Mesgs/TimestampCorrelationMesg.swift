public class TimestampCorrelationMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case FractionalTimestamp = 0
        case SystemTimestamp = 1
        case FractionalSystemTimestamp = 2
        case LocalTimestamp = 3
        case TimestampMs = 4
        case SystemTimestampMs = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.TimestampCorrelation))
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
    
    public func getSystemTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setSystemTimestamp(_ systemTimestamp: FitDateTime) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: systemTimestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFractionalSystemTimestamp() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setFractionalSystemTimestamp(_ fractionalSystemTimestamp: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: fractionalSystemTimestamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLocalTimestamp() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setLocalTimestamp(_ localTimestamp: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: localTimestamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimestampMs() -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTimestampMs(_ timestampMs: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: timestampMs, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSystemTimestampMs() -> UInt16? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setSystemTimestampMs(_ systemTimestampMs: UInt16) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: systemTimestampMs, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
