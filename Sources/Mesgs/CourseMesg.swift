public class CourseMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Sport = 4
        case Name = 5
        case Capabilities = 6
        case SubSport = 7
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Course))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
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
            setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setName(_ name: [UInt8]) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: name, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCapabilities() -> Int32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setCapabilities(_ capabilities: Int32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: capabilities, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSubSport() -> SubSport? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSubSport(_ subSport: SubSport) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: subSport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
