
public class AccumulatedField {
    public var mesgNum: Int32
    public var destFieldNum: Int32
    private var lastValue: Int64
    private var accumulatedValue: Int64
    
    public init(mesgNum: Int32, destFieldNum: Int32) {
        self.mesgNum = mesgNum
        self.destFieldNum = destFieldNum
        self.lastValue = 0
        self.accumulatedValue = 0
    }
    
    public func accumulate(value: Int64, bits: Int) -> Int64 {
        let mask: Int64 = (1 << bits) - 1
        
        accumulatedValue += (value - lastValue) & mask
        lastValue = value
        
        return accumulatedValue
    }
    
    public func set(value: Int64) -> Int64 {
        accumulatedValue = value
        self.lastValue = value
        return accumulatedValue
    }
}
