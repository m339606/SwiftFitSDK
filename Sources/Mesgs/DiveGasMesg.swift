public class DiveGasMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case HeliumContent = 0
        case OxygenContent = 1
        case Status = 2
        
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.DiveGas))
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
    
    public func getHeliumContent() -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHeliumContent(_ heliumContent: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: heliumContent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOxygenContent() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setOxygenContent(_ oxygenContent: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: oxygenContent, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStatus() -> DiveGasStatus? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DiveGasStatus(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setStatus(_ status: DiveGasStatus) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: status.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
