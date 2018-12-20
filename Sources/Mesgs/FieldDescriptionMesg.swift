public class FieldDescriptionMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case DeveloperDataIndex = 0
        case FieldDefinitionNumber = 1
        case FitBaseTypeId = 2
        case FieldName = 3
        case Array = 4
        case Components = 5
        case Scale = 6
        case Offset = 7
        case Units = 8
        case Bits = 9
        case Accumulate = 10
        case FitBaseUnitId = 13
        case NativeMesgNum = 14
        case NativeFieldNum = 15
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.FieldDescription))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getDeveloperDataIndex() -> UInt8? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setDeveloperDataIndex(_ developerDataIndex: UInt8) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: developerDataIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFieldDefinitionNumber() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFieldDefinitionNumber(_ fieldDefinitionNumber: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: fieldDefinitionNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFitBaseTypeId() -> UInt8? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setFitBaseTypeId(_ fitBaseTypeId: UInt8) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: fitBaseTypeId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumFieldName() -> Int {
        return getNumFieldValues(fieldNum: 3, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFieldName(_ index: Int) -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 3, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getFieldNameAsString(_ index: Int) -> String? {
        if let val = getFieldName(index) {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setFieldName(_ index: Int, _ fieldName: String) {
        if var data = fieldName.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 3, fieldArrayIndex: index, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setFieldName(_ index: Int, _ fieldName: [UInt8]) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: index, value: fieldName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getArray() -> UInt8? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setArray(_ array: UInt8) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: array, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getComponents() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getComponentsAsString() -> String? {
        if let val = getComponents() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setComponents(_ components: String) {
        if var data = components.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setComponents(_ components: [UInt8]) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: components, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getScale() -> UInt8? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setScale(_ scale: UInt8) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: scale, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getOffset() -> Int8? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Int8
        } else {
            return nil
        }
    }
    
    public func setOffset(_ offset: Int8) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: offset, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumUnits() -> Int {
        return getNumFieldValues(fieldNum: 8, subfieldIndex: Fit.subfieldIndexMainField)
    }

    public func getUnits(_ index: Int) -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 8, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getUnitsAsString(_ index: Int) -> String? {
        if let val = getUnits(index) {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setUnits(_ index: Int, _ units: String) {
        if var data = units.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 8, fieldArrayIndex: index, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setUnits(_ index: Int, _ units: [UInt8]) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: index, value: units, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBits() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getBitsAsString() -> String? {
        if let val = getBits() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setBits(_ bits: String) {
        if var data = bits.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setBits(_ bits: [UInt8]) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: bits, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAccumulate() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getAccumulateAsString() -> String? {
        if let val = getAccumulate() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setAccumulate(_ accumulate: String) {
        if var data = accumulate.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setAccumulate(_ accumulate: [UInt8]) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: accumulate, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getFitBaseUnitId() -> UInt16? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setFitBaseUnitId(_ fitBaseUnitId: UInt16) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: fitBaseUnitId, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNativeMesgNum() -> UInt16? {
        if let val = getFieldValue(fieldNum: 14, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setNativeMesgNum(_ nativeMesgNum: UInt16) {
        setFieldValue(fieldNum: 14, fieldArrayIndex: 0, value: nativeMesgNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNativeFieldNum() -> UInt8? {
        if let val = getFieldValue(fieldNum: 15, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setNativeFieldNum(_ nativeFieldNum: UInt8) {
        setFieldValue(fieldNum: 15, fieldArrayIndex: 0, value: nativeFieldNum, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
