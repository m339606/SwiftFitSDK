public class MemoGlobMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case PartIndex = 250
        case Memo = 0
        case MessageNumber = 1
        case MessageIndex = 2
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.MemoGlob))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getPartIndex() -> UInt32? {
        if let val = getFieldValue(fieldNum: 250, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setPartIndex(_ partIndex: UInt32) {
        setFieldValue(fieldNum: 250, fieldArrayIndex: 0, value: partIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMemo() -> Int {
        return getNumFieldValues(fieldNum: 0, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMemo(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMemo(_ index: Int, _ memo: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: index, value: memo, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMessageNumber() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMessageNumber(_ messageNumber: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: messageNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMessageIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMessageIndex(_ messageIndex: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: messageIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
