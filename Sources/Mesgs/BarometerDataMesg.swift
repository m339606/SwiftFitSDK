public class BarometerDataMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case SampleTimeOffset = 1
        case BaroPres = 2
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.BarometerData))
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
    
    public func getNumSampleTimeOffset() -> Int {
        return getNumFieldValues(fieldNum: 1, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSampleTimeOffset(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setSampleTimeOffset(_ index: Int, _ sampleTimeOffset: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: index, value: sampleTimeOffset, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumBaroPres() -> Int {
        return getNumFieldValues(fieldNum: 2, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBaroPres(_ index: Int) -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setBaroPres(_ index: Int, _ baroPres: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: baroPres, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

