public class SoftwareMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Version = 3
        case PartNumber = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Software))
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
    
    public func getVersion() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setVersion(_ version: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: version, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPartNumber() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getPartNumberAsString() -> String? {
        if let val = getPartNumber() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setPartNumber(_ partNumber: String) {
        if var data = partNumber.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setPartNumber(_ partNumber: [UInt8]) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: partNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
