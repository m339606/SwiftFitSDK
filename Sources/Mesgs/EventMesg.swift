public class EventMesg : Mesg {
    
    public enum DataSubfield: UInt16 {
        case TimerTrigger = 0
        case CoursePointIndex = 1
        case BatteryLevel = 2
        case VirtualPartnerSpeed = 3
        case HrHighAlert = 4
        case HrLowAlert = 5
        case SpeedHighAlert = 6
        case SpeedLowAlert = 7
        case CadHighAlert = 8
        case CadLowAlert = 9
        case PowerHighAlert = 10
        case PowerLowAlert = 11
        case TimeDurationAlert = 12
        case DistanceDurationAlert = 13
        case CalorieDurationAlert = 14
        case FitnessEquipmentState = 15
        case SportPoint = 16
        case GearChangeData = 17
        case RiderPosition = 18
        case CommTimeout = 19
        case Subfields = 20
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case Event = 0
        case EventType = 1
        case Data16 = 2
        case Data = 3
        case EventGroup = 4
        case Score = 7
        case OpponentScore = 8
        case FrontGearNum = 9
        case FrontGear = 10
        case RearGearNum = 11
        case RearGear = 12
        case DeviceIndex = 13
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Event))
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
    
    public func getEvent() -> Event? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Event(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEvent(_ event: Event) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: event.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEventType() -> EventType? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return EventType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEventType(_ eventType: EventType) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: eventType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getData16() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setData16(_ data16: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: data16, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getData() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    
    public func setData(_ data: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: data, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimerTrigger() -> TimerTrigger? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.TimerTrigger.rawValue) as? UInt8 {
            return TimerTrigger(rawValue: val)
        } else {
            return nil
        }
    }
    
    
    public func setTimerTrigger(_ timerTrigger: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: timerTrigger, subfieldIndex: DataSubfield.TimerTrigger.rawValue)
    }
    
    public func getCoursePointIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.CoursePointIndex.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCoursePointIndex(_ coursePointIndex: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: coursePointIndex, subfieldIndex: DataSubfield.CoursePointIndex.rawValue)
    }
    
    public func getBatteryLevel() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.BatteryLevel.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBatteryLevel(_ batteryLevel: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: batteryLevel, subfieldIndex: DataSubfield.BatteryLevel.rawValue)
    }
    
    public func getVirtualPartnerSpeed() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.VirtualPartnerSpeed.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setVirtualPartnerSpeed(_ virtualPartnerSpeed: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: virtualPartnerSpeed, subfieldIndex: DataSubfield.VirtualPartnerSpeed.rawValue)
    }
    
    public func getHrHighAlert() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.HrHighAlert.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHrHighAlert(_ hrHighAlert: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: hrHighAlert, subfieldIndex: DataSubfield.HrHighAlert.rawValue)
    }
    
    public func getHrLowAlert() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.HrLowAlert.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHrLowAlert(_ hrLowAlert: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: hrLowAlert, subfieldIndex: DataSubfield.HrLowAlert.rawValue)
    }
    
    public func getSpeedHighAlert() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.SpeedHighAlert.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSpeedHighAlert(_ speedHighAlert: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: speedHighAlert, subfieldIndex: DataSubfield.SpeedHighAlert.rawValue)
    }
    
    public func getSpeedLowAlert() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.SpeedLowAlert.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSpeedLowAlert(_ speedLowAlert: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: speedLowAlert, subfieldIndex: DataSubfield.SpeedLowAlert.rawValue)
    }
    
    public func getCadHighAlert() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.CadHighAlert.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCadHighAlert(_ cadHighAlert: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: cadHighAlert, subfieldIndex: DataSubfield.CadHighAlert.rawValue)
    }
    
    public func getCadLowAlert() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.CadLowAlert.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCadLowAlert(_ cadLowAlert: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: cadLowAlert, subfieldIndex: DataSubfield.CadLowAlert.rawValue)
    }
    
    public func getPowerHighAlert() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.PowerHighAlert.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setPowerHighAlert(_ powerHighAlert: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: powerHighAlert, subfieldIndex: DataSubfield.PowerHighAlert.rawValue)
    }
    
    public func getPowerLowAlert() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.PowerLowAlert.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setPowerLowAlert(_ powerLowAlert: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: powerLowAlert, subfieldIndex: DataSubfield.PowerLowAlert.rawValue)
    }
    
    public func getTimeDurationAlert() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.TimeDurationAlert.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setTimeDurationAlert(_ timeDurationAlert: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: timeDurationAlert, subfieldIndex: DataSubfield.TimeDurationAlert.rawValue)
    }
    
    public func getDistanceDurationAlert() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.DistanceDurationAlert.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDistanceDurationAlert(_ distanceDurationAlert: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: distanceDurationAlert, subfieldIndex: DataSubfield.DistanceDurationAlert.rawValue)
    }
    
    public func getCalorieDurationAlert() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.CalorieDurationAlert.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCalorieDurationAlert(_ calorieDurationAlert: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: calorieDurationAlert, subfieldIndex: DataSubfield.CalorieDurationAlert.rawValue)
    }
    
    public func getFitnessEquipmentState() -> FitnessEquipmentState? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.FitnessEquipmentState.rawValue) as? UInt8 {
            return FitnessEquipmentState(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setFitnessEquipmentState(_ fitnessEquipmentState: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: fitnessEquipmentState, subfieldIndex: DataSubfield.FitnessEquipmentState.rawValue)
    }
    
    public func getSportPoint() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.SportPoint.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setSportPoint(_ sportPoint: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: sportPoint, subfieldIndex: DataSubfield.SportPoint.rawValue)
    }
    
    public func getGearChangeData() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.GearChangeData.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setGearChangeData(_ gearChangeData: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: gearChangeData, subfieldIndex: DataSubfield.GearChangeData.rawValue)
    }
    
    public func getRiderPositionType() -> RiderPositionType? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.RiderPosition.rawValue) as? UInt8 {
            return RiderPositionType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setRiderPositionType(_ riderPositionType: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: riderPositionType, subfieldIndex: DataSubfield.RiderPosition.rawValue)
    }
    
    public func getCommTimeout() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: DataSubfield.CommTimeout.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setCommTimeout(_ commTimeout: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: commTimeout, subfieldIndex: DataSubfield.CommTimeout.rawValue)
    }
    
    public func getEventGroup() -> UInt8? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setEventGroup(_ eventGroup: UInt8) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: eventGroup, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getScore() -> UInt16? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setScore(_ score: UInt16) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: score, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOpponentScore() -> UInt16? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setOpponentScore(_ opponentScore: UInt16) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: opponentScore, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFrontGearNum() -> UInt8? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFrontGearNum(_ frontGearNum: UInt8) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: frontGearNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFrontGear() -> UInt8? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFrontGear(_ frontGear: UInt8) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: frontGear, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRearGearNum() -> UInt8? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setRearGearNum(_ rearGearNum: UInt8) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: rearGearNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getRearGear() -> UInt8? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setRearGear(_ rearGear: UInt8) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: rearGear, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDeviceIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeviceIndex(_ deviceIndex: UInt8) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: deviceIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
