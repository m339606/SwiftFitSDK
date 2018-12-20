public class VideoClipMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case ClipNumber = 0
        case StartTimestamp = 1
        case StartTimestampMs = 2
        case EndTimestamp = 3
        case EndTimestampMs = 4
        case ClipStart = 6
        case ClipEnd = 7
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.VideoClip))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getClipNumber() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setClipNumber(_ clipNumber: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: clipNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setStartTimestamp(_ startTimestamp: FitDateTime) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: startTimestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartTimestampMs() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStartTimestampMs(_ startTimestampMs: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: startTimestampMs, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEndTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setEndTimestamp(_ endTimestamp: FitDateTime) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: endTimestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEndTimestampMs() -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setEndTimestampMs(_ endTimestampMs: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: endTimestampMs, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getClipStart() -> UInt32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setClipStart(_ clipStart: UInt32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: clipStart, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getClipEnd() -> UInt32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setClipEnd(_ clipEnd: UInt32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: clipEnd, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
