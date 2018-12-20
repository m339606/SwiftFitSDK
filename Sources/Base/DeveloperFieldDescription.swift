
public class DeveloperFieldDescription {
    
    private var developerDataId: DeveloperDataIdMesg
    private var fieldDescription: FieldDescriptionMesg
    
    public var applicationVersion: UInt32 {
        get {
            return developerDataId.getApplicationVersion() ?? UInt32.max
        }
    }
    
    public var applicationId: [UInt8] {
        get {
            if developerDataId.getNumApplicationId() != 16 {
                return []
            }
            
            var appId: [UInt8] = []
            
            for i in 0 ..< developerDataId.getNumApplicationId() {
                appId.append(developerDataId.getApplicationId(i) ?? 0xFF)
            }
            
            // TODO: Conversion not yet implemented
            
            return appId
        }
    }
    
    public var fieldDefinitionNumber: UInt8 {
        get {
            return fieldDescription.getFieldDefinitionNumber() ?? UInt8.max
        }
    }
    
    internal init(developerDataId: DeveloperDataIdMesg, fieldDescription: FieldDescriptionMesg) {
        self.developerDataId = developerDataId
        self.fieldDescription = fieldDescription
    }
    
}
