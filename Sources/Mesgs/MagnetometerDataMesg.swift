public class MagnetometerDataMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case SampleTimeOffset = 1
        case MagX = 2
        case MagY = 3
        case MagZ = 4
        case CalibratedMagX = 5
        case CalibratedMagY = 6
        case CalibratedMagZ = 7
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.MagnetometerData))
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
    
    public func getNumMagX() -> Int {
        return getNumFieldValues(fieldNum: 2, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMagX(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMagX(_ index: Int, _ magX: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: magX, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMagY() -> Int {
        return getNumFieldValues(fieldNum: 3, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMagY(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMagY(_ index: Int, _ magY: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: index, value: magY, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMagZ() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMagZ(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMagZ(_ index: Int, _ magZ: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: magZ, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedMagX() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedMagX(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedMagX(_ index: Int, _ calibratedMagX: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: calibratedMagX, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedMagY() -> Int {
        return getNumFieldValues(fieldNum: 6, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedMagY(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedMagY(_ index: Int, _ calibratedMagY: Float32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: index, value: calibratedMagY, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedMagZ() -> Int {
        return getNumFieldValues(fieldNum: 7, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedMagZ(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedMagZ(_ index: Int, _ calibratedMagZ: Float32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: index, value: calibratedMagZ, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
