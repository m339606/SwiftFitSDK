public class BloodPressureMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case SystolicPressure = 0
        case DiastolicPressure = 1
        case MeanArterialPressure = 2
        case Map3SampleMean = 3
        case MapMorningValues = 4
        case MapEveningValues = 5
        case HeartRate = 6
        case HeartRateType = 7
        case Status = 8
        case UserProfileIndex = 9
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.BloodPressure))
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
    
    public func getSystolicPressure() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setSystolicPressure(_ systolicPressure: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: systolicPressure, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDiastolicPressure() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setDiastolicPressure(_ diastolicPressure: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: diastolicPressure, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMeanArterialPressure() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMeanArterialPressure(_ meanArterialPressure: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: meanArterialPressure, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMap3SampleMean() -> UInt16? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMap3SampleMean(_ map3SampleMean: UInt16) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: map3SampleMean, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMapMorningValues() -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMapMorningValues(_ mapMorningValues: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: mapMorningValues, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMapEveningValues() -> UInt16? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMapEveningValues(_ mapEveningValues: UInt16) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: mapEveningValues, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeartRate() -> UInt8? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHeartRate(_ heartRate: UInt8) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: heartRate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHeartRateType() -> HrType? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return HrType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setHeartRateType(_ heartRateType: HrType) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: heartRateType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStatus() -> BpStatus? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return BpStatus(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setStatus(_ status: BpStatus) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: status.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getUserProfileIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setUserProfileIndex(_ userProfileIndex: UInt16) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: userProfileIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
