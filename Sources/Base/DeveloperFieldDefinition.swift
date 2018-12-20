
internal class DeveloperFieldDefinition {
    
    private(set) public var descriptionMesg: FieldDescriptionMesg?
    private(set) public var developerIdMesg: DeveloperDataIdMesg?
    
    public var isDefined: Bool {
        get {
            return descriptionMesg == nil
        }
    }
    private(set) public var fieldNum: UInt8
    
    private(set) public var size: UInt8
    
    private(set) public var developerDataIndex: UInt8

    public init(fieldNum: UInt8, size: UInt8, developerDataIndex: UInt8) {
        self.descriptionMesg = nil
        self.developerIdMesg = nil
        self.fieldNum = fieldNum
        self.size = size
        self.developerDataIndex = developerDataIndex
    }
    
    public init(desc: FieldDescriptionMesg, devId: DeveloperDataIdMesg, size: UInt8) {
        if let developerDataIndex = desc.getDeveloperDataIndex(), let fieldDefinitionNumber = desc.getFieldDefinitionNumber() {
            self.descriptionMesg = desc
            self.developerIdMesg = devId
            self.size = size
            self.fieldNum = fieldDefinitionNumber
            self.developerDataIndex = developerDataIndex
        } else {
            fatalError("Description Message must have a valid developer data index and field definition number")
        }
    }
 
}
