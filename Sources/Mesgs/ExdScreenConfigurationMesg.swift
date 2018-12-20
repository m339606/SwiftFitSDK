public class ExdScreenConfigurationMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case ScreenIndex = 0
        case FieldCount = 1
        case Layout = 2
        case ScreenEnabled = 3
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.ExdScreenConfiguration))
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
    
    public func getFieldCount() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFieldCount(_ fieldCount: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: fieldCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLayout() -> ExdLayout? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ExdLayout(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setLayout(_ layout: ExdLayout) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: layout.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getScreenEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setScreenEnabled(_ screenEnabled: FitBool) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: screenEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
