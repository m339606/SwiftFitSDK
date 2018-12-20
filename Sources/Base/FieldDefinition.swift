
public class FieldDefinition {
    
    private(set) public var num: UInt8
    private(set) public var size: UInt8
    private(set) public var type: UInt8
    
    public init(field: Field) {
        num = field.num
        size = field.getSize()
        type = field.type
    }
    
    public init(newNum: UInt8, newSize: UInt8, newType: UInt8) {
        num = newNum
        size = newSize
        type = newType
    }
    
    public init(fieldDef: FieldDefinition) {
        num = fieldDef.num
        size = fieldDef.size
        type = fieldDef.type
    }
    
}
