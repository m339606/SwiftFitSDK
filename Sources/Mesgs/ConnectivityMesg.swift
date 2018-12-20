public class ConnectivityMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case BluetoothEnabled = 0
        case BluetoothLeEnabled = 1
        case AntEnabled = 2
        case Name = 3
        case LiveTrackingEnabled = 4
        case WeatherConditionsEnabled = 5
        case WeatherAlertsEnabled = 6
        case AutoActivityUploadEnabled = 7
        case CourseDownloadEnabled = 8
        case WorkoutDownloadEnabled = 9
        case GpsEphemerisDownloadEnabled = 10
        case IncidentDetectionEnabled = 11
        case GrouptrackEnabled = 12
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Connectivity))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getBluetoothEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setBluetoothEnabled(_ bluetoothEnabled: FitBool) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: bluetoothEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBluetoothLeEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setBluetoothLeEnabled(_ bluetoothLeEnabled: FitBool) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: bluetoothLeEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAntEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setAntEnabled(_ antEnabled: FitBool) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: antEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
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
            setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setName(_ name: [UInt8]) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: name, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLiveTrackingEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setLiveTrackingEnabled(_ liveTrackingEnabled: FitBool) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: liveTrackingEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWeatherConditionsEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setWeatherConditionsEnabled(_ weatherConditionsEnabled: FitBool) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: weatherConditionsEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWeatherAlertsEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setWeatherAlertsEnabled(_ weatherAlertsEnabled: FitBool) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: weatherAlertsEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAutoActivityUploadEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setAutoActivityUploadEnabled(_ autoActivityUploadEnabled: FitBool) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: autoActivityUploadEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCourseDownloadEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setCourseDownloadEnabled(_ courseDownloadEnabled: FitBool) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: courseDownloadEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWorkoutDownloadEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setWorkoutDownloadEnabled(_ workoutDownloadEnabled: FitBool) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: workoutDownloadEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGpsEphemerisDownloadEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setGpsEphemerisDownloadEnabled(_ gpsEphemerisDownloadEnabled: FitBool) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: gpsEphemerisDownloadEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getIncidentDetectionEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setIncidentDetectionEnabled(_ incidentDetectionEnabled: FitBool) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: incidentDetectionEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGrouptrackEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setGrouptrackEnabled(_ grouptrackEnabled: FitBool) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: grouptrackEnabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
