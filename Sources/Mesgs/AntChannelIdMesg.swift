public class AntChannelIdMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case ChannelNumber = 0
        case DeviceType = 1
        case DeviceNumber = 2
        case TransmissionType = 3
        case DeviceIndex = 4
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.AntChannelId))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getChannelNumber() -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setChannelNumber(_ channelNumber: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: channelNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDeviceType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeviceType(_ deviceType: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: deviceType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDeviceNumber() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setDeviceNumber(_ deviceNumber: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: deviceNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTransmissionType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setTransmissionType(_ transmissionType: UInt8) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: transmissionType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDeviceIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeviceIndex(_ deviceIndex: UInt8) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: deviceIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

