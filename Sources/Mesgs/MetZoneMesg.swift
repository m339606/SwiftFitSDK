public class MetZoneMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case HighBpm = 1
        case Calories = 2
        case FatCalories = 3
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.MetZone))
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
    
    public func getHighBpm() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHighBpm(_ highBpm: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: highBpm, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCalories() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCalories(_ calories: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: calories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFatCalories() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setFatCalories(_ fatCalories: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: fatCalories, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
