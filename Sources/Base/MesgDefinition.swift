
public class MesgDefinition {
    
    private var architecture: UInt8
    private var _localMesgNum: UInt8
    private var fieldDefs: Array<FieldDefinition> = []
    private var devFieldDefs: Array<DeveloperFieldDefinition> = []
    private var header: UInt8 = 0
    
    public var globalMesgNum: UInt16
    public var localMesgNum: UInt8 {
        get {
            return _localMesgNum
        }
        set {
            if newValue > Fit.localMesgNumMask {
                fatalError("MesgDefinition:LocalMesgNum - Invalid Local message number \(newValue). Local message number must be < \(Fit.localMesgNumMask)")
            } else {
                _localMesgNum = newValue
            }
        }
    }
    
    public var numDevFields: UInt8 {
        get {
            return UInt8(devFieldDefs.count)
        }
    }
    
    public var numFields: UInt8 = 0
    
    public var isBigEndian: Bool {
        get {
            return architecture == Fit.bigEndian
        }
    }
    
    private var containsDevData: Bool {
        get {
            return (header & Fit.devDataMask) == Fit.devDataMask
        }
    }
    
    internal var developerFieldDefinitions: Array<DeveloperFieldDefinition> {
        get {
            return devFieldDefs
        }
    }
    
    internal init() {
        _localMesgNum = 0
        globalMesgNum = MesgNum.Invalid
        architecture = Fit.littleEndian
    }
    
    internal convenience init(fitSource: PositionableData, lookup: DeveloperDataLookup!) {
        self.init()
        self.read(fitSource: fitSource, lookup: lookup)
    }
    
    public convenience init(fitSource: PositionableData) {
        self.init(fitSource: fitSource, lookup: nil)
    }
    
    public convenience init(mesg: Mesg) {
        self.init()
        localMesgNum = mesg.localNum
        globalMesgNum = mesg.num
        architecture = Fit.littleEndian
        numFields = UInt8(mesg.fields.count)
        
        for field in mesg.fields {
            fieldDefs.append(FieldDefinition(field: field))
        }
        
        for field in mesg.developerFields {
            devFieldDefs.append(DeveloperFieldDefinition(fieldNum: field.num, size: field.getSize(), developerDataIndex: field.developerDataIndex))
        }
    }
    
    public convenience init(mesgDef: MesgDefinition) {
        self.init()
        localMesgNum = mesgDef.localMesgNum
        globalMesgNum = mesgDef.globalMesgNum
        architecture = mesgDef.architecture
        numFields = mesgDef.numFields
        
        for fieldDef in mesgDef.fieldDefs {
            fieldDefs.append(FieldDefinition(fieldDef: fieldDef))
        }
        
        devFieldDefs.append(contentsOf: mesgDef.devFieldDefs)
    }
    
    internal func read(fitSource: PositionableData, lookup: DeveloperDataLookup) {
        let fitSource = fitSource
        fitSource.position = 0
        
        let br = BinaryReader(fitSource, isBigEndian: false)
        
        header = br.readByte()
        _localMesgNum = header & Fit.localMesgNumMask
        
        let _ = br.readByte() // reserved Byte
        architecture = br.readByte()
        br.isBigEndian = self.isBigEndian
        globalMesgNum = br.readUInt16()
        numFields = br.readByte()
        for _ in 0 ..< numFields {
            let num = br.readByte()
            let size = br.readByte()
            let type = br.readByte()
            
            let newField = FieldDefinition(newNum: num, newSize: size, newType: type)
            fieldDefs.append(newField)
        }
        
        if containsDevData {
            let devFldCount = br.readByte()
            for _ in 0 ..< devFldCount {
                let num = br.readByte()
                let size = br.readByte()
                let devIdx = br.readByte()
                var defn: DeveloperFieldDefinition
                let key = DeveloperDataKey(developerDataIndex: devIdx, fieldDefNum: num)
                let tuple = lookup.getMesgs(key: key)
                if let tuple = tuple {
                    defn = DeveloperFieldDefinition(desc: tuple.1, devId: tuple.0, size: size)
                } else {
                    defn = DeveloperFieldDefinition(fieldNum: num, size: size, developerDataIndex: devIdx)
                }
                devFieldDefs.append(defn)
            }
        }
    }
    
    public func write(fitDest: PositionableData) {
        let bw = BinaryWriter(fitDest, isBigEndian: self.isBigEndian)
        var header = localMesgNum
        header |= Fit.mesgDefinitionMask
        header |= numDevFields > 0 ? Fit.devDataMask : 0x00
        
        bw.write(header)
        bw.write(Fit.mesgDefinitionReserved)
        bw.write(architecture)
        bw.write(globalMesgNum)
        bw.write(numFields)
        
        if numFields != fieldDefs.count {
            fatalError("MesgDefinition:Write - Field Count Internal Error")
        }
        
        for def in fieldDefs {
            bw.write(def.num)
            bw.write(def.size)
            bw.write(def.type)
        }
        
        if numDevFields > 0 {
            bw.write(numDevFields)
        }
        
        for def in devFieldDefs {
            bw.write(def.fieldNum)
            bw.write(def.size)
            bw.write(def.developerDataIndex)
        }
    }
    
    public func getMesgSize() -> Int {
        var mesgSize = 1
        mesgSize += Int(fieldDefs.map({ $0.size }).reduce(0, +))
        mesgSize += Int(devFieldDefs.map({ $0.size }).reduce(0, +))
        return mesgSize
    }
    
    public func addField(field: FieldDefinition) {
        fieldDefs.append(field)
    }
    
    public func clearFields() {
        fieldDefs.removeAll()
    }
    
    public func getNumFields() -> Int {
        return fieldDefs.count
    }
    
    public func getFields() -> Array<FieldDefinition> {
        return fieldDefs
    }
    
    public func getField(num: UInt8) -> FieldDefinition? {
        for fieldDef in fieldDefs {
            if fieldDef.num == num {
                return fieldDef
            }
        }
        return nil
    }
    
    internal func getDeveloperFieldDefinition(num: UInt8, developerIndex: UInt8) -> DeveloperFieldDefinition? {
        return devFieldDefs.first(where: { $0.fieldNum == num && $0.developerDataIndex  == developerIndex})
    }
    
    public func supports(mesg: Mesg) -> Bool {
        return supports(mesgDef: MesgDefinition(mesg: mesg))
    }
    
    public func supports(mesgDef: MesgDefinition?) -> Bool {
        guard let mesgDef = mesgDef else {
            return false
        }
        
        guard globalMesgNum == mesgDef.globalMesgNum else {
            return false
        }
        
        guard localMesgNum == mesgDef.localMesgNum else {
            return false
        }
        
        for fieldDef in mesgDef.getFields() {
            guard let supportedFieldDef = getField(num: fieldDef.num) else {
                return false
            }
            
            guard fieldDef.size <= supportedFieldDef.size else {
                return false
            }
        }
        
        for fieldDef in mesgDef.developerFieldDefinitions {
            guard let supportedFieldDef = getDeveloperFieldDefinition(num: fieldDef.fieldNum, developerIndex: fieldDef.developerDataIndex) else {
                return false
            }
            
            guard fieldDef.size <= supportedFieldDef.size else {
                return false
            }
        }
        
        return true
    }
    
}
