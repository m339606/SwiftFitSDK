public class SdmProfileMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Enabled = 0
        case SdmAntId = 1
        case SdmCalFactor = 2
        case Odometer = 3
        case SpeedSource = 4
        case SdmAntIdTransType = 5
        case OdometerRollover = 7
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.SdmProfile))
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
    
    public func getEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEnabled(_ enabled: FitBool) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: enabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSdmAntId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setSdmAntId(_ sdmAntId: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: sdmAntId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSdmCalFactor() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSdmCalFactor(_ sdmCalFactor: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: sdmCalFactor, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOdometer() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setOdometer(_ odometer: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: odometer, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSpeedSource() -> FitBool? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSpeedSource(_ speedSource: FitBool) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: speedSource.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSdmAntIdTransType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setSdmAntIdTransType(_ sdmAntIdTransType: UInt8) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: sdmAntIdTransType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOdometerRollover() -> UInt8? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setOdometerRollover(_ odometerRollover: UInt8) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: odometerRollover, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
