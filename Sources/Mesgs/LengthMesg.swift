public class LengthMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Timestamp = 253
        case Event = 0
        case EventType = 1
        case StartTime = 2
        case TotalElapsedTime = 3
        case TotalTimerTime = 4
        case TotalStrokes = 5
        case AvgSpeed = 6
        case SwimStroke = 7
        case AvgSwimmingCadence = 9
        case EventGroup = 10
        case TotalCalories = 11
        case LengthType = 12
        case PlayerScore = 18
        case OpponentScore = 19
        case StrokeCount = 20
        case ZoneCount = 21
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Length))
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
    
    public func getTotalElapsedTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalElapsedTime(_ totalElapsedTime: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: totalElapsedTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalTimerTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTotalTimerTime(_ totalTimerTime: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: totalTimerTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTotalStrokes() -> UInt16? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTotalStrokes(_ totalStrokes: UInt16) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: totalStrokes, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgSpeed(_ avgSpeed: Float32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: avgSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSwimStroke() -> SwimStroke? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SwimStroke(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSwimStroke(_ swimStroke: SwimStroke) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: swimStroke.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgSwimmingCadence() -> UInt8? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAvgSwimmingCadence(_ avgSwimmingCadence: UInt8) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: avgSwimmingCadence, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEventGroup() -> UInt8? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setEventGroup(_ eventGroup: UInt8) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: eventGroup, subfieldIndex: Fit.subfieldIndexMainField)
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
    
    public func getLengthType() -> LengthType? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return LengthType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setLengthType(_ lengthType: LengthType) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: lengthType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPlayerScore() -> UInt16? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setPlayerScore(_ playerScore: UInt16) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: playerScore, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOpponentScore() -> UInt16? {
        if let val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setOpponentScore(_ opponentScore: UInt16) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: opponentScore, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumStrokeCount() -> Int {
        return getNumFieldValues(fieldNum: 20, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStrokeCount(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 20, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStrokeCount(_ index: Int, _ strokeCount: UInt16) {
        setFieldValue(fieldNum: 20, fieldArrayIndex: index, value: strokeCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumZoneCount() -> Int {
        return getNumFieldValues(fieldNum: 21, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getZoneCount(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 21, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setZoneCount(_ index: Int, _ zoneCount: UInt16) {
        setFieldValue(fieldNum: 21, fieldArrayIndex: index, value: zoneCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
