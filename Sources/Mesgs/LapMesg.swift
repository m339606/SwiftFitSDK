public class LapMesg : Mesg {
    
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
        case EndPositionLat = 5
        case EndPositionLong = 6
        case TotalElapsedTime = 7
        case TotalTimerTime = 8
        case TotalDistance = 9
        case TotalCycles = 10
        case TotalCalories = 11
        case TotalFatCalories = 12
        case AvgSpeed = 13
        case MaxSpeed = 14
        case AvgHeartRate = 15
        case MaxHeartRate = 16
        case AvgCadence = 17
        case MaxCadence = 18
        case AvgPower = 19
        case MaxPower = 20
        case TotalAscent = 21
        case TotalDescent = 22
        case Intensity = 23
        case LapTrigger = 24
        case Sport = 25
        case EventGroup = 26
        case NumLengths = 32
        case NormalizedPower = 33
        case LeftRightBalance = 34
        case FirstLengthIndex = 35
        case AvgStrokeDistance = 37
        case SwimStroke = 38
        case SubSport = 39
        case NumActiveLengths = 40
        case TotalWork = 41
        case AvgAltitude = 42
        case MaxAltitude = 43
        case GpsAccuracy = 44
        case AvgGrade = 45
        case AvgPosGrade = 46
        case AvgNegGrade = 47
        case MaxPosGrade = 48
        case MaxNegGrade = 49
        case AvgTemperature = 50
        case MaxTemperature = 51
        case TotalMovingTime = 52
        case AvgPosVerticalSpeed = 53
        case AvgNegVerticalSpeed = 54
        case MaxPosVerticalSpeed = 55
        case MaxNegVerticalSpeed = 56
        case TimeInHrZone = 57
        case TimeInSpeedZone = 58
        case TimeInCadenceZone = 59
        case TimeInPowerZone = 60
        case RepetitionNum = 61
        case MinAltitude = 62
        case MinHeartRate = 63
        case WktStepIndex = 71
        case OpponentScore = 74
        case StrokeCount = 75
        case ZoneCount = 76
        case AvgVerticalOscillation = 77
        case AvgStanceTimePercent = 78
        case AvgStanceTime = 79
        case AvgFractionalCadence = 80
        case MaxFractionalCadence = 81
        case TotalFractionalCycles = 82
        case PlayerScore = 83
        case AvgTotalHemoglobinConc = 84
        case MinTotalHemoglobinConc = 85
        case MaxTotalHemoglobinConc = 86
        case AvgSaturatedHemoglobinPercent = 87
        case MinSaturatedHemoglobinPercent = 88
        case MaxSaturatedHemoglobinPercent = 89
        case AvgLeftTorqueEffectiveness = 91
        case AvgRightTorqueEffectiveness = 92
        case AvgLeftPedalSmoothness = 93
        case AvgRightPedalSmoothness = 94
        case AvgCombinedPedalSmoothness = 95
        case TimeStanding = 98
        case StandCount = 99
        case AvgLeftPco = 100
        case AvgRightPco = 101
        case AvgLeftPowerPhase = 102
        case AvgLeftPowerPhasePeak = 103
        case AvgRightPowerPhase = 104
        case AvgRightPowerPhasePeak = 105
        case AvgPowerPosition = 106
        case MaxPowerPosition = 107
        case AvgCadencePosition = 108
        case MaxCadencePosition = 109
        case EnhancedAvgSpeed = 110
        case EnhancedMaxSpeed = 111
        case EnhancedAvgAltitude = 112
        case EnhancedMinAltitude = 113
        case EnhancedMaxAltitude = 114
        case AvgLevMotorPower = 115
        case MaxLevMotorPower = 116
        case LevBatteryConsumption = 117
        case AvgVerticalRatio = 118
        case AvgStanceTimeBalance = 119
        case AvgStepLength = 120
        case AvgVam = 121
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Lap))
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
    
    public func getEndPositionLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setEndPositionLat(_ endPositionLat: Int32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: endPositionLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEndPositionLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setEndPositionLong(_ endPositionLong: Int32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: endPositionLong, subfieldIndex: Fit.subfieldIndexMainField)
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
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTotalFatCalories(_ totalFatCalories: UInt16) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: totalFatCalories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgSpeed(_ avgSpeed: Float32) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: avgSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxSpeed(_ maxSpeed: Float32) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: maxSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 15, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgHeartRate(_ avgHeartRate: UInt8) {
        setFieldValue(fieldNum: 15, fieldArrayIndex: 0, value: avgHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 16, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxHeartRate(_ maxHeartRate: UInt8) {
        setFieldValue(fieldNum: 16, fieldArrayIndex: 0, value: maxHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 17, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgCadence(_ avgCadence: UInt8) {
        setFieldValue(fieldNum: 17, fieldArrayIndex: 0, value: avgCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRunningCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 17, fieldArrayIndex: 0, subFieldIndex: AvgCadenceSubfield.AvgRunningCadence.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgRunningCadence(_ avgRunningCadence: UInt8) {
        setFieldValue(fieldNum: 17, fieldArrayIndex: 0, value: avgRunningCadence, subfieldIndex: AvgCadenceSubfield.AvgRunningCadence.rawValue)
    }
    
    public func getMaxCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxCadence(_ maxCadence: UInt8) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: maxCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxRunningCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxRunningCadence(_ maxCadence: UInt8) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: maxCadence, subfieldIndex: MaxCadenceSubfield.MaxRunningCadence.rawValue)
    }
    
    public func getAvgPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAvgPower(_ avgPower: UInt16) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: avgPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 20, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMaxPower(_ maxPower: UInt16) {
        setFieldValue(fieldNum: 20, fieldArrayIndex: 0, value: maxPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalAscent() -> UInt16? {
        if let val = getFieldValue(fieldNum: 21, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTotalAscent(_ totalAscent: UInt16) {
        setFieldValue(fieldNum: 21, fieldArrayIndex: 0, value: totalAscent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalDescent() -> UInt16? {
        if let val = getFieldValue(fieldNum: 22, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTotalDescent(_ totalDescent: UInt16) {
        setFieldValue(fieldNum: 22, fieldArrayIndex: 0, value: totalDescent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getIntensity() -> Intensity? {
        if let val = getFieldValue(fieldNum: 23, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Intensity(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setIntensity(_ intensity: Intensity) {
        setFieldValue(fieldNum: 23, fieldArrayIndex: 0, value: intensity.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLapTrigger() -> LapTrigger? {
        if let val = getFieldValue(fieldNum: 24, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return LapTrigger(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setLapTrigger(_ lapTrigger: LapTrigger) {
        setFieldValue(fieldNum: 24, fieldArrayIndex: 0, value: lapTrigger.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 25, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 25, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEventGroup() -> UInt8? {
        if let val = getFieldValue(fieldNum: 26, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setEventGroup(_ eventGroup: UInt8) {
        setFieldValue(fieldNum: 26, fieldArrayIndex: 0, value: eventGroup, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumLengths() -> UInt16? {
        if let val = getFieldValue(fieldNum: 32, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNumLengths(_ numLengths: UInt16) {
        setFieldValue(fieldNum: 32, fieldArrayIndex: 0, value: numLengths, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNormalizedPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 33, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNormalizedPower(_ normalizedPower: UInt16) {
        setFieldValue(fieldNum: 33, fieldArrayIndex: 0, value: normalizedPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftRightBalance() -> UInt16? {
        if let val = getFieldValue(fieldNum: 34, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setLeftRightBalance(_ leftRightBalance: UInt16) {
        setFieldValue(fieldNum: 34, fieldArrayIndex: 0, value: leftRightBalance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFirstLengthIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 35, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setFirstLengthIndex(_ firstLengthIndex: UInt16) {
        setFieldValue(fieldNum: 35, fieldArrayIndex: 0, value: firstLengthIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStrokeDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 37, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStrokeDistance(_ avgStrokeDistance: Float32) {
        setFieldValue(fieldNum: 37, fieldArrayIndex: 0, value: avgStrokeDistance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSwimStroke() -> SwimStroke? {
        if let val = getFieldValue(fieldNum: 38, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SwimStroke(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSwimStroke(_ swimStroke: SwimStroke) {
        setFieldValue(fieldNum: 38, fieldArrayIndex: 0, value: swimStroke.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSubSport() -> SubSport? {
        if let val = getFieldValue(fieldNum: 39, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSubSport(_ subSport: SubSport) {
        setFieldValue(fieldNum: 39, fieldArrayIndex: 0, value: subSport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumActiveLengths() -> UInt16? {
        if let val = getFieldValue(fieldNum: 40, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNumActiveLengths(_ numActiveLengths: UInt16) {
        setFieldValue(fieldNum: 40, fieldArrayIndex: 0, value: numActiveLengths, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalWork() -> UInt32? {
        if let val = getFieldValue(fieldNum: 41, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTotalWork(_ totalWork: UInt32) {
        setFieldValue(fieldNum: 41, fieldArrayIndex: 0, value: totalWork, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 42, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgAltitude(_ avgAltitude: Float32) {
        setFieldValue(fieldNum: 42, fieldArrayIndex: 0, value: avgAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 43, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxAltitude(_ maxAltitude: Float32) {
        setFieldValue(fieldNum: 43, fieldArrayIndex: 0, value: maxAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGpsAccuracy() -> UInt8? {
        if let val = getFieldValue(fieldNum: 44, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setGpsAccuracy(_ gpsAccuracy: UInt8) {
        setFieldValue(fieldNum: 44, fieldArrayIndex: 0, value: gpsAccuracy, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 45, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgGrade(_ avgGrade: Float32) {
        setFieldValue(fieldNum: 45, fieldArrayIndex: 0, value: avgGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPosGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 46, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgPosGrade(_ avgPosGrade: Float32) {
        setFieldValue(fieldNum: 46, fieldArrayIndex: 0, value: avgPosGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgNegGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 47, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgNegGrade(_ avgNegGrade: Float32) {
        setFieldValue(fieldNum: 47, fieldArrayIndex: 0, value: avgNegGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPosGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 48, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxPosGrade(_ maxPosGrade: Float32) {
        setFieldValue(fieldNum: 48, fieldArrayIndex: 0, value: maxPosGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxNegGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 49, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxNegGrade(_ maxNegGrade: Float32) {
        setFieldValue(fieldNum: 49, fieldArrayIndex: 0, value: maxNegGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 50, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgTemperature(_ avgTemperature: Int8) {
        setFieldValue(fieldNum: 50, fieldArrayIndex: 0, value: avgTemperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 51, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setMaxTemperature(_ maxTemperature: Int8) {
        setFieldValue(fieldNum: 51, fieldArrayIndex: 0, value: maxTemperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalMovingTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 52, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalMovingTime(_ totalMovingTime: Float32) {
        setFieldValue(fieldNum: 52, fieldArrayIndex: 0, value: totalMovingTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPosVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 53, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgPosVerticalSpeed(_ avgPosVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 53, fieldArrayIndex: 0, value: avgPosVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgNegVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 54, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgNegVerticalSpeed(_ avgNegVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 54, fieldArrayIndex: 0, value: avgNegVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPosVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 55, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxPosVerticalSpeed(_ maxPosVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 55, fieldArrayIndex: 0, value: maxPosVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxNegVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 56, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxNegVerticalSpeed(_ maxNegVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 56, fieldArrayIndex: 0, value: maxNegVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInHrZone() -> Int {
        return getNumFieldValues(fieldNum: 57, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInHrZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 57, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInHrZone(_ index: Int, _ timeInHrZone: Float32) {
        setFieldValue(fieldNum: 57, fieldArrayIndex: index, value: timeInHrZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInSpeedZone() -> Int {
        return getNumFieldValues(fieldNum: 58, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInSpeedZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 58, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInSpeedZone(_ index: Int, _ timeInSpeedZone: Float32) {
        setFieldValue(fieldNum: 58, fieldArrayIndex: index, value: timeInSpeedZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInCadenceZone() -> Int {
        return getNumFieldValues(fieldNum: 59, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInCadenceZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 59, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInCadenceZone(_ index: Int, _ timeInCadenceZone: Float32) {
        setFieldValue(fieldNum: 59, fieldArrayIndex: index, value: timeInCadenceZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInPowerZone() -> Int {
        return getNumFieldValues(fieldNum: 60, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInPowerZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 60, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInPowerZone(_ index: Int, _ timeInPowerZone: Float32) {
        setFieldValue(fieldNum: 60, fieldArrayIndex: index, value: timeInPowerZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRepetitionNum() -> UInt16? {
        if let val = getFieldValue(fieldNum: 61, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setRepetitionNum(_ repetitionNum: UInt16) {
        setFieldValue(fieldNum: 61, fieldArrayIndex: 0, value: repetitionNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 62, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMinAltitude(_ minAltitude: Float32) {
        setFieldValue(fieldNum: 62, fieldArrayIndex: 0, value: minAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 63, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMinHeartRate(_ minHeartRate: UInt8) {
        setFieldValue(fieldNum: 63, fieldArrayIndex: 0, value: minHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWktStepIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 71, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setWktStepIndex(_ wktStepIndex: UInt16) {
        setFieldValue(fieldNum: 71, fieldArrayIndex: 0, value: wktStepIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOpponentScore() -> UInt16? {
        if let val = getFieldValue(fieldNum: 74, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setOpponentScore(_ opponentScore: UInt16) {
        setFieldValue(fieldNum: 74, fieldArrayIndex: 0, value: opponentScore, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumStrokeCount() -> Int {
        return getNumFieldValues(fieldNum: 75, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getStrokeCount(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 75, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStrokeCount(_ index: Int, _ strokeCount: UInt16) {
        setFieldValue(fieldNum: 75, fieldArrayIndex: index, value: strokeCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumZoneCount() -> Int {
        return getNumFieldValues(fieldNum: 76, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getZoneCount(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 76, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setZoneCount(_ index: Int, _ zoneCount: UInt16) {
        setFieldValue(fieldNum: 76, fieldArrayIndex: index, value: zoneCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgVerticalOscillation() -> Float32? {
        if let val = getFieldValue(fieldNum: 77, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgVerticalOscillation(_ avgVerticalOscillation: Float32) {
        setFieldValue(fieldNum: 77, fieldArrayIndex: 0, value: avgVerticalOscillation, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStanceTimePercent() -> Float32? {
        if let val = getFieldValue(fieldNum: 78, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStanceTimePercent(_ avgStanceTimePercent: Float32) {
        setFieldValue(fieldNum: 78, fieldArrayIndex: 0, value: avgStanceTimePercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStanceTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 79, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStanceTime(_ avgStanceTime: Float32) {
        setFieldValue(fieldNum: 79, fieldArrayIndex: 0, value: avgStanceTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgFractionalCadence() -> Float32? {
        if let val = getFieldValue(fieldNum: 80, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgFractionalCadence(_ avgFractionalCadence: Float32) {
        setFieldValue(fieldNum: 80, fieldArrayIndex: 0, value: avgFractionalCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxFractionalCadence() -> Float32? {
        if let val = getFieldValue(fieldNum: 81, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxFractionalCadence(_ maxFractionalCadence: Float32) {
        setFieldValue(fieldNum: 81, fieldArrayIndex: 0, value: maxFractionalCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalFractionalCycles() -> Float32? {
        if let val = getFieldValue(fieldNum: 82, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalFractionalCycles(_ totalFractionalCycles: Float32) {
        setFieldValue(fieldNum: 82, fieldArrayIndex: 0, value: totalFractionalCycles, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPlayerScore() -> UInt16? {
        if let val = getFieldValue(fieldNum: 83, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setPlayerScore(_ playerScore: UInt16) {
        setFieldValue(fieldNum: 83, fieldArrayIndex: 0, value: playerScore, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgTotalHemoglobinConc() -> Int {
        return getNumFieldValues(fieldNum: 84, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgTotalHemoglobinConc(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 84, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgTotalHemoglobinConc(_ index: Int, _ avgTotalHemoglobinConc: Float32) {
        setFieldValue(fieldNum: 84, fieldArrayIndex: index, value: avgTotalHemoglobinConc, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMinTotalHemoglobinConc() -> Int {
        return getNumFieldValues(fieldNum: 85, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinTotalHemoglobinConc(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 85, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMinTotalHemoglobinConc(_ index: Int, _ minTotalHemoglobinConc: Float32) {
        setFieldValue(fieldNum: 85, fieldArrayIndex: index, value: minTotalHemoglobinConc, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxTotalHemoglobinConc() -> Int {
        return getNumFieldValues(fieldNum: 86, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxTotalHemoglobinConc(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 86, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxTotalHemoglobinConc(_ index: Int, _ maxTotalHemoglobinConc: Float32) {
        setFieldValue(fieldNum: 86, fieldArrayIndex: index, value: maxTotalHemoglobinConc, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgSaturatedHemoglobinPercent() -> Int {
        return getNumFieldValues(fieldNum: 87, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgSaturatedHemoglobinPercent(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 87, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgSaturatedHemoglobinPercent(_ index: Int, _ avgSaturatedHemoglobinPercent: Float32) {
        setFieldValue(fieldNum: 87, fieldArrayIndex: index, value: avgSaturatedHemoglobinPercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMinSaturatedHemoglobinPercent() -> Int {
        return getNumFieldValues(fieldNum: 88, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinSaturatedHemoglobinPercent(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 88, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMinSaturatedHemoglobinPercent(_ index: Int, _ minSaturatedHemoglobinPercent: Float32) {
        setFieldValue(fieldNum: 88, fieldArrayIndex: index, value: minSaturatedHemoglobinPercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxSaturatedHemoglobinPercent() -> Int {
        return getNumFieldValues(fieldNum: 89, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxSaturatedHemoglobinPercent(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 89, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxSaturatedHemoglobinPercent(_ index: Int, _ maxSaturatedHemoglobinPercent: Float32) {
        setFieldValue(fieldNum: 89, fieldArrayIndex: index, value: maxSaturatedHemoglobinPercent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftTorqueEffectiveness() -> Float32? {
        if let val = getFieldValue(fieldNum: 91, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftTorqueEffectiveness(_ avgLeftTorqueEffectiveness: Float32) {
        setFieldValue(fieldNum: 91, fieldArrayIndex: 0, value: avgLeftTorqueEffectiveness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightTorqueEffectiveness() -> Float32? {
        if let val = getFieldValue(fieldNum: 92, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightTorqueEffectiveness(_ avgRightTorqueEffectiveness: Float32) {
        setFieldValue(fieldNum: 92, fieldArrayIndex: 0, value: avgRightTorqueEffectiveness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 93, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPedalSmoothness(_ avgLeftPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 93, fieldArrayIndex: 0, value: avgLeftPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 94, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPedalSmoothness(_ avgRightPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 94, fieldArrayIndex: 0, value: avgRightPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgCombinedPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 95, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgCombinedPedalSmoothness(_ avgCombinedPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 95, fieldArrayIndex: 0, value: avgCombinedPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeStanding() -> Float32? {
        if let val = getFieldValue(fieldNum: 98, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeStanding(_ timeStanding: Float32) {
        setFieldValue(fieldNum: 98, fieldArrayIndex: 0, value: timeStanding, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStandCount() -> UInt16? {
        if let val = getFieldValue(fieldNum: 99, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStandCount(_ standCount: UInt16) {
        setFieldValue(fieldNum: 99, fieldArrayIndex: 0, value: standCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPco() -> Int8? {
        if let val = getFieldValue(fieldNum: 100, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPco(_ avgLeftPco: Int8) {
        setFieldValue(fieldNum: 100, fieldArrayIndex: 0, value: avgLeftPco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPco() -> Int8? {
        if let val = getFieldValue(fieldNum: 101, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgRightPco(_ avgRightPco: Int8) {
        setFieldValue(fieldNum: 101, fieldArrayIndex: 0, value: avgRightPco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPowerPhase() -> Float32? {
        if let val = getFieldValue(fieldNum: 102, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPowerPhase(_ avgLeftPowerPhase: Float32) {
        setFieldValue(fieldNum: 102, fieldArrayIndex: 0, value: avgLeftPowerPhase, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgLeftPowerPhasePeak() -> Int {
        return getNumFieldValues(fieldNum: 103, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getAvgLeftPowerPhasePeak(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 103, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPowerPhasePeak(_ index: Int, _ avgLeftPowerPhasePeak: Float32) {
        setFieldValue(fieldNum: 103, fieldArrayIndex: index, value: avgLeftPowerPhasePeak, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgRightPowerPhase() -> Int {
        return getNumFieldValues(fieldNum: 104, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPowerPhase(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 104, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPowerPhase(_ index: Int, _ avgRightPowerPhase: Float32) {
        setFieldValue(fieldNum: 104, fieldArrayIndex: index, value: avgRightPowerPhase, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgRightPowerPhasePeak() -> Int {
        return getNumFieldValues(fieldNum: 105, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPowerPhasePeak(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 105, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPowerPhasePeak(_ index: Int, _ avgRightPowerPhasePeak: Float32) {
        setFieldValue(fieldNum: 105, fieldArrayIndex: index, value: avgRightPowerPhasePeak, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgPowerPosition() -> Int {
        return getNumFieldValues(fieldNum: 106, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPowerPosition(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 106, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAvgPowerPosition(_ index: Int, _ avgPowerPosition: UInt16) {
        setFieldValue(fieldNum: 106, fieldArrayIndex: index, value: avgPowerPosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxPowerPosition() -> Int {
        return getNumFieldValues(fieldNum: 107, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPowerPosition(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 107, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMaxPowerPosition(_ index: Int, _ maxPowerPosition: UInt16) {
        setFieldValue(fieldNum: 107, fieldArrayIndex: index, value: maxPowerPosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgCadencePosition() -> Int {
        return getNumFieldValues(fieldNum: 108, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgCadencePosition(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 108, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgCadencePosition(_ index: Int, _ avgCadencePosition: UInt8) {
        setFieldValue(fieldNum: 108, fieldArrayIndex: index, value: avgCadencePosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxCadencePosition() -> Int {
        return getNumFieldValues(fieldNum: 109, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxCadencePosition(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 109, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxCadencePosition(_ index: Int, _ maxCadencePosition: UInt8) {
        setFieldValue(fieldNum: 109, fieldArrayIndex: index, value: maxCadencePosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedAvgSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 110, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedAvgSpeed(_ enhancedAvgSpeed: Float32) {
        setFieldValue(fieldNum: 110, fieldArrayIndex: 0, value: enhancedAvgSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedMaxSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 111, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedMaxSpeed(_ enhancedMaxSpeed: Float32) {
        setFieldValue(fieldNum: 111, fieldArrayIndex: 0, value: enhancedMaxSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedAvgAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 112, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedAvgAltitude(_ enhancedAvgAltitude: Float32) {
        setFieldValue(fieldNum: 112, fieldArrayIndex: 0, value: enhancedAvgAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedMinAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 113, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedMinAltitude(_ enhancedMinAltitude: Float32) {
        setFieldValue(fieldNum: 113, fieldArrayIndex: 0, value: enhancedMinAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedMaxAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 114, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedMaxAltitude(_ enhancedMaxAltitude: Float32) {
        setFieldValue(fieldNum: 114, fieldArrayIndex: 0, value: enhancedMaxAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLevMotorPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 115, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAvgLevMotorPower(_ avgLevMotorPower: UInt16) {
        setFieldValue(fieldNum: 115, fieldArrayIndex: 0, value: avgLevMotorPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxLevMotorPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 116, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMaxLevMotorPower(_ maxLevMotorPower: UInt16) {
        setFieldValue(fieldNum: 116, fieldArrayIndex: 0, value: maxLevMotorPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLevBatteryConsumption() -> Float32? {
        if let val = getFieldValue(fieldNum: 117, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setLevBatteryConsumption(_ levBatteryConsumption: Float32) {
        setFieldValue(fieldNum: 117, fieldArrayIndex: 0, value: levBatteryConsumption, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgVerticalRatio() -> Float32? {
        if let val = getFieldValue(fieldNum: 118, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgVerticalRatio(_ avgVerticalRatio: Float32) {
        setFieldValue(fieldNum: 118, fieldArrayIndex: 0, value: avgVerticalRatio, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStanceTimeBalance() -> Float32? {
        if let val = getFieldValue(fieldNum: 119, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStanceTimeBalance(_ avgStanceTimeBalance: Float32) {
        setFieldValue(fieldNum: 119, fieldArrayIndex: 0, value: avgStanceTimeBalance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgStepLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 120, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgStepLength(_ avgStepLength: Float32) {
        setFieldValue(fieldNum: 120, fieldArrayIndex: 0, value: avgStepLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgVam() -> Float32? {
        if let val = getFieldValue(fieldNum: 121, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgVam(_ avgVam: Float32) {
        setFieldValue(fieldNum: 121, fieldArrayIndex: 0, value: avgVam, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
