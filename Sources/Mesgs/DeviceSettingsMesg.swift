public class DeviceSettingsMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case ActiveTimeZone = 0
        case UtcOffset = 1
        case TimeOffset = 2
        case TimeMode = 4
        case TimeZoneOffset = 5
        case BacklightMode = 12
        case ActivityTrackerEnabled = 36
        case ClockTime = 39
        case PagesEnabled = 40
        case MoveAlertEnabled = 46
        case DateMode = 47
        case DisplayOrientation = 55
        case MountingSide = 56
        case DefaultPage = 57
        case AutosyncMinSteps = 58
        case AutosyncMinTime = 59
        case LactateThresholdAutodetectEnabled = 80
        case BleAutoUploadEnabled = 86
        case AutoSyncFrequency = 89
        case AutoActivityDetect = 90
        case NumberOfScreens = 94
        case SmartNotificationDisplayOrientation = 95
        case TapInterface = 134
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.DeviceSettings))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getActiveTimeZone() -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setActiveTimeZone(_ activeTimeZone: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: activeTimeZone, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getUtcOffset() -> UInt32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setUtcOffset(_ utcOffset: UInt32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: utcOffset, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeOffset() -> Int {
        return getNumFieldValues(fieldNum: 2, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getTimeOffset(_ index: Int) -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTimeOffset(_ index: Int, _ timeOffset: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: timeOffset, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeMode() -> Int {
        return getNumFieldValues(fieldNum: 4, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeMode(_ index: Int) -> TimeMode? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return TimeMode(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setTimeMode(_ index: Int, _ timeMode: TimeMode) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: index, value: timeMode.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumTimeZoneOffset() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeZoneOffset(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeZoneOffset(_ index: Int, _ timeZoneOffset: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: timeZoneOffset, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBacklightMode() -> BacklightMode? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return BacklightMode(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setBacklightMode(_ backlightMode: BacklightMode) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: backlightMode.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActivityTrackerEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 36, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setActivityTrackerEnabled(_ activityTrackerEnabled: FitBool) {
        setFieldValue(fieldNum: 36, fieldArrayIndex: 0, value: activityTrackerEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getClockTime() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 39, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setClockTime(_ clockTime: FitDateTime) {
        setFieldValue(fieldNum: 39, fieldArrayIndex: 0, value: clockTime.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumPagesEnabled() -> Int {
        return getNumFieldValues(fieldNum: 40, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPagesEnabled(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 40, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setPagesEnabled(_ index: Int, _ pagesEnabled: UInt16) {
        setFieldValue(fieldNum: 40, fieldArrayIndex: index, value: pagesEnabled, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMoveAlertEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 46, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setMoveAlertEnabled(_ moveAlertEnabled: FitBool) {
        setFieldValue(fieldNum: 46, fieldArrayIndex: 0, value: moveAlertEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDateMode() -> DateMode? {
        if let val = getFieldValue(fieldNum: 47, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DateMode(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDateMode(_ dateMode: DateMode) {
        setFieldValue(fieldNum: 47, fieldArrayIndex: 0, value: dateMode.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDisplayOrientation() -> DisplayOrientation? {
        if let val = getFieldValue(fieldNum: 55, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayOrientation(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDisplayOrientation(_ displayOrientation: DisplayOrientation) {
        setFieldValue(fieldNum: 55, fieldArrayIndex: 0, value: displayOrientation.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMountingSide() -> Side? {
        if let val = getFieldValue(fieldNum: 56, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Side(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setMountingSide(_ mountingSide: Side) {
        setFieldValue(fieldNum: 56, fieldArrayIndex: 0, value: mountingSide.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumDefaultPage() -> Int {
        return getNumFieldValues(fieldNum: 57, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getDefaultPage(_ index: Int) -> UInt16? {
        if let val = getFieldValue(fieldNum: 57, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setDefaultPage(_ index: Int, _ defaultPage: UInt16) {
        setFieldValue(fieldNum: 57, fieldArrayIndex: index, value: defaultPage, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAutosyncMinSteps() -> UInt16? {
        if let val = getFieldValue(fieldNum: 58, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAutosyncMinSteps(_ autosyncMinSteps: UInt16) {
        setFieldValue(fieldNum: 58, fieldArrayIndex: 0, value: autosyncMinSteps, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAutosyncMinTime() -> UInt16? {
        if let val = getFieldValue(fieldNum: 59, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAutosyncMinTime(_ autosyncMinTime: UInt16) {
        setFieldValue(fieldNum: 59, fieldArrayIndex: 0, value: autosyncMinTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLactateThresholdAutodetectEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 80, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setLactateThresholdAutodetectEnabled(_ lactateThresholdAutodetectEnabled: FitBool) {
        setFieldValue(fieldNum: 80, fieldArrayIndex: 0, value: lactateThresholdAutodetectEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBleAutoUploadEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 86, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setBleAutoUploadEnabled(_ bleAutoUploadEnabled: FitBool) {
        setFieldValue(fieldNum: 86, fieldArrayIndex: 0, value: bleAutoUploadEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAutoSyncFrequency() -> AutoSyncFrequency? {
        if let val = getFieldValue(fieldNum: 89, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return AutoSyncFrequency(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setAutoSyncFrequency(_ autoSyncFrequency: AutoSyncFrequency) {
        setFieldValue(fieldNum: 89, fieldArrayIndex: 0, value: autoSyncFrequency.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAutoActivityDetect() -> UInt32? {
        if let val = getFieldValue(fieldNum: 90, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setAutoActivityDetect(_ autoActivityDetect: UInt32) {
        setFieldValue(fieldNum: 90, fieldArrayIndex: 0, value: autoActivityDetect, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumberOfScreens() -> UInt8? {
        if let val = getFieldValue(fieldNum: 94, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setNumberOfScreens(_ numberOfScreens: UInt8) {
        setFieldValue(fieldNum: 94, fieldArrayIndex: 0, value: numberOfScreens, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSmartNotificationDisplayOrientation() -> DisplayOrientation? {
        if let val = getFieldValue(fieldNum: 95, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DisplayOrientation(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSmartNotificationDisplayOrientation(_ smartNotificationDisplayOrientation: DisplayOrientation) {
        setFieldValue(fieldNum: 95, fieldArrayIndex: 0, value: smartNotificationDisplayOrientation.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTapInterface() -> Switch? {
        if let val = getFieldValue(fieldNum: 134, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Switch(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setTapInterface(_ tapInterface: Switch) {
        setFieldValue(fieldNum: 134, fieldArrayIndex: 0, value: tapInterface.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
