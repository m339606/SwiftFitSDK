public class SegmentIdMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Name = 0
        case Uuid = 1
        case Sport = 2
        case Enabled = 3
        case UserProfilePrimaryKey = 4
        case DeviceId = 5
        case DefaultRaceLeader = 6
        case DeleteStatus = 7
        case SelectionType = 8
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.SegmentId))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
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
    
    public func getUuid() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getUuidAsString() -> String? {
        if let val = getUuid() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setUuid(_ uuid: String) {
        if var data = uuid.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setUuid(_ uuid: [UInt8]) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: uuid, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSport() -> Sport? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Sport(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSport(_ sport: Sport) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: sport.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
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
    
    public func getDeviceId() -> UInt32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDeviceId(_ deviceId: UInt32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: deviceId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDefaultRaceLeader() -> UInt8? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDefaultRaceLeader(_ defaultRaceLeader: UInt8) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: defaultRaceLeader, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDeleteStatus() -> SegmentDeleteStatus? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SegmentDeleteStatus(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDeleteStatus(_ deleteStatus: SegmentDeleteStatus) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: deleteStatus.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSelectionType() -> SegmentSelectionType? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SegmentSelectionType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSelectionType(_ selectionType: SegmentSelectionType) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: selectionType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
