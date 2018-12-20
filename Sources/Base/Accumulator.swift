
public class Accumulator {
    
    var accumulatedFields: Array<AccumulatedField>
    
    public init() {
        accumulatedFields = Array<AccumulatedField>()
    }
    
    public func set(mesgNum: Int32, destFieldNum: Int32, value: Int64) {
        var accumField: AccumulatedField? = nil
        var index: Int = 0
        
        for i in 0 ..< accumulatedFields.count {
            accumField = accumulatedFields[i]
            
            if accumField!.mesgNum == mesgNum && accumField!.destFieldNum == destFieldNum {
                index = i
                break
            }
        }
        
        if index == accumulatedFields.count {
            accumField = AccumulatedField(mesgNum: mesgNum, destFieldNum: destFieldNum)
            accumulatedFields.append(accumField!)
        }
        
        _ = accumField?.set(value: value)
    }
    
    public func accumulate(mesgNum: Int32, destFieldNum: Int32, value: Int64, bits: Int) -> Int64 {
        var accumField: AccumulatedField? = nil
        
        var index: Int = 0
        
        for i in 0 ..< accumulatedFields.count {
            accumField = accumulatedFields[i]
            
            if accumField!.mesgNum == mesgNum && accumField!.destFieldNum == destFieldNum {
                index = i
                break
            }
        }
        
        if index == accumulatedFields.count {
            accumField = AccumulatedField(mesgNum: mesgNum, destFieldNum: destFieldNum)
            accumulatedFields.append(accumField!)
        }
        
        return accumField!.accumulate(value: value, bits: bits)
    }
    
}
