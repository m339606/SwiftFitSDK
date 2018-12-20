
public protocol FieldBase {
    
    var values: Array<Any> { get set }
    
    var name: String? { get }
    var type: UInt8 { get }
    var scale: Float64 { get }
    var offset: Float64 { get }
    var units: String? { get }
    
    func getSubfield(subfieldName: String) -> Subfield?
    
    func getSubfield(subfieldIndex: UInt16) -> Subfield?
    
    init()
}

public extension FieldBase {
    
    internal init(base: FieldBase?) {
        self.init()
        
        if let base = base {
            for obj in base.values {
                values.append(obj)
            }
        }
    }
    
    public func getName() -> String? {
        return self.getName(subfield: nil)
    }
    
    public func getName(subfieldIndex: UInt16) -> String? {
        return getName(subfield: getSubfield(subfieldIndex: subfieldIndex))
    }
    
    public func getName(subFieldName: String) -> String? {
        return getName(subfield: getSubfield(subfieldName: subFieldName))
    }
    
    private func getName(subfield: Subfield?) -> String? {
        if let subfield = subfield {
            return subfield.name
        } else {
            return self.name
        }
    }
    
    public func getType() -> UInt8 {
        return getType(subfield: nil)
    }
    
    public func getType(subfieldIndex: UInt16) -> UInt8 {
        return getType(subfield: getSubfield(subfieldIndex: subfieldIndex))
    }
    
    public func getType(subFieldName: String) -> UInt8 {
        return getType(subfield: getSubfield(subfieldName: subFieldName))
    }
    
    private func getType(subfield: Subfield?) -> UInt8 {
        if let subfield = subfield {
            return subfield.type
        } else {
            return self.type
        }
    }
    
    public func getUnits() -> String? {
        return getUnits(subfield: nil)
    }
    
    public func getUnits(subfieldIndex: UInt16) -> String? {
        return getUnits(subfield: getSubfield(subfieldIndex: subfieldIndex))
    }
    
    public func getUnits(subFieldName: String) -> String? {
        return getUnits(subfield: getSubfield(subfieldName: subFieldName))
    }
    
    private func getUnits(subfield: Subfield?) -> String? {
        if let subfield = subfield {
            return subfield.units
        } else {
            return self.units
        }
    }
    
    public func getSize() -> UInt8 {
        
        var size: UInt8 = 0
        
        switch type & Fit.baseTypeNumMask {
        case Fit.Enum, Fit.SInt8, Fit.UInt8, Fit.SInt16, Fit.UInt16, Fit.SInt32, Fit.UInt32, Fit.Float32, Fit.Float64, Fit.UInt8z, Fit.UInt16z, Fit.UInt32z, Fit.SInt64, Fit.UInt64, Fit.UInt64z, Fit.Byte:
            size = UInt8(getNumValues()) * Fit.baseType[Int(type & Fit.baseTypeNumMask)].size
            
        case Fit.String:
            for element in values.map({ $0 as! Array<UInt8> }) {
                size += UInt8(element.count)
            }
            
        default:
            break
        }
        
        return size
    }
    
    internal func isSigned() -> Bool {
        return isSigned(subfield: nil)
    }
    
    internal func isSigned(subfieldIndex: UInt16) -> Bool {
        return isSigned(subfield: getSubfield(subfieldIndex: subfieldIndex))
    }
    
    internal func isSigned(subFieldName: String) -> Bool {
        return isSigned(subfield: getSubfield(subfieldName: subFieldName))
    }
    
    internal func isSigned(subfield: Subfield?) -> Bool {
        var type = self.getType(subfield: subfield)
        type &= Fit.baseTypeNumMask
        return Fit.baseType[Int(type)].isSigned
    }
    
    public mutating func addValue(value: Any) {
        values.append(value)
    }
    
    public func getNumValues() -> Int {
        return values.count
    }
    
