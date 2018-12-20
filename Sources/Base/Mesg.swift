
public class Mesg {
    
    internal var _localNum: UInt8 = 0
    internal var systemTimeOffset: UInt32 = 0
    private(set) public var fields: Array<Field> = Array<Field>()
    private var _developerFields: [DeveloperDataKey: DeveloperField] = [:]
    
    public var name: String
    public var num: UInt16
    public var localNum: UInt8 {
        get {
            return _localNum
        }
        set {
            if newValue > Fit.localMesgNumMask {
                fatalError("Mesg:LocalNum - Invalid Local message number \(newValue). Local message number must be < \(Fit.localMesgNumMask)")
            } else {
                _localNum = newValue
            }
        }
    }
    
    public var developerFields: Array<DeveloperField> {
        get {
            return Array(_developerFields.values)
        }
    }
    
    public init(mesg: Mesg?) {
        guard let mesg = mesg else {
            self.name = "unknown"
            self.num = MesgNum.Invalid
            return
        }
        self.name = mesg.name
        self.num = mesg.num
        self.localNum = mesg.localNum
        self.systemTimeOffset = mesg.systemTimeOffset
        for field in mesg.fields {
            if field.getNumValues() > 0 {
                self.fields.append(Field(field: field))
            }
        }
        
        for fld in mesg.developerFields {
            if fld.getNumValues() > 0 {
                let key = DeveloperDataKey(developerDataIndex: fld.developerDataIndex, fieldDefNum: fld.num)
                _developerFields.updateValue(DeveloperField(field: fld), forKey: key)
            }
        }
    }
    
    public init(name: String, num: UInt16) {
        self.name = name
        self.num = num
    }
    
    internal convenience init(mesgNum: UInt16) {
        self.init(mesg: Profile.getMesg(globalMesgNum: mesgNum))
    }
    
    public convenience init(fitData: PositionableData, defnMesg: MesgDefinition) {
        self.init(mesgNum: defnMesg.globalMesgNum)
        read(inData: fitData, defnMesg: defnMesg)
    }
    
    public func read(inData: PositionableData, defnMesg: MesgDefinition) {
        let inData = inData
        
        inData.position = 1
        let mesgReader = BinaryReader(inData, isBigEndian: defnMesg.isBigEndian)
        localNum = defnMesg.localMesgNum
        
        for fieldDef in defnMesg.getFields() {
            var read = true
            
            var field: Field! = getField(fieldNum: fieldDef.num)
            if field == nil {
                field = Field(field: Profile.getMesg(globalMesgNum: self.num).getField(fieldNum: fieldDef.num))
                if field.num == Fit.fieldNumInvalid {
                    field.num = fieldDef.num
                    field.type = fieldDef.type
                }
                setField(field: field)
            }
            
            if field.type != fieldDef.type {
                let fieldSize = Fit.baseType[Int(field.type & Fit.baseTypeNumMask)].size
                let defSize = Fit.baseType[Int(fieldDef.type & Fit.baseTypeNumMask)].size
                
                if defSize < fieldSize {
                    field.type = fieldDef.type
                } else if defSize != fieldSize {
                    // Demotion is hard. Don't read the field if the
                    // sizes are different. Use the profile type if the
                    // signedness of the field has changed.
                    read = false
                }
            }
            
            if read {
                Mesg.readFieldValue(field: field, size: fieldDef.size, mesgReader: mesgReader)
            } else {
                // Skip the bytes for the field if we aren't going to bother reading them
                _ = mesgReader.readBytes(count: Int(fieldDef.size))
            }
        }
    }
    
    private static func readFieldValue(field: FieldBase, size: UInt8, mesgReader: BinaryReader) {
        var field = field
        
        let baseType = field.type & Fit.baseTypeNumMask
        if baseType == Fit.String {
            let bytes = mesgReader.readBytes(count: Int(size))
            var utf8Bytes: [UInt8] = []
            
            if !bytes.contains(where: { $0 != 0 }) {
                // Array has no non zero values, don't add any strings
                return
            }
            
            for i in 0 ..< Int(size) {
                let b = bytes[i]
                utf8Bytes.append(b)
                
                if b == 0x00 {
                    field.addValue(value: utf8Bytes)
                    utf8Bytes.removeAll()
                }
            }
            
            if utf8Bytes.count != 0 {
                // Add a Null Terminator
                utf8Bytes.append(0x00)
                field.addValue(value: utf8Bytes)
                utf8Bytes.removeAll()
            }
        } else {
            let numElements = Int(size / Fit.baseType[Int(baseType)].size)
            for i in 0 ..< numElements {
                var value: Any = 0x00
                let invalid = tryReadValue(value: &value, type: field.type, mesgReader: mesgReader, size: size)
                
                if !invalid || numElements > 1 {
                    field.setRawValue(index: i, value: value)
                }
            }
        }
    }
    
