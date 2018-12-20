public class DiveSettingsMesg : Mesg {
    
    public enum HeartRateSourceSubfield: UInt16 {
        case HeartRateAntplusDeviceType = 0
        case HeartRateLocalDeviceType = 1
        case Subfields = 2
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Name = 0
        case Model = 1
        case GfLow = 2
        case GfHigh = 3
        case WaterType = 4
        case WaterDensity = 5
        case Po2Warn = 6
        case Po2Critical = 7
        case Po2Deco = 8
        case SafetyStopEnabled = 9
        case BottomDepth = 10
        case BottomTime = 11
        case ApneaCountdownEnabled = 12
        case ApneaCountdownTime = 13
        case BacklightMode = 14
        case BacklightBrightness = 15
        case BacklightTimeout = 16
        case RepeatDiveInterval = 17
        case SafetyStopTime = 18
        case HeartRateSourceType = 19
        case HeartRateSource = 20
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.DiveSettings))
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
    
    public func getName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getNameAsString() -> String? {
        if let val = getName() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setName(_ name: String) {
        if var data = name.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setName(_ name: [UInt8]) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: name, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getModel() -> TissueModelType? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return TissueModelType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setModel(_ model: TissueModelType) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: model.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGfLow() -> UInt8? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setGfLow(_ gfLow: UInt8) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: gfLow, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGfHigh() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setGfHigh(_ gfHigh: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: gfHigh, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWaterType() -> WaterType? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WaterType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setWaterType(_ waterType: WaterType) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: waterType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWaterDensity() -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setWaterDensity(_ waterDensity: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: waterDensity, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPo2Warn() -> Float32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPo2Warn(_ po2Warn: Float32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: po2Warn, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPo2Critical() -> Float32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPo2Critical(_ po2Critical: Float32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: po2Critical, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPo2Deco() -> Float32? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPo2Deco(_ po2Deco: Float32) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: po2Deco, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSafetyStopEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSafetyStopEnabled(_ safetyStopEnabled: FitBool) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: safetyStopEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBottomDepth() -> Float32? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBottomDepth(_ bottomDepth: Float32) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: bottomDepth, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBottomTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setBottomTime(_ bottomTime: UInt32) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: bottomTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getApneaCountdownEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setApneaCountdownEnabled(_ apneaCountdownEnabled: FitBool) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: apneaCountdownEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getApneaCountdownTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setApneaCountdownTime(_ apneaCountdownTime: UInt32) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: apneaCountdownTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBacklightMode() -> DiveBacklightMode? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DiveBacklightMode(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setBacklightMode(_ backlightMode: DiveBacklightMode) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: backlightMode.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBacklightBrightness() -> UInt8? {
        if let val = getFieldValue(fieldNum: 15, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setBacklightBrightness(_ backlightBrightness: UInt8) {
        setFieldValue(fieldNum: 15, fieldArrayIndex: 0, value: backlightBrightness, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBacklightTimeout() -> UInt8? {
        if let val = getFieldValue(fieldNum: 16, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setBacklightTimeout(_ backlightTimeout: UInt8) {
        setFieldValue(fieldNum: 16, fieldArrayIndex: 0, value: backlightTimeout, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRepeatDiveInterval() -> UInt16? {
        if let val = getFieldValue(fieldNum: 17, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setRepeatDiveInterval(_ repeatDiveInterval: UInt16) {
        setFieldValue(fieldNum: 17, fieldArrayIndex: 0, value: repeatDiveInterval, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSafetyStopTime() -> UInt16? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setSafetyStopTime(_ safetyStopTime: UInt16) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: safetyStopTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeartRateSourceType() -> SourceType? {
        if let val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SourceType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setHeartRateSourceType(_ heartRateSourceType: SourceType) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: heartRateSourceType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeartRateSource() -> UInt8? {
        if let val = getFieldValue(fieldNum: 20, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHeartRateSource(_ heartRateSource: UInt8) {
        setFieldValue(fieldNum: 20, fieldArrayIndex: 0, value: heartRateSource, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeartRateAntplusDeviceType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 20, fieldArrayIndex: 0, subFieldIndex: HeartRateSourceSubfield.HeartRateAntplusDeviceType.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHeartRateAntplusDeviceType(_ heartRateAntplusDeviceType: UInt8) {
        setFieldValue(fieldNum: 20, fieldArrayIndex: 0, value: heartRateAntplusDeviceType, subfieldIndex: HeartRateSourceSubfield.HeartRateAntplusDeviceType.rawValue)
    }
    
    public func getHeartRateLocalDeviceType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 20, fieldArrayIndex: 0, subFieldIndex: HeartRateSourceSubfield.HeartRateLocalDeviceType.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHeartRateLocalDeviceType(_ heartRateLocalDeviceType: UInt8) {
        setFieldValue(fieldNum: 20, fieldArrayIndex: 0, value: heartRateLocalDeviceType, subfieldIndex: HeartRateSourceSubfield.HeartRateLocalDeviceType.rawValue)
    }
    
}
