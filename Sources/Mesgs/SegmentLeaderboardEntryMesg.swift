public class SegmentLeaderboardEntryMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Name = 0
        case `Type` = 1
        case GroupPrimaryKey = 2
        case ActivityId = 3
        case SegmentTime = 4
        case ActivityIdString = 5
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.SegmentLeaderboardEntry))
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
    
    public func getType() -> SegmentLeaderboardType? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SegmentLeaderboardType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setType(_ type: SegmentLeaderboardType) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: type.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGroupPrimaryKey() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setGroupPrimaryKey(_ groupPrimaryKey: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: groupPrimaryKey, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActivityId() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setActivityId(_ activityId: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: activityId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSegmentTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSegmentTime(_ segmentTime: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: segmentTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getActivityIdString() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getActivityIdStringAsString() -> String? {
        if let val = getActivityIdString() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setActivityIdString(_ activityIdString: String) {
        if var data = activityIdString.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setActivityIdString(_ activityIdString: [UInt8]) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: activityIdString, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