    private static func tryReadValue(value: inout Any, type: UInt8, mesgReader: BinaryReader, size: UInt8) -> Bool {
        var invalid = true
        let baseTypeNum = type & Fit.baseTypeNumMask
        switch baseTypeNum {
        case Fit.Enum, Fit.Byte, Fit.UInt8, Fit.UInt8z:
            value = mesgReader.readByte()
            if numericCast(value, UInt8.self) != numericCast(Fit.baseType[Int(baseTypeNum)].invalidValue, UInt8.self) {
                invalid = false
            }
            
        case Fit.SInt8:
            value = mesgReader.readSByte()
            if numericCast(value, Int8.self) != numericCast(Fit.baseType[Int(baseTypeNum)].invalidValue, Int8.self) {
                invalid = false
            }
            
        case Fit.SInt16:
            value = mesgReader.readInt16()
            if numericCast(value, Int16.self) != numericCast(Fit.baseType[Int(baseTypeNum)].invalidValue, Int16.self) {
                invalid = false
            }
            
        case Fit.UInt16, Fit.UInt16z:
            value = mesgReader.readUInt16()
            if numericCast(value, UInt16.self) != numericCast(Fit.baseType[Int(baseTypeNum)].invalidValue, UInt16.self) {
                invalid = false
            }
            
        case Fit.SInt32:
            value = mesgReader.readInt32()
            if numericCast(value, Int32.self) != numericCast(Fit.baseType[Int(baseTypeNum)].invalidValue, Int32.self) {
                invalid = false
            }
            
        case Fit.UInt32, Fit.UInt32z:
            value = mesgReader.readUInt32()
            if numericCast(value, UInt32.self) != numericCast(Fit.baseType[Int(baseTypeNum)].invalidValue, UInt32.self) {
                invalid = false
            }
            
        case Fit.SInt64:
            value = mesgReader.readInt64()
            if numericCast(value, Int64.self) != numericCast(Fit.baseType[Int(baseTypeNum)].invalidValue, Int64.self) {
                invalid = false
            }
            
        case Fit.UInt64, Fit.UInt64z:
            value = mesgReader.readUInt64()
            if numericCast(value, UInt64.self) != numericCast(Fit.baseType[Int(baseTypeNum)].invalidValue, UInt64.self) {
                invalid = false
            }
            
        case Fit.Float32:
            value = mesgReader.readFloat32()
            if floatCast(value) != floatCast(Fit.baseType[Int(baseTypeNum)].invalidValue) {
                invalid = false
            }
            
        case Fit.Float64:
            value = mesgReader.readFloat64()
            if doubleCast(value) != doubleCast(Fit.baseType[Int(baseTypeNum)].invalidValue) {
                invalid = false
            }
            
        default:
            value = mesgReader.readBytes(count: Int(size))
        }
        
        return invalid
    }
    
    public func write(outData: PositionableData) {
        write(outData: outData, mesgDef: nil)
    }
    
    public func write(outData: PositionableData, mesgDef: MesgDefinition?) {
        let mesgDef = mesgDef ?? MesgDefinition(mesg: self);
        
        let bw = BinaryWriter(outData, isBigEndian: mesgDef.isBigEndian)
        bw.write(localNum)
        
        for fieldDef in mesgDef.getFields() {
            var field = getField(fieldNum: fieldDef.num)
            if field == nil {
                field = Profile.getField(globalMesgNum: self.num, fieldNum: fieldDef.num)
                
                if let field = field {
                    fields.append(field)
                } else {
                    field = Field(num: fieldDef.num, type: fieldDef.type)
                }
            }
            
            writeField(field: field!, size: fieldDef.size, bw: bw)
        }
     
        for fieldDef in mesgDef.developerFieldDefinitions {
            var field = getDeveloperField(fieldNum: fieldDef.fieldNum, developerIndex: fieldDef.developerDataIndex)
            
            if field == nil {
                field = DeveloperField(definition: fieldDef)
                setDeveloperField(field: field!)
            }
            
            writeField(field: field!, size: fieldDef.size, bw: bw)
        }
    }
    
