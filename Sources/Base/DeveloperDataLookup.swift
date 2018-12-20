
internal class DeveloperDataLookup {
    
    private var fieldDescriptionMesgs: [DeveloperDataKey : FieldDescriptionMesg]
    private var developerDataIdMesgs: [UInt8 : DeveloperDataIdMesg]
    
    public init() {
        fieldDescriptionMesgs = [:]
        developerDataIdMesgs = [:]
    }
    
    public func getMesgs(key: DeveloperDataKey) -> (DeveloperDataIdMesg, FieldDescriptionMesg)? {
        if let devIdMesg = developerDataIdMesgs[key.developerDataIndex],
            let descriptionMesg = fieldDescriptionMesgs[key] {
            return (devIdMesg, descriptionMesg)
        }
        return nil
    }
    
    public func add(mesg: DeveloperDataIdMesg) {
        guard let index = mesg.getDeveloperDataIndex() else {
            return
        }
        
        developerDataIdMesgs[index] = mesg
        
        let keysToRemove = fieldDescriptionMesgs.keys.filter({ $0.developerDataIndex == index })
        for key in keysToRemove {
            fieldDescriptionMesgs.removeValue(forKey: key)
        }
    }
    
    public func add(mesg: FieldDescriptionMesg) -> DeveloperFieldDescription? {
        guard let developerDataIndex = mesg.getDeveloperDataIndex(),
            let fieldDefinitionNumber = mesg.getFieldDefinitionNumber() else {
                return nil
        }
        
        let key = DeveloperDataKey(developerDataIndex: developerDataIndex, fieldDefNum: fieldDefinitionNumber)
        
        fieldDescriptionMesgs[key] = mesg
        
        if let pair = getMesgs(key: key) {
            return DeveloperFieldDescription(developerDataId: pair.0, fieldDescription: pair.1)
        }
        
        return nil
    }
}
