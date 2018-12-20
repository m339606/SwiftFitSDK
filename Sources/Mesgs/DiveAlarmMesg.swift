public class DiveAlarmMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Depth = 0
        case Time = 1
        case Enabled = 2
        case AlarmType = 3
        case Sound = 4
        case DiveTypes = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.DiveAlarm))
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
    
    public func getDepth() -> Float32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDepth(_ depth: Float32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: depth, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTime() -> Int32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setTime(_ time: Int32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: time, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEnabled(_ enabled: FitBool) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: enabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAlarmType() -> DiveAlarmType? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DiveAlarmType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setAlarmType(_ alarmType: DiveAlarmType) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: alarmType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSound() -> Tone? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Tone(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSound(_ sound: Tone) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: sound, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumDiveTypes() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDiveTypes(_ index: Int) -> SubSport? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDiveTypes(_ index: Int, _ diveTypes: SubSport) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: diveTypes.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