    private func writeField(field: FieldBase, size: UInt8, bw: BinaryWriter) {
        var field = field
        let baseType = field.type & Fit.baseTypeNumMask
        
        while field.getSize() < size {
            if baseType == Fit.String {
                let padAmount = size - field.getSize()
                let value = field.getValue(index: field.getNumValues() - 1) as? [UInt8]
                var temp: [UInt8] = []
                
                if value != nil {
                    temp.append(contentsOf: value!)
                }
                
                for _ in 0 ..< padAmount {
                    temp.append(numericCast(Fit.baseType[Int(baseType)].invalidValue, UInt8.self))
                }
                
                field.setValue(value: temp)
            } else {
                field.addValue(value: Fit.baseType[Int(baseType)].invalidValue)
            }
        }
        
        for i in 0 ..< field.getNumValues() {

            let value: Any
            if let v = field.getRawValue(index: i) {
                value = v
            } else {
                value = Fit.baseType[Int(baseType)].invalidValue
            }
            
            switch baseType {
            case Fit.Enum, Fit.Byte, Fit.UInt8, Fit.UInt8z:
                bw.write(numericCast(value, UInt8.self))
                
            case Fit.SInt8:
                bw.write(numericCast(value, Int8.self))
                
            case Fit.SInt16:
                bw.write(numericCast(value, Int16.self))
                
            case Fit.UInt16, Fit.UInt16z:
                bw.write(numericCast(value, UInt16.self))
                
            case Fit.SInt32:
                bw.write(numericCast(value, Int32.self))
                
            case Fit.UInt32, Fit.UInt32z:
                bw.write(numericCast(value, UInt32.self))
                
            case Fit.SInt64:
                bw.write(numericCast(value, Int64.self))
                
            case Fit.UInt64, Fit.UInt64z:
                bw.write(numericCast(value, UInt64.self))
                
            case Fit.Float32:
                bw.write(floatCast(value))
                
            case Fit.Float64:
                bw.write(doubleCast(value))
                
            case Fit.String:
                bw.write(value as! [UInt8])
                
            default:
                break
            }
        }
    }
    
    public func hasField(fieldNum: UInt8) -> Bool {
        for field in fields {
            if field.num == fieldNum {
                return true
            }
        }
        return false
    }
    
    public func setDeveloperField(field: DeveloperField) {
        let devKey = DeveloperDataKey(developerDataIndex: field.developerDataIndex, fieldDefNum: field.num)
        _developerFields.updateValue(field, forKey: devKey)
    }
    
    public func setField(field: Field) {
        for i in 0 ..< fields.count {
            if fields[i].num == field.num {
                fields[i] = field
                return
            }
        }
        fields.append(field)
    }
    
    public func insertField(index: Int32, field: Field) {
        for i in 0 ..< fields.count {
            if fields[i].num == field.num {
                fields.remove(at: i)
            }
        }
        
        if index < 0 || index > fields.count {
            fields.append(field)
        } else {
            fields.insert(field, at: Int(index))
        }
    }
    
    public func setFields(mesg: Mesg) {
        if mesg.num != num {
            return
        }
        for field in mesg.fields {
            setField(field: Field(field: field))
        }
    }
    
    public func getNumFields() -> Int {
        return fields.count
    }
    
    private func getDeveloperField(fieldNum: UInt8, developerIndex: UInt8) -> DeveloperField? {
        let devKey = DeveloperDataKey(developerDataIndex: developerIndex, fieldDefNum: fieldNum)
        return _developerFields.contains(where: { $0.key == devKey }) ? _developerFields[devKey] : nil
    }
    
