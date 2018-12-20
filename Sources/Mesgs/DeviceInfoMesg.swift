public class DeviceInfoMesg : Mesg {
    
    public enum DeviceTypeSubfield: UInt16 {
        case AntplusDeviceType = 0
        case AntDeviceType = 1
        case Subfields = 2
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum ProductSubfield: UInt16 {
        case GarminProduct = 0
        case Subfields = 1
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case DeviceIndex = 0
        case DeviceType = 1
        case Manufacturer = 2
        case SerialNumber = 3
        case Product = 4
        case SoftwareVersion = 5
        case HardwareVersion = 6
        case CumOperatingTime = 7
        case BatteryVoltage = 10
        case BatteryStatus = 11
        case SensorPosition = 18
        case Descriptor = 19
        case AntTransmissionType = 20
        case AntDeviceNumber = 21
        case AntNetwork = 22
        case SourceType = 25
        case ProductName = 27
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.DeviceInfo))
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
    
    public func getDeviceIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeviceIndex(_ deviceIndex: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: deviceIndex, subfieldIndex: Fit.subfieldIndexMainField)
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
    
    public func getAntplusDeviceType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: DeviceTypeSubfield.AntplusDeviceType.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAntplusDeviceType(_ antplusDeviceType: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: antplusDeviceType, subfieldIndex: DeviceTypeSubfield.AntplusDeviceType.rawValue)
    }
    
    public func getAntDeviceType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: DeviceTypeSubfield.AntDeviceType.rawValue) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAntDeviceType(_ antplusDeviceType: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: antplusDeviceType, subfieldIndex: DeviceTypeSubfield.AntDeviceType.rawValue)
    }
    
    public func getManufacturer() -> UInt16? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setManufacturer(_ manufacturer: UInt16) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: manufacturer, subfieldIndex: Fit.subfieldIndexMainField)
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
    
    public func getProduct() -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setProduct(_ product: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: product, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getGarminProduct() -> UInt16? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: ProductSubfield.GarminProduct.rawValue) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setGarminProduct(_ garminProduct: UInt16) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: garminProduct, subfieldIndex: ProductSubfield.GarminProduct.rawValue)
    }
    
    public func getSoftwareVersion() -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setSoftwareVersion(_ softwareVersion: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: softwareVersion, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getHardwareVersion() -> UInt8? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setHardwareVersion(_ hardwareVersion: UInt8) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: hardwareVersion, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCumOperatingTime() -> UInt32? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCumOperatingTime(_ cumOperatingTime: UInt32) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: cumOperatingTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBatteryVoltage() -> Float32? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBatteryVoltage(_ batteryVoltage: Float32) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: batteryVoltage, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBatteryStatus() -> UInt8? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setBatteryStatus(_ batteryStatus: UInt8) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: batteryStatus, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSensorPosition() -> BodyLocation? {
        if let val = getFieldValue(fieldNum: 18, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return BodyLocation(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSensorPosition(_ sensorPosition: BodyLocation) {
        setFieldValue(fieldNum: 18, fieldArrayIndex: 0, value: sensorPosition.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDescriptor() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 19, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getDescriptorAsString() -> String? {
        if let val = getDescriptor() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setDescriptor(_ descriptor: String) {
        if var data = descriptor.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setDescriptor(_ descriptor: [UInt8]) {
        setFieldValue(fieldNum: 19, fieldArrayIndex: 0, value: descriptor, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAntTransmissionType() -> UInt8? {
        if let val = getFieldValue(fieldNum: 20, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setAntTransmissionType(_ antTransmissionType: UInt8) {
        setFieldValue(fieldNum: 20, fieldArrayIndex: 0, value: antTransmissionType, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAntDeviceNumber() -> UInt16? {
        if let val = getFieldValue(fieldNum: 21, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setAntDeviceNumber(_ antDeviceNumber: UInt16) {
        setFieldValue(fieldNum: 21, fieldArrayIndex: 0, value: antDeviceNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAntNetwork() -> AntNetwork? {
        if let val = getFieldValue(fieldNum: 22, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return AntNetwork(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setAntNetwork(_ antNetwork: AntNetwork) {
        setFieldValue(fieldNum: 22, fieldArrayIndex: 0, value: antNetwork.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSourceType() -> SourceType? {
        if let val = getFieldValue(fieldNum: 25, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return SourceType(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setSourceType(_ sourceType: SourceType) {
        setFieldValue(fieldNum: 25, fieldArrayIndex: 0, value: sourceType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getProductName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 27, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
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
            setFieldValue(fieldNum: 27, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setProductName(_ productName: [UInt8]) {
        setFieldValue(fieldNum: 27, fieldArrayIndex: 0, value: productName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
