public class SegmentFileMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case FileUuid = 1
        case Enabled = 3
        case UserProfilePrimaryKey = 4
        case LeaderType = 7
        case LeaderGroupPrimaryKey = 8
        case LeaderActivityId = 9
        case LeaderActivityIdString = 10
        case DefaultRaceLeader = 11
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.SegmentFile))
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
    
    public func getFileUuid() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getFileUuidAsString() -> String? {
        if let val = getFileUuid() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setFileUuid(_ fileUuid: String) {
        if var data = fileUuid.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setFileUuid(_ fileUuid: [UInt8]) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: fileUuid, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEnabled() -> FitBool? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEnabled(_ enabled: FitBool) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: enabled.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getUserProfilePrimaryKey() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setUserProfilePrimaryKey(_ userProfilePrimaryKey: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: userProfilePrimaryKey, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumLeaderType() -> Int {
        return getNumFieldValues(fieldNum: 7, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeaderType(_ index: Int) -> SegmentLeaderboardType? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SegmentLeaderboardType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setLeaderType(_ index: Int, _ leaderType: SegmentLeaderboardType) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: index, value: leaderType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumLeaderGroupPrimaryKey() -> Int {
        return getNumFieldValues(fieldNum: 8, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeaderGroupPrimaryKey(_ index: Int) -> UInt32? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setLeaderGroupPrimaryKey(_ index: Int, _ leaderGroupPrimaryKey: UInt32) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: index, value: leaderGroupPrimaryKey, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumLeaderActivityId() -> Int {
        return getNumFieldValues(fieldNum: 9, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeaderActivityId(_ index: Int) -> UInt32? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setLeaderActivityId(_ index: Int, _ leaderActivityId: UInt32) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: index, value: leaderActivityId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLeaderActivityIdString() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getLeaderActivityIdStringAsString() -> String? {
        if let val = getLeaderActivityIdString() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setLeaderActivityIdString(_ leaderActivityIdString: String) {
        if var data = leaderActivityIdString.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setLeaderActivityIdString(_ leaderActivityIdString: [UInt8]) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: leaderActivityIdString, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDefaultRaceLeader() -> UInt8? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDefaultRaceLeader(_ defaultRaceLeader: UInt8) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: defaultRaceLeader, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