    public func getBitsValue(offset: Int, bits: Int, componentType: UInt8) -> Int64? {
        
        var bits = bits
        var offset = offset
        
        var value: Int64 = 0
        var data: Int64 = 0
        var mask: Int64
        var index: Int = 0
        var bitsInValue: Int = 0
        var bitsInData: Int

        if (Fit.baseType[Int(componentType & Fit.baseTypeNumMask)].size * 8) < bits {
            bits = Int(Fit.baseType[Int(componentType & Fit.baseTypeNumMask)].size * 8)
        }
        
        if values.count == 0 {
            return nil
        }
        
        while bitsInValue < bits {
            if index == values.count {
                return nil
            }
            
            data = numericCast(self.values[index], Int64.self); index += 1
            
            data >>= offset
            bitsInData = Int(Fit.baseType[Int(type & Fit.baseTypeNumMask)].size * 8) - offset
            offset -= Int(Fit.baseType[Int(type & Fit.baseTypeNumMask)].size * 8)
            
            if bitsInData > 0 {
                offset = 0
                
                if bitsInData > (bits - bitsInValue) {
                    bitsInData = bits - bitsInValue
                }
                mask = (1 << bitsInData) - 1
                value |= (data & mask) << bitsInValue
                bitsInValue += bitsInData
            }
        }
        
        if Fit.baseType[Int(componentType & Fit.baseTypeNumMask)].isSigned == true &&  Fit.baseType[Int(componentType & Fit.baseTypeNumMask)].isInteger == true {
            
            let signBit: Int64 = 1 << (Int64(bits) - 1)
            
            if (value & signBit) != 0 {
                value = -signBit + (value & (signBit - 1))
            }
        }
        
        return value
    }
    
    public func getValue() -> Any? {
        return getValue(index: 0, subfield: nil)
    }
    
    public func getValue(index: Int) -> Any? {
        return getValue(index: index, subfield: nil)
    }
    
    public func getValue(index: Int, subfieldIndex: UInt16) -> Any? {
        return getValue(index: index, subfield: getSubfield(subfieldIndex: subfieldIndex))
    }
    
    public func getValue(index: Int, subfieldName: String) -> Any? {
        return getValue(index: index, subfield: getSubfield(subfieldName: subfieldName))
    }
    
