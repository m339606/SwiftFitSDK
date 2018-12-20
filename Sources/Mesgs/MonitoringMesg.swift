public class MonitoringMesg : Mesg {
    
    public enum CyclesSubfield: UInt16 {
        case Steps = 0
        case Strokes = 1
        case Subfields = 2
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case DeviceIndex = 0
        case Calories = 1
        case Distance = 2
        case Cycles = 3
        case ActiveTime = 4
        case ActivityType = 5
        case ActivitySubtype = 6
        case ActivityLevel = 7
        case Distance16 = 8
        case Cycles16 = 9
        case ActiveTime16 = 10
        case LocalTimestamp = 11
        case Temperature = 12
        case TemperatureMin = 14
        case TemperatureMax = 15
        case ActivityTime = 16
        case ActiveCalories = 19
        case CurrentActivityTypeIntensity = 24
        case TimestampMin8 = 25
        case Timestamp16 = 26
        case HeartRate = 27
        case Intensity = 28
        case DurationMin = 29
        case Duration = 30
        case Ascent = 31
        case Descent = 32
        case ModerateActivityMinutes = 33
        case VigorousActivityMinutes = 34
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Monitoring))
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
    
    public func getDeviceIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeviceIndex(_ deviceIndex: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: deviceIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalories() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCalories(_ calories: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: calories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDistance(_ distance: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: distance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCycles() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCycles(_ cycles: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: cycles, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getSteps() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: CyclesSubfield.Steps.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setSteps(_ steps: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: steps, subfieldIndex: CyclesSubfield.Steps.rawValue)
    }
    
    public func getStrokes() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: CyclesSubfield.Steps.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setStrokes(_ strokes: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: strokes, subfieldIndex: CyclesSubfield.Strokes.rawValue)
    }
    
    public func getActiveTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setActiveTime(_ activeTime: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: activeTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActivityType() -> ActivityType? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ActivityType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setActivityType(_ activityType: ActivityType) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: activityType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActivitySubtype() -> ActivitySubtype? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ActivitySubtype(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setActivitySubtype(_ activitySubtype: ActivitySubtype) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: activitySubtype.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActivityLevel() -> ActivityLevel? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ActivityLevel(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setActivityLevel(_ activityLevel: ActivityLevel) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: activityLevel.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDistance16() -> UInt16? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setDistance16(_ distance16: UInt16) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: distance16, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCycles16() -> UInt16? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCycles16(_ cycles16: UInt16) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: cycles16, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActiveTime16() -> UInt16? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setActiveTime16(_ activeTime16: UInt16) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: activeTime16, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLocalTimestamp() -> UInt32? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setLocalTimestamp(_ localTimestamp: UInt32) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: localTimestamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTemperature() -> Float32? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTemperature(_ temperature: Float32) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: temperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTemperatureMin() -> Float32? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTemperatureMin(_ temperatureMin: Float32) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: temperatureMin, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTemperatureMax() -> Float32? {
        if let val = getFieldValue(fieldNum: 15, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTemperatureMax(_ temperatureMax: Float32) {
        setFieldValue(fieldNum: 15, fieldArrayIndex: 0, value: temperatureMax, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumActivityTime() -> Int {
        return getNumFieldValues(fieldNum: 16, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getActivityTime(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 16, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setActivityTime(_ index: Int, _ activityTime: UInt16) {
        setFieldValue(fieldNum: 16, fieldArrayIndex: index, value: activityTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActiveCalories() -> UInt16? {
        if let val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setActiveCalories(_ activeCalories: UInt16) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: activeCalories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCurrentActivityTypeIntensity() -> UInt8? {
        if let val = getFieldValue(fieldNum: 24, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setCurrentActivityTypeIntensity(_ currentActivityTypeIntensity: UInt8) {
        setFieldValue(fieldNum: 24, fieldArrayIndex: 0, value: currentActivityTypeIntensity, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimestampMin8() -> UInt8? {
        if let val = getFieldValue(fieldNum: 25, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setTimestampMin8(_ timestampMin8: UInt8) {
        setFieldValue(fieldNum: 25, fieldArrayIndex: 0, value: timestampMin8, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimestamp16() -> UInt16? {
        if let val = getFieldValue(fieldNum: 26, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTimestamp16(_ timestamp16: UInt16) {
        setFieldValue(fieldNum: 26, fieldArrayIndex: 0, value: timestamp16, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 27, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHeartRate(_ heartRate: UInt8) {
        setFieldValue(fieldNum: 27, fieldArrayIndex: 0, value: heartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getIntensity() -> Float32? {
        if let val = getFieldValue(fieldNum: 28, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setIntensity(_ intensity: Float32) {
        setFieldValue(fieldNum: 28, fieldArrayIndex: 0, value: intensity, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDurationMin() -> UInt16? {
        if let val = getFieldValue(fieldNum: 29, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setDurationMin(_ durationMin: UInt16) {
        setFieldValue(fieldNum: 29, fieldArrayIndex: 0, value: durationMin, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDuration() -> UInt32? {
        if let val = getFieldValue(fieldNum: 30, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDuration(_ duration: UInt32) {
        setFieldValue(fieldNum: 30, fieldArrayIndex: 0, value: duration, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAscent() -> Float32? {
        if let val = getFieldValue(fieldNum: 31, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAscent(_ ascent: Float32) {
        setFieldValue(fieldNum: 31, fieldArrayIndex: 0, value: ascent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDescent() -> Float32? {
        if let val = getFieldValue(fieldNum: 32, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDescent(_ descent: Float32) {
        setFieldValue(fieldNum: 32, fieldArrayIndex: 0, value: descent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getModerateActivityMinutes() -> UInt16? {
        if let val = getFieldValue(fieldNum: 33, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setModerateActivityMinutes(_ moderateActivityMinutes: UInt16) {
        setFieldValue(fieldNum: 33, fieldArrayIndex: 0, value: moderateActivityMinutes, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getVigorousActivityMinutes() -> UInt16? {
        if let val = getFieldValue(fieldNum: 34, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setVigorousActivityMinutes(_ vigorousActivityMinutes: UInt16) {
        setFieldValue(fieldNum: 34, fieldArrayIndex: 0, value: vigorousActivityMinutes, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
