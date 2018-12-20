
internal class FieldComponent {
    
    internal var fieldNum: UInt8
    internal var accumulate: Bool
    internal var bits: Int
    internal var scale: Float64
    internal var offset: Float64
    
    internal var accumulatedValue: Int64 = 0
    internal var lastValue: Int64 = 0
    
    internal init(fieldNum: UInt8, accumulate: Bool, bits: Int, scale: Float64, offset: Float64) {
        self.fieldNum = fieldNum
        self.accumulate = accumulate
        self.bits = bits
        self.scale = scale
        self.offset = offset
    }
    
    internal init(component: FieldComponent) {
        self.fieldNum = component.fieldNum
        self.accumulate = component.accumulate
        self.bits = component.bits
        self.scale = component.scale
        self.offset = component.offset
        self.accumulatedValue = component.accumulatedValue
        self.lastValue = component.lastValue
    }
    
    public func accumulate(value: Int64) -> Int64 {
        let mask: Int64 = (1 << bits) - 1
        
        accumulatedValue += (value - lastValue) & mask
        lastValue = value
        
        return accumulatedValue
    }
    
}
