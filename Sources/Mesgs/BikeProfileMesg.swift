public class BikeProfileMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Name = 0
        case Sport = 1
        case SubSport = 2
        case Odometer = 3
        case BikeSpdAntId = 4
        case BikeCadAntId = 5
        case BikeSpdcadAntId = 6
        case BikePowerAntId = 7
        case CustomWheelsize = 8
        case AutoWheelsize = 9
        case BikeWeight = 10
        case PowerCalFactor = 11
        case AutoWheelCal = 12
        case AutoPowerZero = 13
        case Id = 14
        case SpdEnabled = 15
        case CadEnabled = 16
        case SpdcadEnabled = 17
        case PowerEnabled = 18
        case CrankLength = 19
        case Enabled = 20
        case BikeSpdAntIdTransType = 21
        case BikeCadAntIdTransType = 22
        case BikeSpdcadAntIdTransType = 23
        case BikePowerAntIdTransType = 24
        case OdometerRollover = 37
        case FrontGearNum = 38
        case FrontGear = 39
        case RearGearNum = 40
        case RearGear = 41
        case ShimanoDi2Enabled = 44
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.BikeProfile))
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
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSubSport() -> SubSport? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SubSport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSubSport(_ subSport: SubSport) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: subSport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
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
    
    public func getBikeSpdAntId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setBikeSpdAntId(_ bikeSpdAntId: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: bikeSpdAntId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBikeCadAntId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setBikeCadAntId(_ bikeCadAntId: UInt16) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: bikeCadAntId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBikeSpdcadAntId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setBikeSpdcadAntId(_ bikeSpdcadAntId: UInt16) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: bikeSpdcadAntId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBikePowerAntId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setBikePowerAntId(_ bikePowerAntId: UInt16) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: bikePowerAntId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCustomWheelsize() -> Float32? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCustomWheelsize(_ customWheelsize: Float32) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: customWheelsize, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAutoWheelsize() -> Float32? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAutoWheelsize(_ autoWheelsize: Float32) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: autoWheelsize, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBikeWeight() -> Float32? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBikeWeight(_ bikeWeight: Float32) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: bikeWeight, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPowerCalFactor() -> Float32? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setPowerCalFactor(_ powerCalFactor: Float32) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: powerCalFactor, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAutoWheelCal() -> FitBool? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setAutoWheelCal(_ autoWheelCal: FitBool) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: autoWheelCal.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAutoPowerZero() -> FitBool? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setAutoPowerZero(_ autoPowerZero: FitBool) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: autoPowerZero.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getId() -> UInt8? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setId(_ id: UInt8) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: id, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSpdEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 15, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSpdEnabled(_ spdEnabled: FitBool) {
        setFieldValue(fieldNum: 15, fieldArrayIndex: 0, value: spdEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCadEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 16, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setCadEnabled(_ cadEnabled: FitBool) {
        setFieldValue(fieldNum: 16, fieldArrayIndex: 0, value: cadEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSpdcadEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 17, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSpdcadEnabled(_ spdcadEnabled: FitBool) {
        setFieldValue(fieldNum: 17, fieldArrayIndex: 0, value: spdcadEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPowerEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setPowerEnabled(_ powerEnabled: FitBool) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: powerEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCrankLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCrankLength(_ crankLength: Float32) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: crankLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 20, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEnabled(_ enabled: FitBool) {
        setFieldValue(fieldNum: 20, fieldArrayIndex: 0, value: enabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBikeSpdAntIdTransType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 21, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setBikeSpdAntIdTransType(_ bikeSpdAntIdTransType: UInt8) {
        setFieldValue(fieldNum: 21, fieldArrayIndex: 0, value: bikeSpdAntIdTransType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBikeCadAntIdTransType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 22, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setBikeCadAntIdTransType(_ bikeCadAntIdTransType: UInt8) {
        setFieldValue(fieldNum: 22, fieldArrayIndex: 0, value: bikeCadAntIdTransType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBikeSpdcadAntIdTransType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 23, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setBikeSpdcadAntIdTransType(_ bikeSpdcadAntIdTransType: UInt8) {
        setFieldValue(fieldNum: 23, fieldArrayIndex: 0, value: bikeSpdcadAntIdTransType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBikePowerAntIdTransType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 24, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setBikePowerAntIdTransType(_ bikePowerAntIdTransType: UInt8) {
        setFieldValue(fieldNum: 24, fieldArrayIndex: 0, value: bikePowerAntIdTransType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOdometerRollover() -> UInt8? {
        if let val = getFieldValue(fieldNum: 37, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setOdometerRollover(_ odometerRollover: UInt8) {
        setFieldValue(fieldNum: 37, fieldArrayIndex: 0, value: odometerRollover, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFrontGearNum() -> UInt8? {
        if let val = getFieldValue(fieldNum: 38, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFrontGearNum(_ frontGearNum: UInt8) {
        setFieldValue(fieldNum: 38, fieldArrayIndex: 0, value: frontGearNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumFrontGear(_ index: Int) -> Int {
        return getNumFieldValues(fieldNum: 39, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFrontGear(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 39, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFrontGear(_ index: Int, _ frontGear: UInt8) {
        setFieldValue(fieldNum: 39, fieldArrayIndex: index, value: frontGear, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRearGearNum() -> UInt8? {
        if let val = getFieldValue(fieldNum: 40, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setRearGearNum(_ rearGearNum: UInt8) {
        setFieldValue(fieldNum: 40, fieldArrayIndex: 0, value: rearGearNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumRearGear() -> Int {
        return getNumFieldValues(fieldNum: 41, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRearGear(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 41, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }

    public func setRearGear(_ index: Int, _ rearGear: UInt8) {
        setFieldValue(fieldNum: 41, fieldArrayIndex: index, value: rearGear, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getShimanoDi2Enabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 44, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setShimanoDi2Enabled(_ shimanoDi2Enabled: FitBool) {
        setFieldValue(fieldNum: 44, fieldArrayIndex: 0, value: shimanoDi2Enabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
