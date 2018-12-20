public class ScheduleMesg : Mesg {
    
    public enum ProductSubfield: UInt16 {
        case GarminProduct = 0
        case Subfields = 1
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case Manufacturer = 0
        case Product = 1
        case SerialNumber = 2
        case TimeCreated = 3
        case Completed = 4
        case `Type` = 5
        case ScheduledTime = 6
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.Schedule))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getManufacturer() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setManufacturer(_ manufacturer: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: manufacturer, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getProduct() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setProduct(_ product: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: product, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGarminProduct() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: ProductSubfield.GarminProduct.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setGarminProduct(_ garminProduct: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: garminProduct, subfieldIndex: ProductSubfield.GarminProduct.rawValue)
    }
    
    public func getSerialNumber() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setSerialNumber(_ serialNumber: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: serialNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeCreated() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setTimeCreated(_ timeCreated: FitDateTime) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: timeCreated.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCompleted() -> FitBool? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitBool(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setCompleted(_ completed: FitBool) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: completed.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getType() -> Schedule? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Schedule(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setType(_ type: Schedule) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: type.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getScheduledTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setScheduledTime(_ scheduledTime: UInt32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: scheduledTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
