
class BinaryReader {
    
    private var data: PositionableData
    
    /// Default endianness is little-endian
    public var isBigEndian: Bool
    
    public init(_ data: PositionableData, isBigEndian: Bool = false) {
        self.data = data
        self.isBigEndian = isBigEndian
    }
    
    public func readByte() -> UInt8 {
        return readBytes(count: 1)[0]
    }
    
    public func readSByte() -> Int8 {
        return Int8(bitPattern: readBytes(count: 1)[0])
    }
    
    public func readBytes(count: Int) -> Array<UInt8> {
        return data.read(count: count)
    }
    
    private func read<T>() -> T {
        let buffer = readBytes(count: MemoryLayout<T>.size)
        if isBigEndian {
            return buffer.reversed().withUnsafeBytes({ $0.load(as: T.self) })
        } else {
            return buffer.withUnsafeBytes({ $0.load(as: T.self) })
        }
    }
    
    public func readInt16() -> Int16 {
        return self.read()
    }
    
    public func readUInt16() -> UInt16 {
        return self.read()
    }
    
    public func readInt32() -> Int32 {
        return self.read()
    }
    
    public func readUInt32() -> UInt32 {
        return self.read()
    }
    
    public func readInt64() -> Int64 {
        return self.read()
    }
    
    public func readUInt64() -> UInt64 {
        return self.read()
    }
    
    public func readFloat32() -> Float32 {
        return self.read()
    }
    
    public func readFloat64() -> Float64 {
        return self.read()
    }
}
