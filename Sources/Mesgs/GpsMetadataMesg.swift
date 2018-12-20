public class GpsMetadataMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case PositionLat = 1
        case PositionLong = 2
        case EnhancedAltitude = 3
        case EnhancedSpeed = 4
        case Heading = 5
        case UtcTimestamp = 6
        case Velocity = 7
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.GpsMetadata))
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
    
    public func getTimestampMs() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setTimestampMs(_ timestampMs: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: timestampMs, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPositionLat() -> Int32? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setPositionLat(_ positionLat: Int32) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: positionLat, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getPositionLong() -> Int32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int32
        } else {
            return nil
        }
    }
    
    public func setPositionLong(_ positionLong: Int32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: positionLong, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedAltitude(_ enhancedAltitude: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: enhancedAltitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnhancedSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setEnhancedSpeed(_ enhancedSpeed: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: enhancedSpeed, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeading() -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setHeading(_ heading: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: heading, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getUtcTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setUtcTimestamp(_ utcTimestamp: FitDateTime) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: utcTimestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumVelocity() -> Int {
        return getNumFieldValues(fieldNum: 7, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getVelocity(_ index: Int) -> Int16? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int16
        } else {
            return nil
        }
    }
    
    public func setVelocity(_ index: Int, _ velocity: Int16) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: index, value: velocity, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
