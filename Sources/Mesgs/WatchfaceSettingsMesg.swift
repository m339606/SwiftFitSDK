public class WatchfaceSettingsMesg : Mesg {
    
    public enum LayoutSubfield: UInt16 {
        case DigitalLayout = 0
        case AnalogLayout = 1
        case Subfields = 2
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case Mode = 0
        case Layout = 1
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.WatchfaceSettings))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getMessageIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 254, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setMessageIndex(_ messageIndex: UInt16) {
        setFieldValue(fieldNum: 254, fieldArrayIndex: 0, value: messageIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMode() -> WatchfaceMode? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WatchfaceMode(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setMode(_ mode: WatchfaceMode) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: mode.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getLayout() -> UInt8? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setLayout(_ layout: UInt8) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: layout, subfieldIndex: Fit.subfieldIndexMainField)
    }
    //
    public func getDigitalLayout() -> DigitalWatchfaceLayout? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: LayoutSubfield.DigitalLayout.rawValue) as? UInt8 {
            return DigitalWatchfaceLayout(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDigitalLayout(_ digitalLayout: DigitalWatchfaceLayout) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: digitalLayout.rawValue, subfieldIndex: LayoutSubfield.DigitalLayout.rawValue)
    }
    
    public func getAnalogLayout() -> AnalogWatchfaceLayout? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: LayoutSubfield.AnalogLayout.rawValue) as? UInt8 {
            return AnalogWatchfaceLayout(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setAnalogLayout(_ analogLayout: AnalogWatchfaceLayout) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: analogLayout.rawValue, subfieldIndex: LayoutSubfield.AnalogLayout.rawValue)
    }
}
