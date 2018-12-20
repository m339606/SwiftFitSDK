public class FileIdMesg : Mesg {
    
    public enum ProductSubfield: UInt16 {
        case GarminProduct = 0
        case Subfields = 1
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case `Type` = 0
        case Manufacturer = 1
        case Product = 2
        case SerialNumber = 3
        case TimeCreated = 4
        case Number = 5
        case ProductName = 8
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.FileId))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
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
    
    public func getNumber() -> UInt16? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNumber(_ number: UInt16) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: number, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getProductName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getProductNameAsString() -> String? {
        if let val = getProductName() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setProductName(_ productName: String) {
        if var data = productName.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setProductName(_ productName: [UInt8]) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: productName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}

