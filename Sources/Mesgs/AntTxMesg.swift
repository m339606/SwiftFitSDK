public class AntTxMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case FractionalTimestamp = 0
        case MesgId = 1
        case MesgData = 2
        case ChannelNumber = 3
        case Data = 4
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.AntTx))
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
    
    public func getFractionalTimestamp() -> Float32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setFractionalTimestamp(_ fractionalTimestamp: Float32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: fractionalTimestamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMesgId() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMesgId(_ mesgId: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: mesgId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumMesgData() -> Int {
        return getNumFieldValues(fieldNum: 2, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMesgData(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMesgData(_ index: Int, _ mesgData: UInt8) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: mesgData, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getChannelNumber() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setChannelNumber(_ channelNumber: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: channelNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumData() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getData(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setData(_ index: Int, _ data: UInt8) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: data, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