    public func getOverrideField(fieldNum: UInt8) -> Array<FieldBase> {
        var localFields: Array<FieldBase> = Array<FieldBase>()
        
        let nativeField = getField(fieldNum: fieldNum)
        if let nativeField = nativeField {
            localFields.append(nativeField)
        }
        
        for field in developerFields.filter({ $0.nativeOverride == fieldNum }) {
            localFields.append(field)
        }
        
        return localFields
    }
    
    public func getField(fieldNum: UInt8) -> Field? {
        for field in fields {
            if field.num == fieldNum {
                return field
            }
        }
        return nil
    }
    
    public func getField(fieldName: String) -> Field? {
        return getField(fieldName: fieldName, checkMesgSupportForSubFields: true)
    }
    
    public func getField(fieldName: String, checkMesgSupportForSubFields: Bool) -> Field? {
        for field in fields {
            if field.name == fieldName {
                return field
            }
            
            for subfield in field.subfields {
                if subfield.name == fieldName && (!checkMesgSupportForSubFields || subfield.canMesgSupport(mesg: self)) {
                    return field
                }
            }
        }
        return nil
    }
    
    public func getActiveSubFieldIndex(fieldNum: UInt8) -> UInt16 {
        let testField = Field(field: self.getField(fieldNum: fieldNum))
        for i in 0 ..< testField.subfields.count {
            if testField.subfields[i].canMesgSupport(mesg: self) {
                return UInt16(i)
            }
        }
        return Fit.subfieldIndexMainField
    }
    
    public func GetActiveSubFieldName(fieldNum: UInt8) -> String {
        let testField = Field(field: self.getField(fieldNum: fieldNum))
       
        for subfield in testField.subfields {
            if subfield.canMesgSupport(mesg: self) {
                return subfield.name
            }
        }
        return Fit.subfieldNameMainField
    }
    
    public func removeField(field: Field) {
        fields.removeAll(where: { $0 === field })
    }
    
    public func getNumFieldValues(fieldNum: UInt8) -> Int {
        let field = getField(fieldNum: fieldNum)
        
        if let field = field {
            return field.getNumValues()
        }
        return 0
    }
    
    public func getNumFieldValues(fieldName: String) -> Int {
        let field = getField(fieldName: fieldName)
        
        if let field = field {
            return field.getNumValues()
        }
        return 0
    }
    
    public func getNumFieldValues(fieldNum: UInt8, subfieldIndex: UInt16) -> Int {
        guard let field = getField(fieldNum: fieldNum) else {
            return 0
        }
        
        if subfieldIndex == Fit.subfieldIndexActiveSubfield {
            return field.getNumValues()
        }
        
        let subfield = field.getSubfield(subfieldIndex: subfieldIndex)
        if subfield == nil || subfield!.canMesgSupport(mesg: self) {
            return field.getNumValues()
        } else {
            return 0
        }
    }
    
    public func getNumFieldValues(fieldNum: UInt8, subfieldName: String) -> Int {
        guard let field = getField(fieldNum: fieldNum) else {
            return 0
        }
        
        let subfield = field.getSubfield(subfieldName: subfieldName)
        if subfield == nil || subfield!.canMesgSupport(mesg: self) {
            return field.getNumValues()
        } else {
            return 0
        }
    }
    
    public func getFieldValue(fieldNum: UInt8) -> Any? {
        return getFieldValue(fieldNum: fieldNum, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexActiveSubfield)
    }
    
    public func getFieldValue(fieldNum: UInt8, fieldArrayIndex: Int) -> Any? {
        return getFieldValue(fieldNum: fieldNum, fieldArrayIndex: fieldArrayIndex, subFieldIndex: Fit.subfieldIndexActiveSubfield)
    }
    
    public func getFieldValue(fieldNum: UInt8, fieldArrayIndex: Int, subFieldIndex: UInt16) -> Any? {
        guard let field = getField(fieldNum: fieldNum) else {
            return nil
        }
        
        if subFieldIndex == Fit.subfieldIndexActiveSubfield {
            return field.getValue(index: fieldArrayIndex, subfieldIndex: getActiveSubFieldIndex(fieldNum: fieldNum))
        } else {
            let subfield = field.getSubfield(subfieldIndex: subFieldIndex)
            
            if subfield == nil || subfield!.canMesgSupport(mesg: self) {
                return field.getValue(index: fieldArrayIndex, subfieldIndex: subFieldIndex)
            } else {
                return nil
            }
        }
    }
    
