public class AviationAttitudeMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case SystemTime = 1
        case Pitch = 2
        case Roll = 3
        case AccelLateral = 4
        case AccelNormal = 5
        case TurnRate = 6
        case Stage = 7
        case AttitudeStageComplete = 8
        case Track = 9
        case Validity = 10
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.AviationAttitude))
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
    
    public func getNumSystemTime() -> Int {
        return getNumFieldValues(fieldNum: 1, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSystemTime(_ index: Int) -> UInt32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setSystemTime(_ index: Int, _ systemTime: UInt32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: index, value: systemTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumPitch() -> Int {
        return getNumFieldValues(fieldNum: 2, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPitch(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPitch(_ index: Int, _ pitch: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: pitch, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumRoll() -> Int {
        return getNumFieldValues(fieldNum: 3, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRoll(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setRoll(_ index: Int, _ roll: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: index, value: roll, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAccelLateral() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAccelLateral(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAccelLateral(_ index: Int, _ accelLateral: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: accelLateral, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAccelNormal() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAccelNormal(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAccelNormal(_ index: Int, _ accelNormal: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: accelNormal, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTurnRate() -> Int {
        return getNumFieldValues(fieldNum: 6, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTurnRate(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTurnRate(_ index: Int, _ turnRate: Float32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: index, value: turnRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumStage() -> Int {
        return getNumFieldValues(fieldNum: 7, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStage(_ index: Int) -> AttitudeStage? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return AttitudeStage(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setStage(_ index: Int, _ stage: AttitudeStage) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: index, value: stage.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumAttitudeStageComplete() -> Int {
        return getNumFieldValues(fieldNum: 8, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAttitudeStageComplete(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAttitudeStageComplete(_ index: Int, _ attitudeStageComplete: UInt8) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: index, value: attitudeStageComplete, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTrack() -> Int {
        return getNumFieldValues(fieldNum: 9, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTrack(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTrack(_ index: Int, _ track: Float32) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: index, value: track, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumValidity() -> Int {
        return getNumFieldValues(fieldNum: 10, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getValidity(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setValidity(_ index: Int, _ validity: UInt16) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: index, value: validity, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

