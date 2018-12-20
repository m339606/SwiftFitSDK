public class ThreeDSensorCalibrationMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case SensorType = 0
        case CalibrationFactor = 1
        case CalibrationDivisor = 2
        case LevelShift = 3
        case OffsetCal = 4
        case OrientationMatrix = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.ThreeDSensorCalibration))
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
    
    public func getSensorType() -> SensorType? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SensorType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSensorType(_ sensorType: SensorType) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: sensorType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibrationFactor() -> UInt32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCalibrationFactor(_ calibrationFactor: UInt32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: calibrationFactor, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalibrationDivisor() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCalibrationDivisor(_ calibrationDivisor: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: calibrationDivisor, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLevelShift() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setLevelShift(_ levelShift: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: levelShift, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumOffsetCal() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOffsetCal(_ index: Int) -> Int32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setOffsetCal(_ index: Int, _ offsetCal: Int32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: offsetCal, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumOrientationMatrix() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOrientationMatrix(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setOrientationMatrix(_ index: Int, _ orientationMatrix: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: orientationMatrix, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
