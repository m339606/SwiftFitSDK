public class TrainingFileMesg : Mesg {
    
    public enum ProductSubfield: UInt16 {
        case GarminProduct = 0
        case Subfields = 1
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case `Type` = 0
        case Manufacturer = 1
        case Product = 2
        case SerialNumber = 3
        case TimeCreated = 4
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.TrainingFile))
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
    
    public func getType() -> FitFileType? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return FitFileType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setType(_ type: FitFileType) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: type.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getManufacturer() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setManufacturer(_ manufacturer: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: manufacturer, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getProduct() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setProduct(_ product: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: product, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGarminProduct() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: ProductSubfield.GarminProduct.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setGarminProduct(_ garminProduct: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: garminProduct, subfieldIndex: ProductSubfield.GarminProduct.rawValue)
    }
    
    public func getSerialNumber() -> UInt32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setSerialNumber(_ serialNumber: UInt32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: serialNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTimeCreated() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setTimeCreated(_ timeCreated: FitDateTime) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: timeCreated.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
