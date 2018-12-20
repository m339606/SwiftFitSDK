public class ZonesTargetMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MaxHeartRate = 1
        case ThresholdHeartRate = 2
        case FunctionalThresholdPower = 3
        case HrCalcType = 5
        case PwrCalcType = 7
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.ZonesTarget))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getMaxHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setMaxHeartRate(_ maxHeartRate: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: maxHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getThresholdHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setThresholdHeartRate(_ thresholdHeartRate: UInt8) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: thresholdHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFunctionalThresholdPower() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setFunctionalThresholdPower(_ functionalThresholdPower: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: functionalThresholdPower, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHrCalcType() -> HrZoneCalc? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return HrZoneCalc(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setHrCalcType(_ hrCalcType: HrZoneCalc) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: hrCalcType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPwrCalcType() -> PwrZoneCalc? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return PwrZoneCalc(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setPwrCalcType(_ pwrCalcType: PwrZoneCalc) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: pwrCalcType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
