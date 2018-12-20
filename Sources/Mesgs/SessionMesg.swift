public class SessionMesg : Mesg {
    
    public enum TotalCyclesSubfield: UInt16 {
        case TotalStrides = 0
        case Subfields = 1
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum AvgCadenceSubfield: UInt16 {
        case AvgRunningCadence = 0
        case Subfields = 1
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum MaxCadenceSubfield: UInt16 {
        case MaxRunningCadence = 0
        case Subfields = 1
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Timestamp = 253
        case Event = 0
        case EventType = 1
        case StartTime = 2
        case StartPositionLat = 3
        case StartPositionLong = 4
        case Sport = 5
        case SubSport = 6
        case TotalElapsedTime = 7
        case TotalTimerTime = 8
        case TotalDistance = 9
        case TotalCycles = 10
        case TotalCalories = 11
        case TotalFatCalories = 13
        case AvgSpeed = 14
        case MaxSpeed = 15
        case AvgHeartRate = 16
        case MaxHeartRate = 17
        case AvgCadence = 18
        case MaxCadence = 19
        case AvgPower = 20
        case MaxPower = 21
        case TotalAscent = 22
        case TotalDescent = 23
        case TotalTrainingEffect = 24
        case FirstLapIndex = 25
        case NumLaps = 26
        case EventGroup = 27
        case Trigger = 28
        case NecLat = 29
        case NecLong = 30
        case SwcLat = 31
        case SwcLong = 32
        case NormalizedPower = 34
        case TrainingStressScore = 35
        case IntensityFactor = 36
        case LeftRightBalance = 37
        case AvgStrokeCount = 41
        case AvgStrokeDistance = 42
        case SwimStroke = 43
        case PoolLength = 44
        case ThresholdPower = 45
        case PoolLengthUnit = 46
        case NumActiveLengths = 47
        case TotalWork = 48
        case AvgAltitude = 49
        case MaxAltitude = 50
        case GpsAccuracy = 51
        case AvgGrade = 52
        case AvgPosGrade = 53
        case AvgNegGrade = 54
        case MaxPosGrade = 55
        case MaxNegGrade = 56
        case AvgTemperature = 57
        case MaxTemperature = 58
        case TotalMovingTime = 59
        case AvgPosVerticalSpeed = 60
        case AvgNegVerticalSpeed = 61
        case MaxPosVerticalSpeed = 62
        case MaxNegVerticalSpeed = 63
        case MinHeartRate = 64
        case TimeInHrZone = 65
        case TimeInSpeedZone = 66
        case TimeInCadenceZone = 67
        case TimeInPowerZone = 68
        case AvgLapTime = 69
        case BestLapIndex = 70
        case MinAltitude = 71
        case PlayerScore = 82
        case OpponentScore = 83
        case OpponentName = 84
        case StrokeCount = 85
        case ZoneCount = 86
        case MaxBallSpeed = 87
        case AvgBallSpeed = 88
        case AvgVerticalOscillation = 89
        case AvgStanceTimePercent = 90
        case AvgStanceTime = 91
        case AvgFractionalCadence = 92
        case MaxFractionalCadence = 93
        case TotalFractionalCycles = 94
        case AvgTotalHemoglobinConc = 95
        case MinTotalHemoglobinConc = 96
        case MaxTotalHemoglobinConc = 97
        case AvgSaturatedHemoglobinPercent = 98
        case MinSaturatedHemoglobinPercent = 99
        case MaxSaturatedHemoglobinPercent = 100
        case AvgLeftTorqueEffectiveness = 101
        case AvgRightTorqueEffectiveness = 102
        case AvgLeftPedalSmoothness = 103
        case AvgRightPedalSmoothness = 104
        case AvgCombinedPedalSmoothness = 105
        case SportIndex = 111
        case TimeStanding = 112
        case StandCount = 113
        case AvgLeftPco = 114
        case AvgRightPco = 115
        case AvgLeftPowerPhase = 116
        case AvgLeftPowerPhasePeak = 117
        case AvgRightPowerPhase = 118
        case AvgRightPowerPhasePeak = 119
        case AvgPowerPosition = 120
        case MaxPowerPosition = 121
        case AvgCadencePosition = 122
        case MaxCadencePosition = 123
        case EnhancedAvgSpeed = 124
        case EnhancedMaxSpeed = 125
        case EnhancedAvgAltitude = 126
        case EnhancedMinAltitude = 127
        case EnhancedMaxAltitude = 128
        case AvgLevMotorPower = 129
        case MaxLevMotorPower = 130
        case LevBatteryConsumption = 131
        case AvgVerticalRatio = 132
        case AvgStanceTimeBalance = 133
        case AvgStepLength = 134
        case TotalAnaerobicTrainingEffect = 137
        case AvgVam = 139
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Session))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getMessageIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 254, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMessageIndex(_ messageIndex: UInt16) {
        setFieldValue(fieldNum: 254, fieldArrayIndex: 0, value: messageIndex, subfieldIndex: Fit.subfieldIndexMainField)
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
    
    public func getEvent() -> Event? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Event(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEvent(_ event: Event) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: event.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEventType() -> EventType? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return EventType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEventType(_ eventType: EventType) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: eventType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartTime() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setStartTime(_ startTime: FitDateTime) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: startTime.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartPositionLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setStartPositionLat(_ startPositionLat: Int32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: startPositionLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartPositionLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setStartPositionLong(_ startPositionLong: Int32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: startPositionLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSubSport() -> SubSport? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSubSport(_ subSport: SubSport) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: subSport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalElapsedTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalElapsedTime(_ totalElapsedTime: Float32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: totalElapsedTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalTimerTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalTimerTime(_ totalTimerTime: Float32) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: totalTimerTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalDistance(_ totalDistance: Float32) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: totalDistance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalCycles() -> UInt32? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTotalCycles(_ totalCycles: UInt32) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: totalCycles, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalStrides() -> UInt32? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: TotalCyclesSubfield.TotalStrides.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTotalStrides(_ totalStrides: UInt32) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: totalStrides, subfieldIndex: TotalCyclesSubfield.TotalStrides.rawValue)
    }
    
    public func getTotalCalories() -> UInt16? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTotalCalories(_ totalCalories: UInt16) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: totalCalories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalFatCalories() -> UInt16? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTotalFatCalories(_ totalFatCalories: UInt16) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: totalFatCalories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgSpeed(_ avgSpeed: Float32) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: avgSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 15, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxSpeed(_ maxSpeed: Float32) {
        setFieldValue(fieldNum: 15, fieldArrayIndex: 0, value: maxSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 16, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgHeartRate(_ avgHeartRate: UInt8) {
        setFieldValue(fieldNum: 16, fieldArrayIndex: 0, value: avgHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 17, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxHeartRate(_ maxHeartRate: UInt8) {
        setFieldValue(fieldNum: 17, fieldArrayIndex: 0, value: maxHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgCadence(_ avgCadence: UInt8) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: avgCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRunningCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: AvgCadenceSubfield.AvgRunningCadence.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgRunningCadence(_ avgRunningCadence: UInt8) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: avgRunningCadence, subfieldIndex: AvgCadenceSubfield.AvgRunningCadence.rawValue)
    }
    
    public func getMaxCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxCadence(_ maxCadence: UInt8) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: maxCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxRunningCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: MaxCadenceSubfield.MaxRunningCadence.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxRunningCadence(_ maxRunningCadence: UInt8) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: maxRunningCadence, subfieldIndex: MaxCadenceSubfield.MaxRunningCadence.rawValue)
    }
    
    public func getAvgPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 20, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAvgPower(_ avgPower: UInt16) {
        setFieldValue(fieldNum: 20, fieldArrayIndex: 0, value: avgPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 21, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMaxPower(_ maxPower: UInt16) {
        setFieldValue(fieldNum: 21, fieldArrayIndex: 0, value: maxPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalAscent() -> UInt16? {
        if let val = getFieldValue(fieldNum: 22, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTotalAscent(_ totalAscent: UInt16) {
        setFieldValue(fieldNum: 22, fieldArrayIndex: 0, value: totalAscent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalDescent() -> UInt16? {
        if let val = getFieldValue(fieldNum: 23, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTotalDescent(_ totalDescent: UInt16) {
        setFieldValue(fieldNum: 23, fieldArrayIndex: 0, value: totalDescent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalTrainingEffect() -> Float32? {
        if let val = getFieldValue(fieldNum: 24, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalTrainingEffect(_ totalTrainingEffect: Float32) {
        setFieldValue(fieldNum: 24, fieldArrayIndex: 0, value: totalTrainingEffect, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFirstLapIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 25, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setFirstLapIndex(_ firstLapIndex: UInt16) {
        setFieldValue(fieldNum: 25, fieldArrayIndex: 0, value: firstLapIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumLaps() -> UInt16? {
        if let val = getFieldValue(fieldNum: 26, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNumLaps(_ numLaps: UInt16) {
        setFieldValue(fieldNum: 26, fieldArrayIndex: 0, value: numLaps, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEventGroup() -> UInt8? {
        if let val = getFieldValue(fieldNum: 27, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setEventGroup(_ eventGroup: UInt8) {
        setFieldValue(fieldNum: 27, fieldArrayIndex: 0, value: eventGroup, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTrigger() -> SessionTrigger? {
        if let val = getFieldValue(fieldNum: 28, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SessionTrigger(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setTrigger(_ trigger: SessionTrigger) {
        setFieldValue(fieldNum: 28, fieldArrayIndex: 0, value: trigger.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNecLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 29, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setNecLat(_ necLat: Int32) {
        setFieldValue(fieldNum: 29, fieldArrayIndex: 0, value: necLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNecLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 30, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setNecLong(_ necLong: Int32) {
        setFieldValue(fieldNum: 30, fieldArrayIndex: 0, value: necLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSwcLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 31, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setSwcLat(_ swcLat: Int32) {
        setFieldValue(fieldNum: 31, fieldArrayIndex: 0, value: swcLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSwcLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 32, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setSwcLong(_ swcLong: Int32) {
        setFieldValue(fieldNum: 32, fieldArrayIndex: 0, value: swcLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNormalizedPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 34, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNormalizedPower(_ normalizedPower: UInt16) {
        setFieldValue(fieldNum: 34, fieldArrayIndex: 0, value: normalizedPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTrainingStressScore() -> Float32? {
        if let val = getFieldValue(fieldNum: 35, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTrainingStressScore(_ trainingStressScore: Float32) {
        setFieldValue(fieldNum: 35, fieldArrayIndex: 0, value: trainingStressScore, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getIntensityFactor() -> Float32? {
        if let val = getFieldValue(fieldNum: 36, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setIntensityFactor(_ intensityFactor: Float32) {
        setFieldValue(fieldNum: 36, fieldArrayIndex: 0, value: intensityFactor, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftRightBalance() -> UInt16? {
        if let val = getFieldValue(fieldNum: 37, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setLeftRightBalance(_ leftRightBalance: UInt16) {
        setFieldValue(fieldNum: 37, fieldArrayIndex: 0, value: leftRightBalance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStrokeCount() -> Float32? {
        if let val = getFieldValue(fieldNum: 41, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStrokeCount(_ avgStrokeCount: Float32) {
        setFieldValue(fieldNum: 41, fieldArrayIndex: 0, value: avgStrokeCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStrokeDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 42, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStrokeDistance(_ avgStrokeDistance: Float32) {
        setFieldValue(fieldNum: 42, fieldArrayIndex: 0, value: avgStrokeDistance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSwimStroke() -> SwimStroke? {
        if let val = getFieldValue(fieldNum: 43, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SwimStroke(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSwimStroke(_ swimStroke: SwimStroke) {
        setFieldValue(fieldNum: 43, fieldArrayIndex: 0, value: swimStroke.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPoolLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 44, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPoolLength(_ poolLength: Float32) {
        setFieldValue(fieldNum: 44, fieldArrayIndex: 0, value: poolLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getThresholdPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 45, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setThresholdPower(_ thresholdPower: UInt16) {
        setFieldValue(fieldNum: 45, fieldArrayIndex: 0, value: thresholdPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPoolLengthUnit() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 46, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setPoolLengthUnit(_ poolLengthUnit: DisplayMeasure) {
        setFieldValue(fieldNum: 46, fieldArrayIndex: 0, value: poolLengthUnit.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumActiveLengths() -> UInt16? {
        if let val = getFieldValue(fieldNum: 47, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNumActiveLengths(_ numActiveLengths: UInt16) {
        setFieldValue(fieldNum: 47, fieldArrayIndex: 0, value: numActiveLengths, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalWork() -> UInt32? {
        if let val = getFieldValue(fieldNum: 48, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTotalWork(_ totalWork: UInt32) {
        setFieldValue(fieldNum: 48, fieldArrayIndex: 0, value: totalWork, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 49, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgAltitude(_ avgAltitude: Float32) {
        setFieldValue(fieldNum: 49, fieldArrayIndex: 0, value: avgAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 50, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxAltitude(_ maxAltitude: Float32) {
        setFieldValue(fieldNum: 50, fieldArrayIndex: 0, value: maxAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGpsAccuracy() -> UInt8? {
        if let val = getFieldValue(fieldNum: 51, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setGpsAccuracy(_ gpsAccuracy: UInt8) {
        setFieldValue(fieldNum: 51, fieldArrayIndex: 0, value: gpsAccuracy, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 52, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgGrade(_ avgGrade: Float32) {
        setFieldValue(fieldNum: 52, fieldArrayIndex: 0, value: avgGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPosGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 53, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgPosGrade(_ avgPosGrade: Float32) {
        setFieldValue(fieldNum: 53, fieldArrayIndex: 0, value: avgPosGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgNegGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 54, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgNegGrade(_ avgNegGrade: Float32) {
        setFieldValue(fieldNum: 54, fieldArrayIndex: 0, value: avgNegGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPosGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 55, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxPosGrade(_ maxPosGrade: Float32) {
        setFieldValue(fieldNum: 55, fieldArrayIndex: 0, value: maxPosGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxNegGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 56, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxNegGrade(_ maxNegGrade: Float32) {
        setFieldValue(fieldNum: 56, fieldArrayIndex: 0, value: maxNegGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 57, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgTemperature(_ avgTemperature: Int8) {
        setFieldValue(fieldNum: 57, fieldArrayIndex: 0, value: avgTemperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 58, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setMaxTemperature(_ maxTemperature: Int8) {
        setFieldValue(fieldNum: 58, fieldArrayIndex: 0, value: maxTemperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalMovingTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 59, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalMovingTime(_ totalMovingTime: Float32) {
        setFieldValue(fieldNum: 59, fieldArrayIndex: 0, value: totalMovingTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPosVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 60, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgPosVerticalSpeed(_ avgPosVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 60, fieldArrayIndex: 0, value: avgPosVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgNegVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 61, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgNegVerticalSpeed(_ avgNegVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 61, fieldArrayIndex: 0, value: avgNegVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPosVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 62, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxPosVerticalSpeed(_ maxPosVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 62, fieldArrayIndex: 0, value: maxPosVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxNegVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 63, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxNegVerticalSpeed(_ maxNegVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 63, fieldArrayIndex: 0, value: maxNegVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 64, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMinHeartRate(_ minHeartRate: UInt8) {
        setFieldValue(fieldNum: 64, fieldArrayIndex: 0, value: minHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInHrZone() -> Int {
        return getNumFieldValues(fieldNum: 65, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInHrZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 65, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInHrZone(_ index: Int, _ timeInHrZone: Float32) {
        setFieldValue(fieldNum: 65, fieldArrayIndex: index, value: timeInHrZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInSpeedZone() -> Int {
        return getNumFieldValues(fieldNum: 66, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInSpeedZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 66, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInSpeedZone(_ index: Int, _ timeInSpeedZone: Float32) {
        setFieldValue(fieldNum: 66, fieldArrayIndex: index, value: timeInSpeedZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInCadenceZone() -> Int {
        return getNumFieldValues(fieldNum: 67, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInCadenceZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 67, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInCadenceZone(_ index: Int, _ timeInCadenceZone: Float32) {
        setFieldValue(fieldNum: 67, fieldArrayIndex: index, value: timeInCadenceZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInPowerZone() -> Int {
        return getNumFieldValues(fieldNum: 68, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInPowerZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 68, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInPowerZone(_ index: Int, _ timeInPowerZone: Float32) {
        setFieldValue(fieldNum: 68, fieldArrayIndex: index, value: timeInPowerZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLapTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 69, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLapTime(_ avgLapTime: Float32) {
        setFieldValue(fieldNum: 69, fieldArrayIndex: 0, value: avgLapTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBestLapIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 70, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setBestLapIndex(_ bestLapIndex: UInt16) {
        setFieldValue(fieldNum: 70, fieldArrayIndex: 0, value: bestLapIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 71, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMinAltitude(_ minAltitude: Float32) {
        setFieldValue(fieldNum: 71, fieldArrayIndex: 0, value: minAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPlayerScore() -> UInt16? {
        if let val = getFieldValue(fieldNum: 82, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setPlayerScore(_ playerScore: UInt16) {
        setFieldValue(fieldNum: 82, fieldArrayIndex: 0, value: playerScore, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOpponentScore() -> UInt16? {
        if let val = getFieldValue(fieldNum: 83, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setOpponentScore(_ opponentScore: UInt16) {
        setFieldValue(fieldNum: 83, fieldArrayIndex: 0, value: opponentScore, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOpponentName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 84, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getOpponentNameAsString() -> String? {
        if let val = getOpponentName() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setOpponentName(_ opponentName: String) {
        if var data = opponentName.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 84, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setOpponentName(_ opponentName: [UInt8]) {
        setFieldValue(fieldNum: 84, fieldArrayIndex: 0, value: opponentName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumStrokeCount() -> Int {
        return getNumFieldValues(fieldNum: 85, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStrokeCount(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 85, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStrokeCount(_ index: Int, _ strokeCount: UInt16) {
        setFieldValue(fieldNum: 85, fieldArrayIndex: index, value: strokeCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumZoneCount() -> Int {
        return getNumFieldValues(fieldNum: 86, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getZoneCount(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 86, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setZoneCount(_ index: Int, _ zoneCount: UInt16) {
        setFieldValue(fieldNum: 86, fieldArrayIndex: index, value: zoneCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxBallSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 87, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxBallSpeed(_ maxBallSpeed: Float32) {
        setFieldValue(fieldNum: 87, fieldArrayIndex: 0, value: maxBallSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgBallSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 88, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgBallSpeed(_ avgBallSpeed: Float32) {
        setFieldValue(fieldNum: 88, fieldArrayIndex: 0, value: avgBallSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgVerticalOscillation() -> Float32? {
        if let val = getFieldValue(fieldNum: 89, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgVerticalOscillation(_ avgVerticalOscillation: Float32) {
        setFieldValue(fieldNum: 89, fieldArrayIndex: 0, value: avgVerticalOscillation, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStanceTimePercent() -> Float32? {
        if let val = getFieldValue(fieldNum: 90, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStanceTimePercent(_ avgStanceTimePercent: Float32) {
        setFieldValue(fieldNum: 90, fieldArrayIndex: 0, value: avgStanceTimePercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStanceTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 91, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStanceTime(_ avgStanceTime: Float32) {
        setFieldValue(fieldNum: 91, fieldArrayIndex: 0, value: avgStanceTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgFractionalCadence() -> Float32? {
        if let val = getFieldValue(fieldNum: 92, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgFractionalCadence(_ avgFractionalCadence: Float32) {
        setFieldValue(fieldNum: 92, fieldArrayIndex: 0, value: avgFractionalCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxFractionalCadence() -> Float32? {
        if let val = getFieldValue(fieldNum: 93, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxFractionalCadence(_ maxFractionalCadence: Float32) {
        setFieldValue(fieldNum: 93, fieldArrayIndex: 0, value: maxFractionalCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalFractionalCycles() -> Float32? {
        if let val = getFieldValue(fieldNum: 94, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalFractionalCycles(_ totalFractionalCycles: Float32) {
        setFieldValue(fieldNum: 94, fieldArrayIndex: 0, value: totalFractionalCycles, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgTotalHemoglobinConc() -> Int {
        return getNumFieldValues(fieldNum: 95, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgTotalHemoglobinConc(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 95, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgTotalHemoglobinConc(_ index: Int, _ avgTotalHemoglobinConc: Float32) {
        setFieldValue(fieldNum: 95, fieldArrayIndex: index, value: avgTotalHemoglobinConc, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMinTotalHemoglobinConc() -> Int {
        return getNumFieldValues(fieldNum: 96, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinTotalHemoglobinConc(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 96, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMinTotalHemoglobinConc(_ index: Int, _ minTotalHemoglobinConc: Float32) {
        setFieldValue(fieldNum: 96, fieldArrayIndex: index, value: minTotalHemoglobinConc, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxTotalHemoglobinConc() -> Int {
        return getNumFieldValues(fieldNum: 97, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxTotalHemoglobinConc(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 97, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxTotalHemoglobinConc(_ index: Int, _ maxTotalHemoglobinConc: Float32) {
        setFieldValue(fieldNum: 97, fieldArrayIndex: index, value: maxTotalHemoglobinConc, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgSaturatedHemoglobinPercent() -> Int {
        return getNumFieldValues(fieldNum: 98, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgSaturatedHemoglobinPercent(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 98, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgSaturatedHemoglobinPercent(_ index: Int, _ avgSaturatedHemoglobinPercent: Float32) {
        setFieldValue(fieldNum: 98, fieldArrayIndex: index, value: avgSaturatedHemoglobinPercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMinSaturatedHemoglobinPercent() -> Int {
        return getNumFieldValues(fieldNum: 99, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinSaturatedHemoglobinPercent(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 99, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMinSaturatedHemoglobinPercent(_ index: Int, _ minSaturatedHemoglobinPercent: Float32) {
        setFieldValue(fieldNum: 99, fieldArrayIndex: index, value: minSaturatedHemoglobinPercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxSaturatedHemoglobinPercent() -> Int {
        return getNumFieldValues(fieldNum: 100, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxSaturatedHemoglobinPercent(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 100, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxSaturatedHemoglobinPercent(_ index: Int, _ maxSaturatedHemoglobinPercent: Float32) {
        setFieldValue(fieldNum: 100, fieldArrayIndex: index, value: maxSaturatedHemoglobinPercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftTorqueEffectiveness() -> Float32? {
        if let val = getFieldValue(fieldNum: 101, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftTorqueEffectiveness(_ avgLeftTorqueEffectiveness: Float32) {
        setFieldValue(fieldNum: 101, fieldArrayIndex: 0, value: avgLeftTorqueEffectiveness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightTorqueEffectiveness() -> Float32? {
        if let val = getFieldValue(fieldNum: 102, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightTorqueEffectiveness(_ avgRightTorqueEffectiveness: Float32) {
        setFieldValue(fieldNum: 102, fieldArrayIndex: 0, value: avgRightTorqueEffectiveness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 103, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPedalSmoothness(_ avgLeftPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 103, fieldArrayIndex: 0, value: avgLeftPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 104, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPedalSmoothness(_ avgRightPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 104, fieldArrayIndex: 0, value: avgRightPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgCombinedPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 105, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgCombinedPedalSmoothness(_ avgCombinedPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 105, fieldArrayIndex: 0, value: avgCombinedPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSportIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 111, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setSportIndex(_ sportIndex: UInt8) {
        setFieldValue(fieldNum: 111, fieldArrayIndex: 0, value: sportIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeStanding() -> Float32? {
        if let val = getFieldValue(fieldNum: 112, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeStanding(_ timeStanding: Float32) {
        setFieldValue(fieldNum: 112, fieldArrayIndex: 0, value: timeStanding, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStandCount() -> UInt16? {
        if let val = getFieldValue(fieldNum: 113, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStandCount(_ standCount: UInt16) {
        setFieldValue(fieldNum: 113, fieldArrayIndex: 0, value: standCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPco() -> Int8? {
        if let val = getFieldValue(fieldNum: 114, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPco(_ avgLeftPco: Int8) {
        setFieldValue(fieldNum: 114, fieldArrayIndex: 0, value: avgLeftPco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPco() -> Int8? {
        if let val = getFieldValue(fieldNum: 115, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgRightPco(_ avgRightPco: Int8) {
        setFieldValue(fieldNum: 115, fieldArrayIndex: 0, value: avgRightPco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgLeftPowerPhase() -> Int {
        return getNumFieldValues(fieldNum: 116, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPowerPhase(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 116, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPowerPhase(_ index: Int, _ avgLeftPowerPhase: Float32) {
        setFieldValue(fieldNum: 116, fieldArrayIndex: index, value: avgLeftPowerPhase, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgLeftPowerPhasePeak() -> Int {
        return getNumFieldValues(fieldNum: 117, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPowerPhasePeak(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 117, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPowerPhasePeak(_ index: Int, _ avgLeftPowerPhasePeak: Float32) {
        setFieldValue(fieldNum: 117, fieldArrayIndex: index, value: avgLeftPowerPhasePeak, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgRightPowerPhase() -> Int {
        return getNumFieldValues(fieldNum: 118, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPowerPhase(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 118, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPowerPhase(_ index: Int, _ avgRightPowerPhase: Float32) {
        setFieldValue(fieldNum: 118, fieldArrayIndex: index, value: avgRightPowerPhase, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgRightPowerPhasePeak() -> Int {
        return getNumFieldValues(fieldNum: 119, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPowerPhasePeak(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 119, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPowerPhasePeak(_ index: Int, _ avgRightPowerPhasePeak: Float32) {
        setFieldValue(fieldNum: 119, fieldArrayIndex: index, value: avgRightPowerPhasePeak, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgPowerPosition() -> Int {
        return getNumFieldValues(fieldNum: 120, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPowerPosition(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 120, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAvgPowerPosition(_ index: Int, _ avgPowerPosition: UInt16) {
        setFieldValue(fieldNum: 120, fieldArrayIndex: index, value: avgPowerPosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxPowerPosition() -> Int {
        return getNumFieldValues(fieldNum: 121, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPowerPosition(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 121, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMaxPowerPosition(_ index: Int, _ maxPowerPosition: UInt16) {
        setFieldValue(fieldNum: 121, fieldArrayIndex: index, value: maxPowerPosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgCadencePosition() -> Int {
        return getNumFieldValues(fieldNum: 122, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgCadencePosition(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 122, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgCadencePosition(_ index: Int, _ avgCadencePosition: UInt8) {
        setFieldValue(fieldNum: 122, fieldArrayIndex: index, value: avgCadencePosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxCadencePosition() -> Int {
        return getNumFieldValues(fieldNum: 123, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxCadencePosition(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 123, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxCadencePosition(_ index: Int, _ maxCadencePosition: UInt8) {
        setFieldValue(fieldNum: 123, fieldArrayIndex: index, value: maxCadencePosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedAvgSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 124, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedAvgSpeed(_ enhancedAvgSpeed: Float32) {
        setFieldValue(fieldNum: 124, fieldArrayIndex: 0, value: enhancedAvgSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedMaxSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 125, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedMaxSpeed(_ enhancedMaxSpeed: Float32) {
        setFieldValue(fieldNum: 125, fieldArrayIndex: 0, value: enhancedMaxSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedAvgAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 126, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedAvgAltitude(_ enhancedAvgAltitude: Float32) {
        setFieldValue(fieldNum: 126, fieldArrayIndex: 0, value: enhancedAvgAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedMinAltitude() -> UInt32? {
        if let val = getFieldValue(fieldNum: 127, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setEnhancedMinAltitude(_ enhancedMinAltitude: Float32) {
        setFieldValue(fieldNum: 127, fieldArrayIndex: 0, value: enhancedMinAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedMaxAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 128, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedMaxAltitude(_ enhancedMaxAltitude: Float32) {
        setFieldValue(fieldNum: 128, fieldArrayIndex: 0, value: enhancedMaxAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLevMotorPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 129, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAvgLevMotorPower(_ avgLevMotorPower: UInt16) {
        setFieldValue(fieldNum: 129, fieldArrayIndex: 0, value: avgLevMotorPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxLevMotorPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 130, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMaxLevMotorPower(_ maxLevMotorPower: UInt16) {
        setFieldValue(fieldNum: 130, fieldArrayIndex: 0, value: maxLevMotorPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLevBatteryConsumption() -> Float32? {
        if let val = getFieldValue(fieldNum: 131, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setLevBatteryConsumption(_ levBatteryConsumption: Float32) {
        setFieldValue(fieldNum: 131, fieldArrayIndex: 0, value: levBatteryConsumption, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgVerticalRatio() -> Float32? {
        if let val = getFieldValue(fieldNum: 132, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgVerticalRatio(_ avgVerticalRatio: Float32) {
        setFieldValue(fieldNum: 132, fieldArrayIndex: 0, value: avgVerticalRatio, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStanceTimeBalance() -> Float32? {
        if let val = getFieldValue(fieldNum: 133, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStanceTimeBalance(_ avgStanceTimeBalance: Float32) {
        setFieldValue(fieldNum: 133, fieldArrayIndex: 0, value: avgStanceTimeBalance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStepLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 134, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStepLength(_ avgStepLength: Float32) {
        setFieldValue(fieldNum: 134, fieldArrayIndex: 0, value: avgStepLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalAnaerobicTrainingEffect() -> Float32? {
        if let val = getFieldValue(fieldNum: 137, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalAnaerobicTrainingEffect(_ totalAnaerobicTrainingEffect: Float32) {
        setFieldValue(fieldNum: 137, fieldArrayIndex: 0, value: totalAnaerobicTrainingEffect, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgVam() -> Float32? {
        if let val = getFieldValue(fieldNum: 139, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgVam(_ avgVam: Float32) {
        setFieldValue(fieldNum: 139, fieldArrayIndex: 0, value: avgVam, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
