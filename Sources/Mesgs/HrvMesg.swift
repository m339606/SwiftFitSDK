public class HrvMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Time = 0
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Hrv))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getNumTime() -> Int {
        return getNumFieldValues(fieldNum: 0, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getTime(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTime(_ index: Int, _ time: Float32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: index, value: time, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
