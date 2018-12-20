
class BinaryWriter {
    
    private(set) public var data: PositionableData
    
    /// Default endianness is little-endian
    public var isBigEndian: Bool
    
    init(_ data: PositionableData = PositionableData(), isBigEndian: Bool = false) {
        self.data = data
        self.isBigEndian = isBigEndian
    }
    
    public func write(_ byte: UInt8) {
        data.write(byte)
    }
    
    public func write(_ bytes: [UInt8]) {
        data.write(bytes)
    }
    
    private func writeType<T>(_ value: T) {
        var b = [UInt8](repeating: 0, count: MemoryLayout<T>.size)
        b.withUnsafeMutableBufferPointer {
            UnsafeMutableRawPointer($0.baseAddress!).storeBytes(of: value, as: T.self)
        }
        if isBigEndian {
            data.write(b.reversed())
        } else {
            data.write(b)
        }
    }
    
    public func write(_ value: Int8) {
        self.writeType(value)
    }
    
    public func write(_ value: Int16) {
        self.writeType(value)
    }
    
    public func write(_ value: UInt16) {
        self.writeType(value)
    }
    
    public func write(_ value: Int32) {
        self.writeType(value)
    }
    
    public func write(_ value: UInt32) {
        self.writeType(value)
    }
    
    public func write(_ value: Int64) {
        self.writeType(value)
    }
    
    public func write(_ value: UInt64) {
        self.writeType(value)
    }
    
    public func write(_ value: Float32) {
        self.writeType(value)
    }
    
    public func write(_ value: Float64) {
        self.writeType(value)
    }
    
}
