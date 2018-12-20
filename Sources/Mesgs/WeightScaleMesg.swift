public class WeightScaleMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case Weight = 0
        case PercentFat = 1
        case PercentHydration = 2
        case VisceralFatMass = 3
        case BoneMass = 4
        case MuscleMass = 5
        case BasalMet = 7
        case PhysiqueRating = 8
        case ActiveMet = 9
        case MetabolicAge = 10
        case VisceralFatRating = 11
        case UserProfileIndex = 12
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.WeightScale))
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
    
    public func getWeight() -> Float32? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setWeight(_ weight: Float32) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: weight, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPercentFat() -> Float32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPercentFat(_ percentFat: Float32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: percentFat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPercentHydration() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPercentHydration(_ percentHydration: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: percentHydration, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getVisceralFatMass() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setVisceralFatMass(_ visceralFatMass: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: visceralFatMass, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBoneMass() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBoneMass(_ boneMass: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: boneMass, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMuscleMass() -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMuscleMass(_ muscleMass: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: muscleMass, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBasalMet() -> Float32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBasalMet(_ basalMet: Float32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: basalMet, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPhysiqueRating() -> UInt8? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setPhysiqueRating(_ physiqueRating: UInt8) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: physiqueRating, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActiveMet() -> Float32? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setActiveMet(_ activeMet: Float32) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: activeMet, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMetabolicAge() -> UInt8? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMetabolicAge(_ metabolicAge: UInt8) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: metabolicAge, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getVisceralFatRating() -> UInt8? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setVisceralFatRating(_ visceralFatRating: UInt8) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: visceralFatRating, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getUserProfileIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setUserProfileIndex(_ userProfileIndex: UInt16) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: userProfileIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
