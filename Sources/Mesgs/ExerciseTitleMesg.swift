public class ExerciseTitleMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case ExerciseCategory = 0
        case ExerciseName = 1
        case WktStepName = 2
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.ExerciseTitle))
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
    
    public func getExerciseCategory() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setExerciseCategory(_ exerciseCategory: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: exerciseCategory, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getExerciseName() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setExerciseName(_ exerciseName: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: exerciseName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNumWktStepName() -> Int {
        return getNumFieldValues(fieldNum: 2, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWktStepName(_ index: Int) -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 2, fieldArrayIndex: index, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getWktStepNameAsString(_ index: Int) -> String? {
        if let val = getWktStepName(index) {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setWktStepName(_ index: Int, _ wktStepName: String) {
        if var data = wktStepName.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setWktStepName(_ index: Int, _ wktStepName: [UInt8]) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: index, value: wktStepName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