    public func getFieldValue(fieldNum: UInt8, fieldArrayIndex: Int, subfieldName: String) -> Any? {
        guard let field = getField(fieldNum: fieldNum) else {
            return nil
        }
        
        let subfield = field.getSubfield(subfieldName: subfieldName)
        
        if subfield == nil || subfield!.canMesgSupport(mesg: self) {
            return field.getValue(index: fieldArrayIndex, subfieldName: subfieldName)
        } else {
            return nil
        }
    }
    
    public func getFieldValue(name: String) -> Any? {
        return getFieldValue(name: name, fieldArrayIndex: 0)
    }
    
    public func getFieldValue(name: String, fieldArrayIndex: Int) -> Any? {
        guard let field = getField(fieldName: name, checkMesgSupportForSubFields: false) else {
            return nil
        }
        
        let subfield = field.getSubfield(subfieldName: name)
        
        if subfield == nil || subfield!.canMesgSupport(mesg: self) {
            return field.getValue(index: fieldArrayIndex, subfieldName: name)
        } else {
            return nil
        }
    }
    
    public func getIsFieldAccumulated(num: UInt8) -> Bool {
        if let field = getField(fieldNum: num) {
            return field.isAccumulated
        }
        return false
    }
    
    public func setFieldValue(fieldNum: UInt8, value: Any) {
        setFieldValue(fieldNum: fieldNum, fieldArrayIndex: 0, value: value, subfieldIndex: Fit.subfieldIndexActiveSubfield)
    }
    
    public func setFieldValue(fieldNum: UInt8, fieldArrayIndex: Int, value: Any) {
        setFieldValue(fieldNum: fieldNum, fieldArrayIndex: fieldArrayIndex, value: value, subfieldIndex: Fit.subfieldIndexActiveSubfield)
    }
    
    public func setFieldValue(fieldNum: UInt8, fieldArrayIndex: Int, value: Any, subfieldIndex: UInt16) {
        var subfieldIndex = subfieldIndex
        
        if subfieldIndex == Fit.subfieldIndexActiveSubfield {
            subfieldIndex = getActiveSubFieldIndex(fieldNum: fieldNum)
        } else {
            let testField = Field(field: getField(fieldNum: fieldNum))
            let subfield = testField.getSubfield(subfieldIndex: subfieldIndex)
            
            if subfield != nil && !subfield!.canMesgSupport(mesg: self) {
                return
            }
        }
        
        var field = getField(fieldNum: fieldNum)
        
        if field == nil {
            field = Field(field: Profile.getMesg(globalMesgNum: self.num).getField(fieldNum: fieldNum))
            if field!.num == Fit.fieldNumInvalid {
                field?.num = fieldNum
            }
            setField(field: field!)
        }
        field?.setValue(index: fieldArrayIndex, value: value, subfieldIndex: subfieldIndex)
    }
    
    public func setFieldValue(fieldNum: UInt8, fieldArrayIndex: Int, value: Any, subfieldName: String) {
        let testField = Field(field: getField(fieldNum: fieldNum))
        let subfield = testField.getSubfield(subfieldName: subfieldName)
        
        if subfield != nil && !subfield!.canMesgSupport(mesg: self) {
            return
        }
        
        var field = getField(fieldNum: fieldNum)
       
        if field == nil {
            field = Field(field: Profile.getMesg(globalMesgNum: self.num).getField(fieldNum: fieldNum))
            if field!.num == Fit.fieldNumInvalid {
                field?.num = fieldNum
            }
            setField(field: field!)
        }
        field?.setValue(index: fieldArrayIndex, value: value, subfieldName: subfieldName)
    }
    
    public func setFieldValue(name: String, value: Any) {
        setFieldValue(name: name, fieldArrayIndex: 0, value: value)
    }
    
    public func setFieldValue(name: String, fieldArrayIndex: Int, value: Any) {
        let testField = Field(field: self.getField(fieldName: name))
        let subfield = testField.getSubfield(subfieldName: name)
        
        if subfield != nil && !subfield!.canMesgSupport(mesg: self) {
            return
        }
        
        var field = getField(fieldName: name, checkMesgSupportForSubFields: false)
        
        if field == nil {
            field = Field(field: Profile.getMesg(globalMesgNum: self.num).getField(fieldName: name))
            setField(field: field!)
        }
        
        field?.setValue(index: fieldArrayIndex, value: value, subfieldName: name)
    }
    
