public class HrZoneMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case HighBpm = 1
        case Name = 2
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.HrZone))
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
    
    public func getName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
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
            setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setName(_ name: [UInt8]) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: name, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
