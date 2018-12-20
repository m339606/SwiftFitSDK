public class SegmentLapMesg : Mesg {
    
    public enum TotalCyclesSubfield: UInt16 {
        case TotalStrokes = 0
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
        case Sport = 23
        case EventGroup = 24
        case NecLat = 25
        case NecLong = 26
        case SwcLat = 27
        case SwcLong = 28
        case Name = 29
        case NormalizedPower = 30
        case LeftRightBalance = 31
        case SubSport = 32
        case TotalWork = 33
        case AvgAltitude = 34
        case MaxAltitude = 35
        case GpsAccuracy = 36
        case AvgGrade = 37
        case AvgPosGrade = 38
        case AvgNegGrade = 39
        case MaxPosGrade = 40
        case MaxNegGrade = 41
        case AvgTemperature = 42
        case MaxTemperature = 43
        case TotalMovingTime = 44
        case AvgPosVerticalSpeed = 45
        case AvgNegVerticalSpeed = 46
        case MaxPosVerticalSpeed = 47
        case MaxNegVerticalSpeed = 48
        case TimeInHrZone = 49
        case TimeInSpeedZone = 50
        case TimeInCadenceZone = 51
        case TimeInPowerZone = 52
        case RepetitionNum = 53
        case MinAltitude = 54
        case MinHeartRate = 55
        case ActiveTime = 56
        case WktStepIndex = 57
        case SportEvent = 58
        case AvgLeftTorqueEffectiveness = 59
        case AvgRightTorqueEffectiveness = 60
        case AvgLeftPedalSmoothness = 61
        case AvgRightPedalSmoothness = 62
        case AvgCombinedPedalSmoothness = 63
        case Status = 64
        case Uuid = 65
        case AvgFractionalCadence = 66
        case MaxFractionalCadence = 67
        case TotalFractionalCycles = 68
        case FrontGearShiftCount = 69
        case RearGearShiftCount = 70
        case TimeStanding = 71
        case StandCount = 72
        case AvgLeftPco = 73
        case AvgRightPco = 74
        case AvgLeftPowerPhase = 75
        case AvgLeftPowerPhasePeak = 76
        case AvgRightPowerPhase = 77
        case AvgRightPowerPhasePeak = 78
        case AvgPowerPosition = 79
        case MaxPowerPosition = 80
        case AvgCadencePosition = 81
        case MaxCadencePosition = 82
        case Manufacturer = 83
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.SegmentLap))
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
    
    public func getTotalStrokes() -> UInt32? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: TotalCyclesSubfield.TotalStrokes.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTotalStrokes(_ totalStrokes: UInt32) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: totalStrokes, subfieldIndex: TotalCyclesSubfield.TotalStrokes.rawValue)
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
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 23, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 23, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEventGroup() -> UInt8? {
        if let val = getFieldValue(fieldNum: 24, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setEventGroup(_ eventGroup: UInt8) {
        setFieldValue(fieldNum: 24, fieldArrayIndex: 0, value: eventGroup, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNecLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 25, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setNecLat(_ necLat: Int32) {
        setFieldValue(fieldNum: 25, fieldArrayIndex: 0, value: necLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNecLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 26, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setNecLong(_ necLong: Int32) {
        setFieldValue(fieldNum: 26, fieldArrayIndex: 0, value: necLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSwcLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 27, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setSwcLat(_ swcLat: Int32) {
        setFieldValue(fieldNum: 27, fieldArrayIndex: 0, value: swcLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSwcLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 28, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setSwcLong(_ swcLong: Int32) {
        setFieldValue(fieldNum: 28, fieldArrayIndex: 0, value: swcLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 29, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getNameAsString() -> String? {
        if let val = getName() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setName(_ name: String) {
        if var data = name.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 29, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setName(_ name: [UInt8]) {
        setFieldValue(fieldNum: 29, fieldArrayIndex: 0, value: name, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNormalizedPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 30, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNormalizedPower(_ normalizedPower: UInt16) {
        setFieldValue(fieldNum: 30, fieldArrayIndex: 0, value: normalizedPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeftRightBalance() -> UInt16? {
        if let val = getFieldValue(fieldNum: 31, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setLeftRightBalance(_ leftRightBalance: UInt16) {
        setFieldValue(fieldNum: 31, fieldArrayIndex: 0, value: leftRightBalance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSubSport() -> SubSport? {
        if let val = getFieldValue(fieldNum: 32, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSubSport(_ subSport: SubSport) {
        setFieldValue(fieldNum: 32, fieldArrayIndex: 0, value: subSport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalWork() -> UInt32? {
        if let val = getFieldValue(fieldNum: 33, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTotalWork(_ totalWork: UInt32) {
        setFieldValue(fieldNum: 33, fieldArrayIndex: 0, value: totalWork, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 34, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgAltitude(_ avgAltitude: Float32) {
        setFieldValue(fieldNum: 34, fieldArrayIndex: 0, value: avgAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 35, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxAltitude(_ maxAltitude: Float32) {
        setFieldValue(fieldNum: 35, fieldArrayIndex: 0, value: maxAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGpsAccuracy() -> UInt8? {
        if let val = getFieldValue(fieldNum: 36, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setGpsAccuracy(_ gpsAccuracy: UInt8) {
        setFieldValue(fieldNum: 36, fieldArrayIndex: 0, value: gpsAccuracy, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 37, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgGrade(_ avgGrade: Float32) {
        setFieldValue(fieldNum: 37, fieldArrayIndex: 0, value: avgGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPosGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 38, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgPosGrade(_ avgPosGrade: Float32) {
        setFieldValue(fieldNum: 38, fieldArrayIndex: 0, value: avgPosGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgNegGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 39, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgNegGrade(_ avgNegGrade: Float32) {
        setFieldValue(fieldNum: 39, fieldArrayIndex: 0, value: avgNegGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPosGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 40, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxPosGrade(_ maxPosGrade: Float32) {
        setFieldValue(fieldNum: 40, fieldArrayIndex: 0, value: maxPosGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxNegGrade() -> Float32? {
        if let val = getFieldValue(fieldNum: 41, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxNegGrade(_ maxNegGrade: Float32) {
        setFieldValue(fieldNum: 41, fieldArrayIndex: 0, value: maxNegGrade, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 42, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgTemperature(_ avgTemperature: Int8) {
        setFieldValue(fieldNum: 42, fieldArrayIndex: 0, value: avgTemperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 43, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setMaxTemperature(_ maxTemperature: Int8) {
        setFieldValue(fieldNum: 43, fieldArrayIndex: 0, value: maxTemperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalMovingTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 44, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalMovingTime(_ totalMovingTime: Float32) {
        setFieldValue(fieldNum: 44, fieldArrayIndex: 0, value: totalMovingTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPosVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 45, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgPosVerticalSpeed(_ avgPosVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 45, fieldArrayIndex: 0, value: avgPosVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgNegVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 46, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgNegVerticalSpeed(_ avgNegVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 46, fieldArrayIndex: 0, value: avgNegVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPosVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 47, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxPosVerticalSpeed(_ maxPosVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 47, fieldArrayIndex: 0, value: maxPosVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxNegVerticalSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 48, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxNegVerticalSpeed(_ maxNegVerticalSpeed: Float32) {
        setFieldValue(fieldNum: 48, fieldArrayIndex: 0, value: maxNegVerticalSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInHrZone() -> Int {
        return getNumFieldValues(fieldNum: 49, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getTimeInHrZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 49, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInHrZone(_ index: Int, _ timeInHrZone: Float32) {
        setFieldValue(fieldNum: 49, fieldArrayIndex: index, value: timeInHrZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInSpeedZone() -> Int {
        return getNumFieldValues(fieldNum: 50, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInSpeedZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 50, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInSpeedZone(_ index: Int, _ timeInSpeedZone: Float32) {
        setFieldValue(fieldNum: 50, fieldArrayIndex: index, value: timeInSpeedZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInCadenceZone() -> Int {
        return getNumFieldValues(fieldNum: 51, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInCadenceZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 51, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInCadenceZone(_ index: Int, _ timeInCadenceZone: Float32) {
        setFieldValue(fieldNum: 51, fieldArrayIndex: index, value: timeInCadenceZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeInPowerZone() -> Int {
        return getNumFieldValues(fieldNum: 52, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeInPowerZone(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 52, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeInPowerZone(_ index: Int, _ timeInPowerZone: Float32) {
        setFieldValue(fieldNum: 52, fieldArrayIndex: index, value: timeInPowerZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRepetitionNum() -> UInt16? {
        if let val = getFieldValue(fieldNum: 53, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setRepetitionNum(_ repetitionNum: UInt16) {
        setFieldValue(fieldNum: 53, fieldArrayIndex: 0, value: repetitionNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 54, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMinAltitude(_ minAltitude: Float32) {
        setFieldValue(fieldNum: 54, fieldArrayIndex: 0, value: minAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMinHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 55, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMinHeartRate(_ minHeartRate: UInt8) {
        setFieldValue(fieldNum: 55, fieldArrayIndex: 0, value: minHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActiveTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 56, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setActiveTime(_ activeTime: Float32) {
        setFieldValue(fieldNum: 56, fieldArrayIndex: 0, value: activeTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWktStepIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 57, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setWktStepIndex(_ wktStepIndex: UInt16) {
        setFieldValue(fieldNum: 57, fieldArrayIndex: 0, value: wktStepIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSportEvent() -> SportEvent? {
        if let val = getFieldValue(fieldNum: 58, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SportEvent(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSportEvent(_ sportEvent: SportEvent) {
        setFieldValue(fieldNum: 58, fieldArrayIndex: 0, value: sportEvent.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftTorqueEffectiveness() -> Float32? {
        if let val = getFieldValue(fieldNum: 59, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftTorqueEffectiveness(_ avgLeftTorqueEffectiveness: Float32) {
        setFieldValue(fieldNum: 59, fieldArrayIndex: 0, value: avgLeftTorqueEffectiveness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightTorqueEffectiveness() -> Float32? {
        if let val = getFieldValue(fieldNum: 60, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightTorqueEffectiveness(_ avgRightTorqueEffectiveness: Float32) {
        setFieldValue(fieldNum: 60, fieldArrayIndex: 0, value: avgRightTorqueEffectiveness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 61, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPedalSmoothness(_ avgLeftPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 61, fieldArrayIndex: 0, value: avgLeftPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 62, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPedalSmoothness(_ avgRightPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 62, fieldArrayIndex: 0, value: avgRightPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgCombinedPedalSmoothness() -> Float32? {
        if let val = getFieldValue(fieldNum: 63, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgCombinedPedalSmoothness(_ avgCombinedPedalSmoothness: Float32) {
        setFieldValue(fieldNum: 63, fieldArrayIndex: 0, value: avgCombinedPedalSmoothness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStatus() -> SegmentLapStatus? {
        if let val = getFieldValue(fieldNum: 64, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SegmentLapStatus(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setStatus(_ status: SegmentLapStatus) {
        setFieldValue(fieldNum: 64, fieldArrayIndex: 0, value: status.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getUuid() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 65, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getUuidAsString() -> String? {
        if let val = getUuid() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setUuid(_ uuid: String) {
        if var data = uuid.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 65, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setUuid(_ uuid: [UInt8]) {
        setFieldValue(fieldNum: 65, fieldArrayIndex: 0, value: uuid, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgFractionalCadence() -> Float32? {
        if let val = getFieldValue(fieldNum: 66, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgFractionalCadence(_ avgFractionalCadence: Float32) {
        setFieldValue(fieldNum: 66, fieldArrayIndex: 0, value: avgFractionalCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxFractionalCadence() -> Float32? {
        if let val = getFieldValue(fieldNum: 67, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxFractionalCadence(_ maxFractionalCadence: Float32) {
        setFieldValue(fieldNum: 67, fieldArrayIndex: 0, value: maxFractionalCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalFractionalCycles() -> Float32? {
        if let val = getFieldValue(fieldNum: 68, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalFractionalCycles(_ totalFractionalCycles: Float32) {
        setFieldValue(fieldNum: 68, fieldArrayIndex: 0, value: totalFractionalCycles, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFrontGearShiftCount() -> UInt16? {
        if let val = getFieldValue(fieldNum: 69, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setFrontGearShiftCount(_ frontGearShiftCount: UInt16) {
        setFieldValue(fieldNum: 69, fieldArrayIndex: 0, value: frontGearShiftCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRearGearShiftCount() -> UInt16? {
        if let val = getFieldValue(fieldNum: 70, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setRearGearShiftCount(_ rearGearShiftCount: UInt16) {
        setFieldValue(fieldNum: 70, fieldArrayIndex: 0, value: rearGearShiftCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeStanding() -> Float32? {
        if let val = getFieldValue(fieldNum: 71, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeStanding(_ timeStanding: Float32) {
        setFieldValue(fieldNum: 71, fieldArrayIndex: 0, value: timeStanding, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStandCount() -> UInt16? {
        if let val = getFieldValue(fieldNum: 72, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStandCount(_ standCount: UInt16) {
        setFieldValue(fieldNum: 72, fieldArrayIndex: 0, value: standCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPco() -> Int8? {
        if let val = getFieldValue(fieldNum: 73, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPco(_ avgLeftPco: Int8) {
        setFieldValue(fieldNum: 73, fieldArrayIndex: 0, value: avgLeftPco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPco() -> Int8? {
        if let val = getFieldValue(fieldNum: 74, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setAvgRightPco(_ avgRightPco: Int8) {
        setFieldValue(fieldNum: 74, fieldArrayIndex: 0, value: avgRightPco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgLeftPowerPhase() -> Int {
        return getNumFieldValues(fieldNum: 75, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPowerPhase(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 75, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPowerPhase(_ index: Int, _ avgLeftPowerPhase: Float32) {
        setFieldValue(fieldNum: 75, fieldArrayIndex: index, value: avgLeftPowerPhase, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgLeftPowerPhasePeak() -> Int {
        return getNumFieldValues(fieldNum: 76, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgLeftPowerPhasePeak(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 76, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgLeftPowerPhasePeak(_ index: Int, _ avgLeftPowerPhasePeak: Float32) {
        setFieldValue(fieldNum: 76, fieldArrayIndex: index, value: avgLeftPowerPhasePeak, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgRightPowerPhase() -> Int {
        return getNumFieldValues(fieldNum: 77, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPowerPhase(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 77, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPowerPhase(_ index: Int, _ avgRightPowerPhase: Float32) {
        setFieldValue(fieldNum: 77, fieldArrayIndex: index, value: avgRightPowerPhase, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgRightPowerPhasePeak() -> Int {
        return getNumFieldValues(fieldNum: 78, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgRightPowerPhasePeak(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 78, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgRightPowerPhasePeak(_ index: Int, _ avgRightPowerPhasePeak: Float32) {
        setFieldValue(fieldNum: 78, fieldArrayIndex: index, value: avgRightPowerPhasePeak, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgPowerPosition() -> Int {
        return getNumFieldValues(fieldNum: 79, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgPowerPosition(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 79, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAvgPowerPosition(_ index: Int, _ avgPowerPosition: UInt16) {
        setFieldValue(fieldNum: 79, fieldArrayIndex: index, value: avgPowerPosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxPowerPosition() -> Int {
        return getNumFieldValues(fieldNum: 80, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxPowerPosition(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 80, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMaxPowerPosition(_ index: Int, _ maxPowerPosition: UInt16) {
        setFieldValue(fieldNum: 80, fieldArrayIndex: index, value: maxPowerPosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAvgCadencePosition() -> Int {
        return getNumFieldValues(fieldNum: 81, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgCadencePosition(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 81, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgCadencePosition(_ index: Int, _ avgCadencePosition: UInt8) {
        setFieldValue(fieldNum: 81, fieldArrayIndex: index, value: avgCadencePosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMaxCadencePosition() -> Int {
        return getNumFieldValues(fieldNum: 82, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxCadencePosition(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 82, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxCadencePosition(_ index: Int, _ maxCadencePosition: UInt8) {
        setFieldValue(fieldNum: 82, fieldArrayIndex: index, value: maxCadencePosition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getManufacturer() -> UInt16? {
        if let val = getFieldValue(fieldNum: 83, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setManufacturer(_ manufacturer: UInt16) {
        setFieldValue(fieldNum: 83, fieldArrayIndex: 0, value: manufacturer, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
