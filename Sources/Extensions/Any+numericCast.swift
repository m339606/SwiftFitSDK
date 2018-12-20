
func numericCast<T>(_ x: Any, _ type: T.Type) -> T where T : BinaryInteger {
    return numericCast(x)
}

func numericCast<T>(_ x: Any) -> T where T : BinaryInteger {
    if let x = x as? Int8 {
        return numericCast(x)
    }
    if let x = x as? UInt8 {
        return numericCast(x)
    }
    if let x = x as? Int16 {
        return numericCast(x)
    }
    if let x = x as? UInt16 {
        return numericCast(x)
    }
    if let x = x as? Int32 {
        return numericCast(x)
    }
    if let x = x as? UInt32 {
        return numericCast(x)
    }
    if let x = x as? Int64 {
        return numericCast(x)
    }
    if let x = x as? UInt64 {
        return numericCast(x)
    }
    if let x = x as? Int {
        return numericCast(x)
    }
    if let x = x as? Float32 {
        return numericCast(Int64(x))
    }
    if let x = x as? Float64 {
        return numericCast(Int64(x))
    }
    fatalError("x can't cast to BinaryInteger")
}

func doubleCast(_ x: Any) -> Float64 {
    if let x = x as? Int8 {
        return Float64(x)
    }
    if let x = x as? UInt8 {
        return Float64(x)
    }
    if let x = x as? Int16 {
        return Float64(x)
    }
    if let x = x as? UInt16 {
        return Float64(x)
    }
    if let x = x as? Int32 {
        return Float64(x)
    }
    if let x = x as? UInt32 {
        return Float64(x)
    }
    if let x = x as? Int64 {
        return Float64(x)
    }
    if let x = x as? UInt64 {
        return Float64(x)
    }
    if let x = x as? Int {
        return Float64(x)
    }
    if let x = x as? Float32 {
        return Float64(x)
    }
    if let x = x as? Float64 {
        return x
    }
    fatalError("x can't cast to Double")
}

func floatCast(_ x: Any) -> Float32 {
    if let x = x as? Int8 {
        return Float32(x)
    }
    if let x = x as? UInt8 {
        return Float32(x)
    }
    if let x = x as? Int16 {
        return Float32(x)
    }
    if let x = x as? UInt16 {
        return Float32(x)
    }
    if let x = x as? Int32 {
        return Float32(x)
    }
    if let x = x as? UInt32 {
        return Float32(x)
    }
    if let x = x as? Int64 {
        return Float32(x)
    }
    if let x = x as? UInt64 {
        return Float32(x)
    }
    if let x = x as? Int {
        return Float32(x)
    }
    if let x = x as? Float32 {
        return x
    }
    if let x = x as? Float64 {
        return Float32(x)
    }
    fatalError("x can't cast to Float")
}
