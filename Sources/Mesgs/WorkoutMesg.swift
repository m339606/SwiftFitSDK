public class WorkoutMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Sport = 4
        case Capabilities = 5
        case NumValidSteps = 6
        case WktName = 8
        case SubSport = 11
        case PoolLength = 14
        case PoolLengthUnit = 15
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Workout))
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
    
    public func getCapabilities() -> UInt32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCapabilities(_ capabilities: UInt32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: capabilities, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumValidSteps() -> UInt16? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNumValidSteps(_ numValidSteps: UInt16) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: numValidSteps, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWktName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getWktNameAsString() -> String? {
        if let val = getWktName() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setWktName(_ wktName: String) {
        if var data = wktName.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setWktName(_ wktName: [UInt8]) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: wktName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSubSport() -> SubSport? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSubSport(_ subSport: SubSport) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: subSport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPoolLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPoolLength(_ poolLength: Float32) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: poolLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPoolLengthUnit() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 15, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setPoolLengthUnit(_ poolLengthUnit: DisplayMeasure) {
        setFieldValue(fieldNum: 15, fieldArrayIndex: 0, value: poolLengthUnit.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