    public func getValue(index: Int, subfield: Subfield?) -> Any? {
        var scale: Float64
        var offset: Float64
        
        guard index < values.count && index >= 0 else {
            return nil
        }
        
        if let subfield = subfield {
            scale = Float64(subfield.scale)
            offset = Float64(subfield.offset)
        } else {
            scale = self.scale
            offset = self.offset
        }
        
        var value: Any?
        var castToFloat: Bool = false
        
        switch type & Fit.baseTypeNumMask {
        case Fit.Enum, Fit.Byte, Fit.UInt8, Fit.UInt8z:
            value = numericCast(values[index], UInt8.self)
            if numericCast(value!, UInt8.self) ==
                numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, UInt8.self) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.SInt8:
            value = numericCast(values[index], Int8.self)
            if numericCast(value!, Int8.self) ==
                numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, Int8.self) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.SInt16:
            value = numericCast(values[index], Int16.self)
            if numericCast(value!, Int16.self) ==
                numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, Int16.self) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.UInt16, Fit.UInt16z:
            value = numericCast(values[index], UInt16.self)
            if numericCast(value!, UInt16.self) ==
                numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, UInt16.self) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.SInt32:
            value = numericCast(values[index], Int32.self)
            if numericCast(value!, Int32.self) ==
                numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, Int32.self) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.UInt32, Fit.UInt32z:
            value = numericCast(values[index], UInt32.self)
            if numericCast(value!, UInt32.self) ==
                numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, UInt32.self) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.SInt64:
            value = numericCast(values[index], Int64.self)
            if numericCast(value!, Int64.self) ==
                numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, Int64.self) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.UInt64, Fit.UInt64z:
            value = numericCast(values[index], UInt64.self)
            if numericCast(value!, UInt64.self) ==
                numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, UInt64.self) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.Float32:
            value = floatCast(values[index])
            if floatCast(value!) ==
                floatCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.Float64:
            value = doubleCast(values[index])
            if doubleCast(value!) ==
                doubleCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue) && scale != 1.0 {
                castToFloat = true
            }
            
        case Fit.String:
            value = values[index]
            
        default:
            value = nil
        }
        
        if castToFloat {
            value = floatCast(value!)
            return value
        }
        
        if isNumeric() {
            if scale != 1.0 || offset != 0.0 {
                value = (floatCast(value!) / floatCast(scale)) - floatCast(offset)
            }
        }
        return value
    }
    
    public mutating func setValue(value: Any) {
        setValue(index: 0, value: value, subfield: nil)
    }
    
    public mutating func setValue(value: Any, subfieldIndex: UInt16) {
        setValue(index: 0, value: value, subfield: getSubfield(subfieldIndex: subfieldIndex))
    }
    
    public mutating func setValue(value: Any, subfieldName: String) {
        setValue(index: 0, value: value, subfield: getSubfield(subfieldName: subfieldName))
    }
    
    public mutating func setValue(index: Int, value: Any) {
        setValue(index: index, value: value, subfield: nil)
    }
    
    public mutating func setValue(index: Int, value: Any, subfieldIndex: UInt16) {
        setValue(index: index, value: value, subfield: getSubfield(subfieldIndex: subfieldIndex))
    }
    
    public mutating func setValue(index: Int, value: Any, subfieldName: String) {
        setValue(index: index, value: value, subfield: getSubfield(subfieldName: subfieldName))
    }
    
    public mutating func setValue(index: Int, value: Any, subfield: Subfield?) {
        var value = value
        
        var scale: Float64
        var offset: Float64
        
        while index >= getNumValues() {
            switch type & Fit.baseTypeNumMask {
            case Fit.Enum, Fit.Byte, Fit.UInt8, Fit.UInt8z:
                values.append(UInt8())
                
            case Fit.SInt8:
                values.append(Int8())
                
            case Fit.SInt16:
                values.append(Int16())
                
            case Fit.UInt16, Fit.UInt16z:
                values.append(UInt16())
                
            case Fit.SInt32:
                values.append(Int32())
                
            case Fit.UInt32, Fit.UInt32z:
                values.append(UInt32())
                
            case Fit.SInt64:
                values.append(Int64())
                
            case Fit.UInt64, Fit.UInt64z:
                values.append(UInt64())
                
            case Fit.Float32:
                values.append(Float32())
                
            case Fit.Float64:
                values.append(Float64())
                
            case Fit.String:
                values.append(Array<UInt8>())
                
            default:
                break
            }
        }
        
        if let subfield = subfield {
            scale = Float64(subfield.scale)
            offset = Float64(self.offset)
        } else {
            scale = self.scale
            offset = self.offset
        }
        
        var invalidValue: Int64 = 0
        var castedValue: Int64 = 0
        
        if isNumeric() {
            invalidValue = Int64(doubleCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue))
            castedValue = Int64(doubleCast(value))
            
            if castedValue < invalidValue || (invalidValue == 0 && castedValue > 0) {
                if scale != 1.0 || offset != 0.0 {
                    value = (floatCast(value) + Float32(offset)) * Float32(scale)
                }
            }
        }
        
        var success: Bool = false
        
        switch type & Fit.baseTypeNumMask {
        case Fit.Enum, Fit.Byte, Fit.UInt8, Fit.UInt8z:
            if UInt8(doubleCast(value)) >= UInt8.min && UInt8(doubleCast(value)) <= UInt8.max {
                value = numericCast(value, UInt8.self)
                success = true
            }
            
        case Fit.SInt8:
            if Int8(doubleCast(value)) >= Int8.min && Int8(doubleCast(value)) <= Int8.max {
                value = numericCast(value, Int8.self)
                success = true
            }
            
        case Fit.SInt16:
            if Int16(doubleCast(value)) >= Int16.min && Int16(doubleCast(value)) <= Int16.max {
                value = numericCast(value, Int16.self)
                success = true
            }
            
        case Fit.UInt16, Fit.UInt16z:
            if UInt16(doubleCast(value)) >= UInt16.min && UInt16(doubleCast(value)) <= UInt16.max {
                value = numericCast(value, UInt16.self)
                success = true
            }
            
        case Fit.SInt32:
            if Int32(doubleCast(value)) >= Int32.min && Int32(doubleCast(value)) <= Int32.max {
                value = numericCast(value, Int32.self)
                success = true
            }
            
        case Fit.UInt32, Fit.UInt32z:
            if UInt32(doubleCast(value)) >= UInt32.min && UInt32(doubleCast(value)) <= UInt32.max {
                value = numericCast(value, UInt32.self)
                success = true
            }
            
        case Fit.SInt64:
            if Int64(doubleCast(value)) >= Int64.min && Int64(doubleCast(value)) <= Int64.max {
                value = numericCast(value, Int64.self)
                success = true
            }
            
        case Fit.UInt64, Fit.UInt64z:
            if UInt64(doubleCast(value)) >= UInt64.min && UInt64(doubleCast(value)) <= UInt64.max {
                value = numericCast(value, UInt64.self)
                success = true
            }
            
        case Fit.Float32:
            if Float32(doubleCast(value)) >= Float32.leastNormalMagnitude && Float32(doubleCast(value)) <= Float32.greatestFiniteMagnitude {
                value = floatCast(value)
                success = true
            }
            
        case Fit.Float64:
            if doubleCast(value) >= Float64.leastNormalMagnitude && doubleCast(value) <= Float64.greatestFiniteMagnitude {
                value = doubleCast(value)
                success = true
            }
            
        case Fit.String:
            success = true
            
        default:
            break
        }
        
        if success == false {
            value = Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue
        }
        values[index] = value
    }
    
    public mutating func setRawValue(index: Int, value: Any) {
        var value = value
        
        while index >= getNumValues() {
            switch type & Fit.baseTypeNumMask {
            case Fit.Enum, Fit.Byte, Fit.UInt8, Fit.UInt8z:
                values.append(UInt8())
                
            case Fit.SInt8:
                values.append(Int8())
                
            case Fit.SInt16:
                values.append(Int16())
                
            case Fit.UInt16, Fit.UInt16z:
                values.append(UInt16())
                
            case Fit.SInt32:
                values.append(Int32())
                
            case Fit.UInt32, Fit.UInt32z:
                values.append(UInt32())
                
            case Fit.SInt64:
                values.append(Int64())
                
            case Fit.UInt64, Fit.UInt64z:
                values.append(UInt64())
                
            case Fit.Float32:
                values.append(Float32())
                
            case Fit.Float64:
                values.append(Float64())
                
            case Fit.String:
                values.append(Array<UInt8>())
                
            default:
                break
            }
        }
        
        switch type & Fit.baseTypeNumMask {
        case Fit.Enum, Fit.Byte, Fit.UInt8, Fit.UInt8z:
            value = numericCast(value, UInt8.self)
            
        case Fit.SInt8:
            value = numericCast(value, Int8.self)
            
        case Fit.SInt16:
            value = numericCast(value, Int16.self)
            
        case Fit.UInt16, Fit.UInt16z:
            value = numericCast(value, UInt16.self)
            
        case Fit.SInt32:
            value = numericCast(value, Int32.self)

        case Fit.UInt32, Fit.UInt32z:
            value = numericCast(value, UInt32.self)
            
        case Fit.SInt64:
            value = numericCast(value, Int64.self)
            
        case Fit.UInt64, Fit.UInt64z:
            value = numericCast(value, UInt64.self)
            
        case Fit.Float32:
            value = floatCast(value)
            
        case Fit.Float64:
            value = doubleCast(value)
            
        default:
            break
        }
        values[index] = value
    }
    
    public func getRawValue(index: Int) -> Any? {
        if index >= values.count || index < 0 {
            return nil
        }
        let value = values[index]
        return value
    }
    
    public func isNumeric() -> Bool {
        var isNumeric: Bool
        switch type & Fit.baseTypeNumMask {
        case Fit.Enum, Fit.String:
            isNumeric = false
        
        case Fit.SInt8, Fit.UInt8, Fit.SInt16, Fit.UInt16, Fit.SInt32, Fit.UInt32, Fit.Float32, Fit.Float64, Fit.UInt8z, Fit.UInt16z, Fit.UInt32z, Fit.Byte, Fit.SInt64, Fit.UInt64, Fit.UInt64z:
            isNumeric = true
            
        default:
            fatalError("Field:IsNumeric - Unexpected Fit Type \(self.type)")
        }
        return isNumeric
    }
    
}

