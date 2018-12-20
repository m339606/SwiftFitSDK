public class ExdDataFieldConfigurationMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case ScreenIndex = 0
        case ConceptField = 1
        case FieldId = 2
        case ConceptCount = 3
        case DisplayType = 4
        case Title = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.ExdDataFieldConfiguration))
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
    
    public func getConceptCount() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setConceptCount(_ conceptCount: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: conceptCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDisplayType() -> ExdDisplayType? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ExdDisplayType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDisplayType(_ displayType: ExdDisplayType) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: displayType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTitle() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTitle(_ index: Int) -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getTitleAsString(_ index: Int) -> String? {
        if let val = getTitle(index) {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setTitle(_ index: Int, _ title: String) {
        if var data = title.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setTitle(_ index: Int, _ title: [UInt8]) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: title, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
