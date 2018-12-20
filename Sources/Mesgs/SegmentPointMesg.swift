public class SegmentPointMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case PositionLat = 1
        case PositionLong = 2
        case Distance = 3
        case Altitude = 4
        case LeaderTime = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.SegmentPoint))
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
    
    public func getDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDistance(_ distance: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: distance, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAltitude() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAltitude(_ altitude: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: altitude, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumLeaderTime() -> Int {
        return getNumFieldValues(fieldNum: 5, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeaderTime(_ index: Int) -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setLeaderTime(_ index: Int, _ leaderTime: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: index, value: leaderTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
