public class VideoTitleMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case MessageCount = 0
        case Text = 1
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.VideoTitle))
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
    
    public func getMessageCount() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMessageCount(_ messageCount: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: messageCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getText() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getTextAsString() -> String? {
        if let val = getText() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setText(_ text: String) {
        if var data = text.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setText(_ text: [UInt8]) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: text, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
