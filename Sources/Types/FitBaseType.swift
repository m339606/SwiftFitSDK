
public struct FitBaseType {
    
    public static let Enum: UInt8 = 0
    public static let Sint8: UInt8 = 1
    public static let Uint8: UInt8 = 2
    public static let Sint16: UInt8 = 131
    public static let Uint16: UInt8 = 132
    public static let Sint32: UInt8 = 133
    public static let Uint32: UInt8 = 134
    public static let String: UInt8 = 7
    public static let Float32: UInt8 = 136
    public static let Float64: UInt8 = 137
    public static let Uint8z: UInt8 = 10
    public static let Uint16z: UInt8 = 139
    public static let Uint32z: UInt8 = 140
    public static let Byte: UInt8 = 13
    public static let Sint64: UInt8 = 142
    public static let Uint64: UInt8 = 143
    public static let Uint64z: UInt8 = 144
    public static let Invalid: UInt8 = 0xFF
    
    public static func isNumericInvalid(value: Int64, type: UInt8) -> Bool {
        var isInvalid = false
        
        switch type {
        case Enum, Byte, Uint8, Uint8z:
            let val = numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, UInt8.self)
            if UInt8(value) == val {
                isInvalid = true
            }
            
        case Sint8:
            let val = numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, Int8.self)
            if Int8(value) == val {
                isInvalid = true
            }
            
        case Sint16:
            let val = numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, Int16.self)
            if Int16(value) == val {
                isInvalid = true
            }
            
        case Uint16, Uint16z:
            let val = numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, UInt16.self)
            if UInt16(value) == val {
                isInvalid = true
            }
            
        case Sint32:
            let val = numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, Int32.self)
            if Int32(value) == val {
                isInvalid = true
            }
            
        case Uint32, Uint32z:
            let val = numericCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue, UInt32.self)
            if UInt32(value) == val {
                isInvalid = true
            }
            
        case Float32:
            let val = floatCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue)
            if Float(value) == val {
                isInvalid = true
            }
            
        case Float64:
            let val = doubleCast(Fit.baseType[Int(type & Fit.baseTypeNumMask)].invalidValue)
            if Double(value) == val {
                isInvalid = true
            }
            
        default:
            isInvalid = true

        }
        
        return isInvalid
    }
    
}
