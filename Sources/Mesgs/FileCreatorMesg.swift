public class FileCreatorMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case SoftwareVersion = 0
        case HardwareVersion = 1
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.FileCreator))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getSoftwareVersion() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setSoftwareVersion(_ softwareVersion: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: softwareVersion, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHardwareVersion() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHardwareVersion(_ hardwareVersion: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: hardwareVersion, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