    public func timestampToDate(timestamp: UInt32?) -> FitDateTime? {
        if let timestamp = timestamp {
            var fitDateTime = FitDateTime(timeStamp: timestamp)
            fitDateTime.convertSystemTimeToUTC(systemTimeOffset: systemTimeOffset)
            return fitDateTime
        } else {
            return nil
        }
    }
    
    public func removeExpandedFields() {
        fields.removeAll(where: { $0.isExpandedField })
    }
    
    private func expandComponentsInList(componentList: Array<FieldComponent>, currentField: Field, offset: Int, accumulator: Accumulator) -> Array<FieldComponentExpansion> {
        
        var offset = offset
        var components = Array<FieldComponentExpansion>()
        
        if componentList.count > 0 {
            for fC in componentList {
                if fC.fieldNum != Fit.fieldNumInvalid {
                    var newField = Field(field: Profile.getMesg(globalMesgNum: self.num).getField(fieldNum: fC.fieldNum))
                    newField.isExpandedField = true
                    var f = self.getField(fieldNum: newField.num)
                    
                    var bitsValue: Int64? = currentField.getBitsValue(offset: offset, bits: fC.bits, componentType: newField.type)
                    if bitsValue == nil {
                        break
                    }
                    
                    if fC.accumulate == true {
                        bitsValue = accumulator.accumulate(mesgNum: Int32(self.num), destFieldNum: Int32(fC.fieldNum), value: bitsValue!, bits: fC.bits)
                    }
                    
                    if newField.isNumeric() {
                        if FitBaseType.isNumericInvalid(value: bitsValue!, type: newField.getType()) {
                            if self.hasField(fieldNum: newField.num) {
                                f!.setRawValue(index: f!.getNumValues(), value: bitsValue!)
                            } else {
                                newField.setRawValue(index: 0, value: bitsValue!)
                            }
                        } else {
                            var fbitsValue: Float64 = Float64(bitsValue!)
                            
                            fbitsValue = (fbitsValue / fC.scale) - fC.offset
                            
                            if self.hasField(fieldNum: newField.num) {
                                f!.setValue(index: f!.getNumValues(), value: fbitsValue)
                            } else {
                                newField.setValue(value: fbitsValue)
                            }
                        }
                    } else {
                        var nonNumericBitsValue: Any
                        
                        if (newField.type & Fit.baseTypeNumMask) == Fit.String {
                            let v: Array<UInt8> = [UInt8(bitsValue!)]
                            nonNumericBitsValue = v
                        } else {
                            nonNumericBitsValue = bitsValue!
                        }
                        
                        if hasField(fieldNum: newField.num) {
                            f!.setValue(index: f!.getNumValues(), value: nonNumericBitsValue)
                        } else {
                            newField.setValue(value: nonNumericBitsValue)
                        }
                    }
                    offset += fC.bits
                    
                    components.append(FieldComponentExpansion(f: newField, offset: offset))
                    
                }
            }
        }
        
        return components
    }
    
    public func expandComponents(accumulator: Accumulator) {
        for i in 0 ..< fields.count {
            var componentList: Array<FieldComponent>? = nil
            let activeSubfield: UInt16 = getActiveSubFieldIndex(fieldNum: fields[i].num)
            
            if activeSubfield == Fit.subfieldIndexMainField {
                componentList = fields[i].components
            } else {
                componentList = fields[i].getSubfield(subfieldIndex: activeSubfield)?.components
            }
            
            var offset: Int = 0
            for f in expandComponentsInList(componentList: componentList!, currentField: fields[i], offset: offset, accumulator: accumulator) {
                fields.append(f.getField())
                offset += f.getOffset()
            }
        }
    }
    
    internal class FieldComponentExpansion {
        private var offset: Int
        private var field: Field
        
        public init(f: Field, offset: Int) {
            self.field = f
            self.offset = offset
        }
        
        public func getOffset() -> Int {
            return offset
        }
        
        public func getField() -> Field {
            return field
        }
    }
}
