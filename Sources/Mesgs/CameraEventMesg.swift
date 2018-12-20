public class CameraEventMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case TimestampMs = 0
        case CameraEventType = 1
        case CameraFileUuid = 2
        case CameraOrientation = 3
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.CameraEvent))
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
    
    public func getCameraEventType() -> CameraEventType? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return CameraEventType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setCameraEventType(_ cameraEventType: CameraEventType) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: cameraEventType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCameraFileUuid() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getCameraFileUuidAsString() -> String? {
        if let val = getCameraFileUuid() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setCameraFileUuid(_ cameraFileUuid: String) {
        if var data = cameraFileUuid.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setCameraFileUuid(_ cameraFileUuid: [UInt8]) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: cameraFileUuid, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCameraOrientation() -> CameraOrientationType? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return CameraOrientationType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setCameraOrientation(_ cameraOrientation: CameraOrientationType) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: cameraOrientation.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

