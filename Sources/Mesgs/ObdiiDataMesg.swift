public class ObdiiDataMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case TimeOffset = 1
        case Pid = 2
        case RawData = 3
        case PidDataSize = 4
        case SystemTime = 5
        case StartTimestamp = 6
        case StartTimestampMs = 7
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.ObdiiData))
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
    
    public func getNumTimeOffset() -> Int {
        return getNumFieldValues(fieldNum: 1, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeOffset(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTimeOffset(_ index: Int, _ timeOffset: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: index, value: timeOffset, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPid() -> UInt8? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setPid(_ pid: UInt8) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: pid, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumRawData() -> Int {
        return getNumFieldValues(fieldNum: 3, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRawData(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setRawData(_ index: Int, _ rawData: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: index, value: rawData, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumPidDataSize() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPidDataSize(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setPidDataSize(_ index: Int, _ pidDataSize: UInt8) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: pidDataSize, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumSystemTime() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSystemTime(_ index: Int) -> UInt32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setSystemTime(_ index: Int, _ systemTime: UInt32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: systemTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setStartTimestamp(_ startTimestamp: FitDateTime) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: startTimestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartTimestampMs() -> UInt16? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStartTimestampMs(_ startTimestampMs: UInt16) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: startTimestampMs, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
