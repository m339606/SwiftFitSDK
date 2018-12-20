public class GyroscopeDataMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case SampleTimeOffset = 1
        case GyroX = 2
        case GyroY = 3
        case GyroZ = 4
        case CalibratedGyroX = 5
        case CalibratedGyroY = 6
        case CalibratedGyroZ = 7
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.GyroscopeData))
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
    
    public func getNumGyroX() -> Int {
        return getNumFieldValues(fieldNum: 2, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getGyroX(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setGyroX(_ index: Int, _ gyroX: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: gyroX, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumGyroY() -> Int {
        return getNumFieldValues(fieldNum: 3, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getGyroY(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setGyroY(_ index: Int, _ gyroY: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: index, value: gyroY, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumGyroZ() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGyroZ(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setGyroZ(_ index: Int, _ gyroZ: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: gyroZ, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedGyroX() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedGyroX(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedGyroX(_ index: Int, _ calibratedGyroX: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: calibratedGyroX, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedGyroY() -> Int {
        return getNumFieldValues(fieldNum: 6, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedGyroY(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedGyroY(_ index: Int, _ calibratedGyroY: Float32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: index, value: calibratedGyroY, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedGyroZ() -> Int {
        return getNumFieldValues(fieldNum: 7, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedGyroZ(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedGyroZ(_ index: Int, _ calibratedGyroZ: Float32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: index, value: calibratedGyroZ, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
