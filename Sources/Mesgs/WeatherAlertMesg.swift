public class WeatherAlertMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case ReportId = 0
        case IssueTime = 1
        case ExpireTime = 2
        case Severity = 3
        case `Type` = 4
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.WeatherAlert))
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
    
    public func getReportId() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getReportIdAsString() -> String? {
        if let val = getReportId() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setReportId(_ reportId: String) {
        if var data = reportId.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setReportId(_ reportId: [UInt8]) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: reportId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getIssueTime() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setIssueTime(_ issueTime: FitDateTime) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: issueTime.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getExpireTime() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setExpireTime(_ expireTime: FitDateTime) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: expireTime.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSeverity() -> WeatherSeverity? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WeatherSeverity(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSeverity(_ severity: WeatherSeverity) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: severity.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getType() -> WeatherSevereType? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WeatherSevereType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setType(_ type: WeatherSevereType) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: type.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
