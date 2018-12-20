public class DeveloperDataIdMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case DeveloperId = 0
        case ApplicationId = 1
        case ManufacturerId = 2
        case DeveloperDataIndex = 3
        case ApplicationVersion = 4
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.DeveloperDataId))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getNumDeveloperId() -> Int {
        return getNumFieldValues(fieldNum: 0, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDeveloperId(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeveloperId(_ index: Int, _ developerId: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: index, value: developerId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumApplicationId() -> Int {
        return getNumFieldValues(fieldNum: 1, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getApplicationId(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setApplicationId(_ index: Int, _ applicationId: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: index, value: applicationId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getManufacturerId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setManufacturerId(_ manufacturerId: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: manufacturerId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDeveloperDataIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeveloperDataIndex(_ developerDataIndex: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: developerDataIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getApplicationVersion() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setApplicationVersion(_ applicationVersion: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: applicationVersion, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

