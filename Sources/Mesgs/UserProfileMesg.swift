public class UserProfileMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case FriendlyName = 0
        case Gender = 1
        case Age = 2
        case Height = 3
        case Weight = 4
        case Language = 5
        case ElevSetting = 6
        case WeightSetting = 7
        case RestingHeartRate = 8
        case DefaultMaxRunningHeartRate = 9
        case DefaultMaxBikingHeartRate = 10
        case DefaultMaxHeartRate = 11
        case HrSetting = 12
        case SpeedSetting = 13
        case DistSetting = 14
        case PowerSetting = 16
        case ActivityClass = 17
        case PositionSetting = 18
        case TemperatureSetting = 21
        case LocalId = 22
        case GlobalId = 23
        case WakeTime = 28
        case SleepTime = 29
        case HeightSetting = 30
        case UserRunningStepLength = 31
        case UserWalkingStepLength = 32
        case DepthSetting = 47
        case DiveCount = 49
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.UserProfile))
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
    
    public func getFriendlyName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getFriendlyNameAsString() -> String? {
        if let val = getFriendlyName() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setFriendlyName(_ friendlyName: String) {
        if var data = friendlyName.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setFriendlyName(_ friendlyName: [UInt8]) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: friendlyName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGender() -> Gender? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Gender(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setGender(_ gender: Gender) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: gender.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAge() -> UInt8? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAge(_ age: UInt8) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: age, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeight() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setHeight(_ height: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: height, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWeight() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setWeight(_ weight: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: weight, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLanguage() -> Language? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Language(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setLanguage(_ language: Language) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: language.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getElevSetting() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setElevSetting(_ elevSetting: DisplayMeasure) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: elevSetting, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWeightSetting() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setWeightSetting(_ weightSetting: DisplayMeasure) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: weightSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRestingHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setRestingHeartRate(_ restingHeartRate: UInt8) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: restingHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDefaultMaxRunningHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDefaultMaxRunningHeartRate(_ defaultMaxRunningHeartRate: UInt8) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: defaultMaxRunningHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDefaultMaxBikingHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDefaultMaxBikingHeartRate(_ defaultMaxBikingHeartRate: UInt8) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: defaultMaxBikingHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDefaultMaxHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDefaultMaxHeartRate(_ defaultMaxHeartRate: UInt8) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: defaultMaxHeartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHrSetting() -> DisplayHeart? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayHeart(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setHrSetting(_ hrSetting: DisplayHeart) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: hrSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSpeedSetting() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSpeedSetting(_ speedSetting: DisplayMeasure) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: speedSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDistSetting() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDistSetting(_ distSetting: DisplayMeasure) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: distSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPowerSetting() -> DisplayPower? {
        if let val = getFieldValue(fieldNum: 16, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayPower(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setPowerSetting(_ powerSetting: DisplayPower) {
        setFieldValue(fieldNum: 16, fieldArrayIndex: 0, value: powerSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActivityClass() -> ActivityClass? {
        if let val = getFieldValue(fieldNum: 17, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return ActivityClass(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setActivityClass(_ activityClass: ActivityClass) {
        setFieldValue(fieldNum: 17, fieldArrayIndex: 0, value: activityClass.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPositionSetting() -> DisplayPosition? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayPosition(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setPositionSetting(_ positionSetting: DisplayPosition) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: positionSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTemperatureSetting() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 21, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setTemperatureSetting(_ temperatureSetting: DisplayMeasure) {
        setFieldValue(fieldNum: 21, fieldArrayIndex: 0, value: temperatureSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLocalId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 22, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setLocalId(_ localId: UInt16) {
        setFieldValue(fieldNum: 22, fieldArrayIndex: 0, value: localId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumGlobalId() -> Int {
        return getNumFieldValues(fieldNum: 23, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGlobalId(_ index: Int) -> UInt8? {
        if let val = getFieldValue(fieldNum: 23, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setGlobalId(_ index: Int, _ globalId: UInt8) {
        setFieldValue(fieldNum: 23, fieldArrayIndex: index, value: globalId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWakeTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 28, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setWakeTime(_ wakeTime: UInt32) {
        setFieldValue(fieldNum: 28, fieldArrayIndex: 0, value: wakeTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSleepTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 29, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setSleepTime(_ sleepTime: UInt32) {
        setFieldValue(fieldNum: 29, fieldArrayIndex: 0, value: sleepTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeightSetting() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 30, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setHeightSetting(_ heightSetting: DisplayMeasure) {
        setFieldValue(fieldNum: 30, fieldArrayIndex: 0, value: heightSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getUserRunningStepLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 31, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setUserRunningStepLength(_ userRunningStepLength: Float32) {
        setFieldValue(fieldNum: 31, fieldArrayIndex: 0, value: userRunningStepLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getUserWalkingStepLength() -> Float32? {
        if let val = getFieldValue(fieldNum: 32, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setUserWalkingStepLength(_ userWalkingStepLength: Float32) {
        setFieldValue(fieldNum: 32, fieldArrayIndex: 0, value: userWalkingStepLength, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDepthSetting() -> DisplayMeasure? {
        if let val = getFieldValue(fieldNum: 47, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayMeasure(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDepthSetting(_ depthSetting: DisplayMeasure) {
        setFieldValue(fieldNum: 47, fieldArrayIndex: 0, value: depthSetting.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDiveCount() -> UInt32? {
        if let val = getFieldValue(fieldNum: 49, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDiveCount(_ diveCount: UInt32) {
        setFieldValue(fieldNum: 49, fieldArrayIndex: 0, value: diveCount, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
