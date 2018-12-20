public class WorkoutSessionMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Sport = 0
        case SubSport = 1
        case NumValidSteps = 2
        case FirstStepIndex = 3
        case PoolLength = 4
        case PoolLengthUnit = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.WorkoutSession))
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
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSubSport() -> SubSport? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSubSport(_ subSport: SubSport) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: subSport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumValidSteps() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNumValidSteps(_ numValidSteps: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: numValidSteps, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFirstStepIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setFirstStepIndex(_ firstStepIndex: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: firstStepIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPoolLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPoolLength(_ poolLength: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: poolLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPoolLengthUnit() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setPoolLengthUnit(_ poolLengthUnit: DisplayMeasure) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: poolLengthUnit.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
