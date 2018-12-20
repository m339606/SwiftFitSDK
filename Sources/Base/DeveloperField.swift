
public class DeveloperField: FieldBase {
    
    private var definition: DeveloperFieldDefinition!
    
    public var values: Array<Any>
    
    public var isDefined: Bool {
        get {
            return definition.isDefined
        }
    }
    
    public var num: UInt8 {
        get {
            return definition.fieldNum
        }
    }
    
    public var developerDataIndex: UInt8 {
        get {
            return definition.developerDataIndex
        }
    }
    
    public var appVersion: UInt32 {
        get {
            if definition.isDefined {
                return definition.developerIdMesg?.getApplicationVersion() ?? 0
            }
            return 0
        }
    }
    
    public var appId: [UInt8]? {
        get {
            if definition.isDefined {
                if let msg = definition.developerIdMesg {
                    var appId: [UInt8] = [UInt8(msg.getNumApplicationId())]
                    
                    for i in 0 ..< appId.count {
                        appId[i] = msg.getApplicationId(i) ?? 0xFF
                    }
                    
                    return appId
                }
            }
     
            return nil
        }
    }
   
    public var name: String? {
        get {
            return definition.isDefined ? definition.descriptionMesg?.getFieldNameAsString(0) : nil
        }
    }
    
    public var type: UInt8 {
        get {
            if definition.isDefined {
                return definition.descriptionMesg?.getFitBaseTypeId() ?? Fit.UInt8
            }
            return Fit.UInt8
        }
    }
    
    public var scale: Float64 {
        get {
            if definition.isDefined {
                return Float64(definition.descriptionMesg?.getScale() ?? 1)
            }
            return 1.0
        }
    }
    
    public var offset: Float64 {
        get {
            if definition.isDefined {
                return Float64(definition.descriptionMesg?.getOffset() ?? 0)
            }
            return 0.0
        }
    }
    
    public var units: String? {
        get {
            return definition.isDefined ? definition.descriptionMesg?.getUnitsAsString(0) : nil
        }
    }
    
    public var nativeOverride: UInt8 {
        get {
            if definition.isDefined {
                return definition.descriptionMesg?.getNativeFieldNum() ?? Fit.fieldNumInvalid
            }
            return Fit.fieldNumInvalid
        }
    }
    
    public func getSubfield(subfieldName: String) -> Subfield? {
        return nil
    }
    
    public func getSubfield(subfieldIndex: UInt16) -> Subfield? {
        return nil
    }
    
    public required init() {
        self.values = Array<Any>()
        self.definition = nil
    }
    
    public convenience init(field: DeveloperField) {
        self.init(base: field)
        self.definition = field.definition
    }
    
    internal convenience init(definition: DeveloperFieldDefinition) {
        self.init()
        self.definition = definition
    }
    
    public convenience init(description: FieldDescriptionMesg, developerDataIdMesg: DeveloperDataIdMesg) {
        self.init()
        self.definition = DeveloperFieldDefinition(desc: description, devId: developerDataIdMesg, size: 0)
    }
    
}
