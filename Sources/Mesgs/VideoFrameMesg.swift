public class VideoFrameMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case FrameNumber = 1
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.VideoFrame))
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
    
    public func getTimestampMs() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTimestampMs(_ timestampMs: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: timestampMs, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFrameNumber() -> UInt32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setFrameNumber(_ frameNumber: UInt32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: frameNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
