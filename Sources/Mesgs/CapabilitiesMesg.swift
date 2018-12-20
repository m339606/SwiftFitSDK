public class CapabilitiesMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Languages = 0
        case Sports = 1
        case WorkoutsSupported = 21
        case ConnectivitySupported = 23
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Capabilities))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getNumLanguages() -> Int {
        return getNumFieldValues(fieldNum: 0, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getLanguages(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setLanguages(_ index: Int, _ languages: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: index, value: languages, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumSports() -> Int {
        return getNumFieldValues(fieldNum: 1, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSports(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setSports(_ index: Int, _ sports: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: index, value: sports, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWorkoutsSupported() -> UInt32? {
        if let val = getFieldValue(fieldNum: 21, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setWorkoutsSupported(_ workoutsSupported: UInt32) {
        setFieldValue(fieldNum: 21, fieldArrayIndex: 0, value: workoutsSupported, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getConnectivitySupported() -> UInt32? {
        if let val = getFieldValue(fieldNum: 23, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setConnectivitySupported(_ connectivitySupported: UInt32) {
        setFieldValue(fieldNum: 23, fieldArrayIndex: 0, value: connectivitySupported, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
