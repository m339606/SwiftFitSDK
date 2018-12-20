
internal protocol IValidator {
    
    func validateMesg(mesg: Mesg) -> Bool

    func validateMesgDefn(defn: MesgDefinition) -> Bool
    
}

internal class ProtocolValidator : IValidator {

    private let validator: IValidator?
    
    public init(version: ProtocolVersion) {
        switch version {
        case .v10:
            validator = V1Validator()
        default:
            validator = nil
        }
    }
    
    func validateMesg(mesg: Mesg) -> Bool {
        if let validator = validator {
            return validator.validateMesg(mesg: mesg)
        } else {
            return true
        }
    }
    
    func validateMesgDefn(defn: MesgDefinition) -> Bool {
        if let validator = validator {
            return validator.validateMesgDefn(defn: defn)
        } else {
            return true
        }
    }
    
}

internal class V1Validator : IValidator {
    
    func validateMesg(mesg: Mesg) -> Bool {
        if mesg.developerFields.count > 0 {
            return false
        }
        
        for fld in mesg.fields {
            let typeNum = fld.type & Fit.baseTypeNumMask
            if typeNum > Fit.Byte {
                return false
            }
        }
        
        return true
    }
    
    func validateMesgDefn(defn: MesgDefinition) -> Bool {
        if defn.developerFieldDefinitions.count > 0 {
            return false
        }
        
        for fld in defn.getFields() {
            let typeNum = fld.type & Fit.baseTypeNumMask
            if typeNum > Fit.Byte {
                return false
            }
        }
        
        return true
    }
    
}
