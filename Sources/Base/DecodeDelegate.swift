
public protocol DecodeDelegate : class {
    
    func didReadMesg(mesg: Mesg)
    
    func didReadMesgDefinition(mesgDef: MesgDefinition)
    
    func didReadDeveloperFieldDescription(fieldDesc: DeveloperFieldDescription)
}
