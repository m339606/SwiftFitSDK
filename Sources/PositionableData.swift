
public class PositionableData {
    
    private(set) public var data: [UInt8]
    
    public var position: Int
    
    public var count: Int {
        get {
            return data.count
        }
    }
    
    public var canRead: Bool {
        get {
            return position >= 0 && position < data.count
        }
    }
    
    public init() {
        self.data = []
        self.position = 0
    }
    
    public init(data: [UInt8], position: Int = 0) {
        self.data = data
        self.position = position
    }
    
    public func read() -> UInt8 {
        if canRead {
            let byte = data[position]
            position += 1
            return byte
        }
        fatalError("position out of range")
    }
    
    public func read(count: Int) -> [UInt8] {
        var buffer: [UInt8] = []
        while buffer.count < count {
            buffer.append(read())
        }
        return buffer
    }
    
    public func write(_ byte: UInt8) {
        data.append(byte)
    }
    
    public func write(_ bytes: [UInt8]) {
        data.append(contentsOf: bytes)
    }
    
}
