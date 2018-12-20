public class WeatherConditionsMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case WeatherReport = 0
        case Temperature = 1
        case Condition = 2
        case WindDirection = 3
        case WindSpeed = 4
        case PrecipitationProbability = 5
        case TemperatureFeelsLike = 6
        case RelativeHumidity = 7
        case Location = 8
        case ObservedAtTime = 9
        case ObservedLocationLat = 10
        case ObservedLocationLong = 11
        case DayOfWeek = 12
        case HighTemperature = 13
        case LowTemperature = 14
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.WeatherConditions))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 253, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setTimestamp(_ timestamp: FitDateTime) {
        setFieldValue(fieldNum: 253, fieldArrayIndex: 0, value: timestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWeatherReport() -> WeatherReport? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WeatherReport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setWeatherReport(_ weatherReport: WeatherReport) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: weatherReport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setTemperature(_ temperature: Int8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: temperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCondition() -> WeatherStatus? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WeatherStatus(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setCondition(_ condition: WeatherStatus) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: condition, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWindDirection() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setWindDirection(_ windDirection: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: windDirection, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWindSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setWindSpeed(_ windSpeed: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: windSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPrecipitationProbability() -> UInt8? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setPrecipitationProbability(_ precipitationProbability: UInt8) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: precipitationProbability, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTemperatureFeelsLike() -> Int8? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setTemperatureFeelsLike(_ temperatureFeelsLike: Int8) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: temperatureFeelsLike, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRelativeHumidity() -> UInt8? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setRelativeHumidity(_ relativeHumidity: UInt8) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: relativeHumidity, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLocation() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getLocationAsString() -> String? {
        if let val = getLocation() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setLocation(_ location: String) {
        if var data = location.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setLocation(_ location: [UInt8]) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: location, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getObservedAtTime() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setObservedAtTime(_ observedAtTime: FitDateTime) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: observedAtTime.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getObservedLocationLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setObservedLocationLat(_ observedLocationLat: Int32) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: observedLocationLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getObservedLocationLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setObservedLocationLong(_ observedLocationLong: Int32) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: observedLocationLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDayOfWeek() -> DayOfWeek? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return DayOfWeek(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDayOfWeek(_ dayOfWeek: DayOfWeek) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: dayOfWeek.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHighTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setHighTemperature(_ highTemperature: Int8) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: highTemperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLowTemperature() -> Int8? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setLowTemperature(_ lowTemperature: Int8) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: lowTemperature, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
