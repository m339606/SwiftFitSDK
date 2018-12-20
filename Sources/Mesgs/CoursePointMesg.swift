public class CoursePointMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Timestamp = 1
        case PositionLat = 2
        case PositionLong = 3
        case Distance = 4
        case `Type` = 5
        case Name = 6
        case Favorite = 8
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.CoursePoint))
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
    
    public func getTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setTimestamp(_ timestamp: FitDateTime) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: timestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPositionLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setPositionLat(_ positionLat: Int32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: positionLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPositionLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setPositionLong(_ positionLong: Int32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: positionLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDistance(_ distance: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: distance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getType() -> CoursePoint? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return CoursePoint(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setType(_ type: CoursePoint) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: type.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
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
            setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setName(_ name: [UInt8]) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: name, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFavorite() -> FitBool? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setFavorite(_ favorite: FitBool) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: favorite.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

