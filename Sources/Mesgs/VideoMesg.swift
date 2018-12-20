public class VideoMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Url = 0
        case HostingProvider = 1
        case Duration = 2
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Video))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getUrl() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getUrlAsString() -> String? {
        if let val = getUrl() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setUrl(_ url: String) {
        if var data = url.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setUrl(_ url: [UInt8]) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: url, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHostingProvider() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getHostingProviderAsString() -> String? {
        if let val = getHostingProvider() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setHostingProvider(_ hostingProvider: String) {
        if var data = hostingProvider.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setHostingProvider(_ hostingProvider: [UInt8]) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: hostingProvider, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDuration() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDuration(_ duration: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: duration, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
