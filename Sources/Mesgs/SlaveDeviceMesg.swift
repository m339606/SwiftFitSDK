public class SlaveDeviceMesg : Mesg {
    
    public enum ProductSubfield: UInt16 {
        case GarminProduct = 0
        case Subfields = 1
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case Manufacturer = 0
        case Product = 1
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.SlaveDevice))
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
    
}
