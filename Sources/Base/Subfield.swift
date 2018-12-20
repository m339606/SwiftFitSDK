
public class Subfield {
    
    private class SubfieldMap {
        
        private var refFieldNum: UInt8
        private var refFieldValue: Any
        
        internal init(refFieldNum: UInt8, refFieldValue: Any) {
            self.refFieldNum = refFieldNum
            self.refFieldValue = refFieldValue
        }
        
        internal init(subfieldMap: SubfieldMap) {
            self.refFieldNum = subfieldMap.refFieldNum
            self.refFieldValue = subfieldMap.refFieldValue
        }
        
        internal func canMesgSupport(mesg: Mesg) -> Bool {
            let field = mesg.getField(fieldNum: refFieldNum)
            
            if let field = field {
                let value = field.getValue(index: 0, subfieldIndex: Fit.subfieldIndexMainField)
            
                if numericCast(value!, Int64.self) == numericCast(refFieldValue, Int64.self) {
                    return true
                }
            }
            return false
        }
        
    }
    
    private(set) internal var name: String
    private(set) internal var type: UInt8
    private(set) internal var scale: Float32
    private(set) internal var offset: Float32
    private(set) internal var units: String
    private var maps: Array<SubfieldMap>
    private(set) internal var components: Array<FieldComponent>
    
    internal init(subfield: Subfield?) {
        if let subfield = subfield {
            self.name = subfield.name
            self.type = subfield.type
            self.scale = subfield.scale
            self.offset = subfield.offset
            self.units = subfield.units
            
            self.maps = Array<SubfieldMap>()
            for map in subfield.maps {
                self.maps.append(SubfieldMap(subfieldMap: map))
            }
            
            self.components = Array<FieldComponent>()
            for comp in subfield.components {
                self.components.append(FieldComponent(component: comp))
            }
        } else {
            self.name = "unknown"
            self.type = 0
            self.scale = 1
            self.offset = 0
            self.units = ""
            self.maps = Array<SubfieldMap>()
            self.components = Array<FieldComponent>()
            return
        }
    }
    
    internal init(name: String, type: UInt8, scale: Float32, offset: Float32, units: String) {
        self.name = name
        self.type = type
        self.scale = scale
        self.offset = offset
        self.units = units
        self.maps = Array<SubfieldMap>()
        self.components = Array<FieldComponent>()
    }
    
    internal func addMap(refFieldNum: UInt8, refFieldValue: Any) {
        maps.append(SubfieldMap(refFieldNum: refFieldNum, refFieldValue: refFieldValue))
    }
    
    internal func addComponent(newComponent: FieldComponent) {
        components.append(newComponent)
    }
    
    public func canMesgSupport(mesg: Mesg) -> Bool {
        for map in maps {
            if map.canMesgSupport(mesg: mesg) {
                return true
            }
        }
        return false
    }
    
}
