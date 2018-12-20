
public class Field : FieldBase {
    
    public var values: Array<Any>
    
    public var name: String?
    public var num: UInt8
    public var type: UInt8
    public var scale: Float64
    public var offset: Float64
    public var units: String?
    private(set) public var isAccumulated: Bool
    private var profileType: Profile.Types
    public var isExpandedField: Bool
    
    internal var subfields: Array<Subfield> = Array<Subfield>()
    internal var components: Array<FieldComponent> = Array<FieldComponent>()

    public func getSubfield(subfieldName: String) -> Subfield? {
        return subfields.first(where: { $0.name == subfieldName })
    }
    
    public func getSubfield(subfieldIndex: UInt16) -> Subfield? {
        if subfieldIndex >= 0 && subfieldIndex < subfields.count {
            return subfields[Int(subfieldIndex)]
        }
        
        return nil
    }
    
    required public init() {
        self.values = Array<Any>()
        self.name = "unknown"
        self.num = Fit.fieldNumInvalid
        self.type = 0
        self.scale = 1
        self.offset = 0
        self.units = ""
        self.isAccumulated = false
        self.profileType = Profile.Types.Enum
        self.isExpandedField = false
    }
    
    public convenience init(field: Field?) {
        
        guard let field = field else {
            self.init()
            return
        }
        
        self.init(base: field)
        
        self.name = field.name
        self.num = field.num
        self.type = field.type
        self.scale = field.scale
        self.offset = field.offset
        self.units = field.units
        self.isAccumulated = field.isAccumulated
        self.profileType = field.profileType
        self.isExpandedField = field.isExpandedField
        
        for subfield in field.subfields {
            self.subfields.append(Subfield(subfield: subfield))
        }
        for component in field.components {
            self.components.append(FieldComponent(component: component))
        }
        
    }
    
    internal convenience init(name: String, num: UInt8, type: UInt8, scale: Float64, offset: Float64, units: String, accumulated: Bool, profileType: Profile.Types) {
        self.init()
        self.name = name
        self.num = num
        self.type = type
        self.scale = scale
        self.offset = offset
        self.units = units
        self.isAccumulated = accumulated
        self.profileType = profileType
        self.isExpandedField = false
    }
    
    internal convenience init(num: UInt8, type: UInt8) {
        self.init(name: "unknown", num: num, type: type, scale: 1.0, offset: 0.0, units: "", accumulated: false, profileType: Profile.Types.NumTypes)
    }
}
