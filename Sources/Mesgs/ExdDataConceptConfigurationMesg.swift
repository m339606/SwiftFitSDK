public class ExdDataConceptConfigurationMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case ScreenIndex = 0
        case ConceptField = 1
        case FieldId = 2
        case ConceptIndex = 3
        case DataPage = 4
        case ConceptKey = 5
        case Scaling = 6
        case DataUnits = 8
        case Qualifier = 9
        case Descriptor = 10
        case IsSigned = 11
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.ExdDataConceptConfiguration))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getScreenIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setScreenIndex(_ screenIndex: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: screenIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getConceptField() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setConceptField(_ conceptField: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: conceptField, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFieldId() -> UInt8? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFieldId(_ fieldId: UInt8) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: fieldId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getConceptIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setConceptIndex(_ conceptIndex: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: conceptIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDataPage() -> UInt8? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDataPage(_ dataPage: UInt8) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: dataPage, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getConceptKey() -> UInt8? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setConceptKey(_ conceptKey: UInt8) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: conceptKey, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getScaling() -> UInt8? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setScaling(_ scaling: UInt8) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: scaling, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDataUnits() -> ExdDataUnits? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ExdDataUnits(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDataUnits(_ dataUnits: ExdDataUnits) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: dataUnits.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getQualifier() -> ExdQualifiers? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ExdQualifiers(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setQualifier(_ qualifier: ExdQualifiers) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: qualifier.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDescriptor() -> ExdDescriptors? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ExdDescriptors(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDescriptor(_ descriptor: ExdDescriptors) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: descriptor.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getIsSigned() -> FitBool? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setIsSigned(_ isSigned: FitBool) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: isSigned.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
