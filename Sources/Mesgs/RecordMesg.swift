public class RecordMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case PositionLat = 0
        case PositionLong = 1
        case Altitude = 2
        case HeartRate = 3
        case Cadence = 4
        case Distance = 5
        case Speed = 6
        case Power = 7
        case CompressedSpeedDistance = 8
        case Grade = 9
        case Resistance = 10
        case TimeFromCourse = 11
        case CycleLength = 12
        case Temperature = 13
        case Speed1S = 17
        case Cycles = 18
        case TotalCycles = 19
        case CompressedAccumulatedPower = 28
        case AccumulatedPower = 29
        case LeftRightBalance = 30
        case GpsAccuracy = 31
        case VerticalSpeed = 32
        case Calories = 33
        case VerticalOscillation = 39
        case StanceTimePercent = 40
        case StanceTime = 41
        case ActivityType = 42
        case LeftTorqueEffectiveness = 43
        case RightTorqueEffectiveness = 44
        case LeftPedalSmoothness = 45
        case RightPedalSmoothness = 46
        case CombinedPedalSmoothness = 47
        case Time128 = 48
        case StrokeType = 49
        case Zone = 50
        case BallSpeed = 51
        case Cadence256 = 52
        case FractionalCadence = 53
        case TotalHemoglobinConc = 54
        case TotalHemoglobinConcMin = 55
        case TotalHemoglobinConcMax = 56
        case SaturatedHemoglobinPercent = 57
        case SaturatedHemoglobinPercentMin = 58
        case SaturatedHemoglobinPercentMax = 59
        case DeviceIndex = 62
        case LeftPco = 67
        case RightPco = 68
        case LeftPowerPhase = 69
        case LeftPowerPhasePeak = 70
        case RightPowerPhase = 71
        case RightPowerPhasePeak = 72
        case EnhancedSpeed = 73
        case EnhancedAltitude = 78
        case BatterySoc = 81
        case MotorPower = 82
        case VerticalRatio = 83
        case StanceTimeBalance = 84
        case StepLength = 85
        case AbsolutePressure = 91
        case Depth = 92
        case NextStopDepth = 93
        case NextStopTime = 94
        case TimeToSurface = 95
        case NdlTime = 96
        case CnsLoad = 97
        case N2Load = 98
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Record))
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
    
    public func getPositionLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setPositionLat(_ positionLat: Int32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: positionLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPositionLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setPositionLong(_ positionLong: Int32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: positionLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAltitude(_ altitude: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: altitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHeartRate(_ heartRate: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: heartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setCadence(_ cadence: UInt8) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: cadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDistance(_ distance: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: distance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSpeed(_ speed: Float32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: speed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setPower(_ power: UInt16) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: power, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumCompressedSpeedDistance() -> Int {
        return getNumFieldValues(fieldNum: 8, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getCompressedSpeedDistance(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setCompressedSpeedDistance(_ index: Int, _ compressedSpeedDistance: UInt8) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: index, value: compressedSpeedDistance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setGrade(_ grade: Float32) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: grade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getResistance() -> UInt8? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setResistance(_ resistance: UInt8) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: resistance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeFromCourse() -> Float32? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeFromCourse(_ timeFromCourse: Float32) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: timeFromCourse, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCycleLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCycleLength(_ cycleLength: Float32) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: cycleLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setTemperature(_ temperature: Int8) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: temperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumSpeed1S() -> Int {
        return getNumFieldValues(fieldNum: 17, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSpeed1S(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 17, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSpeed1S(_ index: Int, _ speed1S: Float32) {
        setFieldValue(fieldNum: 17, fieldArrayIndex: index, value: speed1S, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCycles() -> UInt8? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setCycles(_ cycles: UInt8) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: cycles, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalCycles() -> UInt32? {
        if let val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTotalCycles(_ totalCycles: UInt32) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: totalCycles, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCompressedAccumulatedPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 28, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCompressedAccumulatedPower(_ compressedAccumulatedPower: UInt16) {
        setFieldValue(fieldNum: 28, fieldArrayIndex: 0, value: compressedAccumulatedPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAccumulatedPower() -> UInt32? {
        if let val = getFieldValue(fieldNum: 29, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setAccumulatedPower(_ accumulatedPower: UInt32) {
        setFieldValue(fieldNum: 29, fieldArrayIndex: 0, value: accumulatedPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftRightBalance() -> UInt8? {
        if let val = getFieldValue(fieldNum: 30, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setLeftRightBalance(_ leftRightBalance: UInt8) {
        setFieldValue(fieldNum: 30, fieldArrayIndex: 0, value: leftRightBalance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGpsAccuracy() -> UInt8? {
        if let val = getFieldValue(fieldNum: 31, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setGpsAccuracy(_ gpsAccuracy: UInt8) {
        setFieldValue(fieldNum: 31, fieldArrayIndex: 0, value: gpsAccuracy, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 32, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setVerticalSpeed(_ verticalSpeed: Float32) {
        setFieldValue(fieldNum: 32, fieldArrayIndex: 0, value: verticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalories() -> UInt16? {
        if let val = getFieldValue(fieldNum: 33, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCalories(_ calories: UInt16) {
        setFieldValue(fieldNum: 33, fieldArrayIndex: 0, value: calories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getVerticalOscillation() -> Float32? {
        if let val = getFieldValue(fieldNum: 39, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setVerticalOscillation(_ verticalOscillation: Float32) {
        setFieldValue(fieldNum: 39, fieldArrayIndex: 0, value: verticalOscillation, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStanceTimePercent() -> Float32? {
        if let val = getFieldValue(fieldNum: 40, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setStanceTimePercent(_ stanceTimePercent: Float32) {
        setFieldValue(fieldNum: 40, fieldArrayIndex: 0, value: stanceTimePercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStanceTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 41, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setStanceTime(_ stanceTime: Float32) {
        setFieldValue(fieldNum: 41, fieldArrayIndex: 0, value: stanceTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActivityType() -> ActivityType? {
        if let val = getFieldValue(fieldNum: 42, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ActivityType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setActivityType(_ activityType: ActivityType) {
        setFieldValue(fieldNum: 42, fieldArrayIndex: 0, value: activityType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftTorqueEffectiveness() -> Float32? {
        if let val = getFieldValue(fieldNum: 43, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setLeftTorqueEffectiveness(_ leftTorqueEffectiveness: Float32) {
        setFieldValue(fieldNum: 43, fieldArrayIndex: 0, value: leftTorqueEffectiveness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRightTorqueEffectiveness() -> Float32? {
        if let val = getFieldValue(fieldNum: 44, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setRightTorqueEffectiveness(_ rightTorqueEffectiveness: Float32) {
        setFieldValue(fieldNum: 44, fieldArrayIndex: 0, value: rightTorqueEffectiveness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 45, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setLeftPedalSmoothness(_ leftPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 45, fieldArrayIndex: 0, value: leftPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRightPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 46, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setRightPedalSmoothness(_ rightPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 46, fieldArrayIndex: 0, value: rightPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCombinedPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 47, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCombinedPedalSmoothness(_ combinedPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 47, fieldArrayIndex: 0, value: combinedPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTime128() -> Float32? {
        if let val = getFieldValue(fieldNum: 48, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTime128(_ time128: Float32) {
        setFieldValue(fieldNum: 48, fieldArrayIndex: 0, value: time128, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStrokeType() -> StrokeType? {
        if let val = getFieldValue(fieldNum: 49, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return StrokeType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setStrokeType(_ strokeType: StrokeType) {
        setFieldValue(fieldNum: 49, fieldArrayIndex: 0, value: strokeType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getZone() -> UInt8? {
        if let val = getFieldValue(fieldNum: 50, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setZone(_ zone: UInt8) {
        setFieldValue(fieldNum: 50, fieldArrayIndex: 0, value: zone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBallSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 51, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBallSpeed(_ ballSpeed: Float32) {
        setFieldValue(fieldNum: 51, fieldArrayIndex: 0, value: ballSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCadence256() -> Float32? {
        if let val = getFieldValue(fieldNum: 52, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCadence256(_ cadence256: Float32) {
        setFieldValue(fieldNum: 52, fieldArrayIndex: 0, value: cadence256, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFractionalCadence() -> Float32? {
        if let val = getFieldValue(fieldNum: 53, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setFractionalCadence(_ fractionalCadence: Float32) {
        setFieldValue(fieldNum: 53, fieldArrayIndex: 0, value: fractionalCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalHemoglobinConc() -> Float32? {
        if let val = getFieldValue(fieldNum: 54, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalHemoglobinConc(_ totalHemoglobinConc: Float32) {
        setFieldValue(fieldNum: 54, fieldArrayIndex: 0, value: totalHemoglobinConc, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalHemoglobinConcMin() -> Float32? {
        if let val = getFieldValue(fieldNum: 55, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalHemoglobinConcMin(_ totalHemoglobinConcMin: Float32) {
        setFieldValue(fieldNum: 55, fieldArrayIndex: 0, value: totalHemoglobinConcMin, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalHemoglobinConcMax() -> Float32? {
        if let val = getFieldValue(fieldNum: 56, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalHemoglobinConcMax(_ totalHemoglobinConcMax: Float32) {
        setFieldValue(fieldNum: 56, fieldArrayIndex: 0, value: totalHemoglobinConcMax, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSaturatedHemoglobinPercent() -> Float32? {
        if let val = getFieldValue(fieldNum: 57, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSaturatedHemoglobinPercent(_ saturatedHemoglobinPercent: Float32) {
        setFieldValue(fieldNum: 57, fieldArrayIndex: 0, value: saturatedHemoglobinPercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSaturatedHemoglobinPercentMin() -> Float32? {
        if let val = getFieldValue(fieldNum: 58, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSaturatedHemoglobinPercentMin(_ saturatedHemoglobinPercentMin: Float32) {
        setFieldValue(fieldNum: 58, fieldArrayIndex: 0, value: saturatedHemoglobinPercentMin, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSaturatedHemoglobinPercentMax() -> Float32? {
        if let val = getFieldValue(fieldNum: 59, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSaturatedHemoglobinPercentMax(_ saturatedHemoglobinPercentMax: Float32) {
        setFieldValue(fieldNum: 59, fieldArrayIndex: 0, value: saturatedHemoglobinPercentMax, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDeviceIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 62, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeviceIndex(_ deviceIndex: UInt8) {
        setFieldValue(fieldNum: 62, fieldArrayIndex: 0, value: deviceIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftPco() -> Int8? {
        if let val = getFieldValue(fieldNum: 67, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setLeftPco(_ leftPco: Int8) {
        setFieldValue(fieldNum: 67, fieldArrayIndex: 0, value: leftPco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRightPco() -> Int8? {
        if let val = getFieldValue(fieldNum: 68, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setRightPco(_ rightPco: Int8) {
        setFieldValue(fieldNum: 68, fieldArrayIndex: 0, value: rightPco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumLeftPowerPhase() -> Int {
        return getNumFieldValues(fieldNum: 69, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftPowerPhase(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 69, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setLeftPowerPhase(_ index: Int, _ leftPowerPhase: Float32) {
        setFieldValue(fieldNum: 69, fieldArrayIndex: index, value: leftPowerPhase, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumLeftPowerPhasePeak() -> Int {
        return getNumFieldValues(fieldNum: 70, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftPowerPhasePeak(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 70, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setLeftPowerPhasePeak(_ index: Int, _ leftPowerPhasePeak: Float32) {
        setFieldValue(fieldNum: 70, fieldArrayIndex: index, value: leftPowerPhasePeak, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumRightPowerPhase() -> Int {
        return getNumFieldValues(fieldNum: 71, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRightPowerPhase(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 71, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setRightPowerPhase(_ index: Int, _ rightPowerPhase: Float32) {
        setFieldValue(fieldNum: 71, fieldArrayIndex: index, value: rightPowerPhase, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumRightPowerPhasePeak() -> Int {
        return getNumFieldValues(fieldNum: 72, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRightPowerPhasePeak(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 72, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setRightPowerPhasePeak(_ index: Int, _ rightPowerPhasePeak: Float32) {
        setFieldValue(fieldNum: 72, fieldArrayIndex: index, value: rightPowerPhasePeak, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 73, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedSpeed(_ enhancedSpeed: Float32) {
        setFieldValue(fieldNum: 73, fieldArrayIndex: 0, value: enhancedSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 78, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedAltitude(_ enhancedAltitude: Float32) {
        setFieldValue(fieldNum: 78, fieldArrayIndex: 0, value: enhancedAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBatterySoc() -> Float32? {
        if let val = getFieldValue(fieldNum: 81, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBatterySoc(_ batterySoc: Float32) {
        setFieldValue(fieldNum: 81, fieldArrayIndex: 0, value: batterySoc, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMotorPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 82, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMotorPower(_ motorPower: UInt16) {
        setFieldValue(fieldNum: 82, fieldArrayIndex: 0, value: motorPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getVerticalRatio() -> Float32? {
        if let val = getFieldValue(fieldNum: 83, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setVerticalRatio(_ verticalRatio: Float32) {
        setFieldValue(fieldNum: 83, fieldArrayIndex: 0, value: verticalRatio, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStanceTimeBalance() -> Float32? {
        if let val = getFieldValue(fieldNum: 84, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setStanceTimeBalance(_ stanceTimeBalance: Float32) {
        setFieldValue(fieldNum: 84, fieldArrayIndex: 0, value: stanceTimeBalance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStepLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 85, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setStepLength(_ stepLength: Float32) {
        setFieldValue(fieldNum: 85, fieldArrayIndex: 0, value: stepLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAbsolutePressure() -> UInt32? {
        if let val = getFieldValue(fieldNum: 91, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setAbsolutePressure(_ absolutePressure: UInt32) {
        setFieldValue(fieldNum: 91, fieldArrayIndex: 0, value: absolutePressure, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDepth() -> Float32? {
        if let val = getFieldValue(fieldNum: 92, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDepth(_ depth: Float32) {
        setFieldValue(fieldNum: 92, fieldArrayIndex: 0, value: depth, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNextStopDepth() -> Float32? {
        if let val = getFieldValue(fieldNum: 93, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setNextStopDepth(_ nextStopDepth: Float32) {
        setFieldValue(fieldNum: 93, fieldArrayIndex: 0, value: nextStopDepth, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNextStopTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 94, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setNextStopTime(_ nextStopTime: UInt32) {
        setFieldValue(fieldNum: 94, fieldArrayIndex: 0, value: nextStopTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeToSurface() -> UInt32? {
        if let val = getFieldValue(fieldNum: 95, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTimeToSurface(_ timeToSurface: UInt32) {
        setFieldValue(fieldNum: 95, fieldArrayIndex: 0, value: timeToSurface, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNdlTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 96, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setNdlTime(_ ndlTime: UInt32) {
        setFieldValue(fieldNum: 96, fieldArrayIndex: 0, value: ndlTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCnsLoad() -> UInt8? {
        if let val = getFieldValue(fieldNum: 97, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setCnsLoad(_ cnsLoad: UInt8) {
        setFieldValue(fieldNum: 97, fieldArrayIndex: 0, value: cnsLoad, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getN2Load() -> UInt16? {
        if let val = getFieldValue(fieldNum: 98, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setN2Load(_ n2Load: UInt16) {
        setFieldValue(fieldNum: 98, fieldArrayIndex: 0, value: n2Load, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
