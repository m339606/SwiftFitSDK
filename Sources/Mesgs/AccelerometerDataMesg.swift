public class AccelerometerDataMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case SampleTimeOffset = 1
        case AccelX = 2
        case AccelY = 3
        case AccelZ = 4
        case CalibratedAccelX = 5
        case CalibratedAccelY = 6
        case CalibratedAccelZ = 7
        case CompressedCalibratedAccelX = 8
        case CompressedCalibratedAccelY = 9
        case CompressedCalibratedAccelZ = 10
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.AccelerometerData))
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
    
    public func getNumAccelX() -> Int {
        return getNumFieldValues(fieldNum: 2, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAccelX(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAccelX(_ index: Int, _ accelX: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: accelX, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAccelY() -> Int {
        return getNumFieldValues(fieldNum: 3, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAccelY(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAccelY(_ index: Int, _ accelY: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: index, value: accelY, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAccelZ() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAccelZ(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAccelZ(_ index: Int, _ accelZ: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: accelZ, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedAccelX() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedAccelX(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedAccelX(_ index: Int, _ calibratedAccelX: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: calibratedAccelX, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedAccelY() -> Int {
        return getNumFieldValues(fieldNum: 6, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedAccelY(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedAccelY(_ index: Int, _ calibratedAccelY: Float32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: index, value: calibratedAccelY, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCalibratedAccelZ() -> Int {
        return getNumFieldValues(fieldNum: 7, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibratedAccelZ(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalibratedAccelZ(_ index: Int, _ calibratedAccelZ: Float32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: index, value: calibratedAccelZ, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCompressedCalibratedAccelX() -> Int {
        return getNumFieldValues(fieldNum: 8, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCompressedCalibratedAccelX(_ index: Int) -> Int16? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int16
        } else {
            return nil
        }
    }
    
    public func setCompressedCalibratedAccelX(_ index: Int, _ compressedCalibratedAccelX: Int16) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: index, value: compressedCalibratedAccelX, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCompressedCalibratedAccelY() -> Int {
        return getNumFieldValues(fieldNum: 9, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCompressedCalibratedAccelY(_ index: Int) -> Int16? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int16
        } else {
            return nil
        }
    }
    
    public func setCompressedCalibratedAccelY(_ index: Int, _ compressedCalibratedAccelY: Int16) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: index, value: compressedCalibratedAccelY, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCompressedCalibratedAccelZ() -> Int {
        return getNumFieldValues(fieldNum: 10, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCompressedCalibratedAccelZ(_ index: Int) -> Int16? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int16
        } else {
            return nil
        }
    }
    
    public func setCompressedCalibratedAccelZ(_ index: Int, _ compressedCalibratedAccelZ: Int16) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: index, value: compressedCalibratedAccelZ, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

