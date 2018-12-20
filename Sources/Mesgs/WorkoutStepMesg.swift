public class WorkoutStepMesg : Mesg {
    
    public enum DurationValueSubfield: UInt16 {
        case DurationTime = 0
        case DurationDistance = 1
        case DurationHr = 2
        case DurationCalories = 3
        case DurationStep = 4
        case DurationPower = 5
        case DurationReps = 6
        case Subfields = 7
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum TargetValueSubfield: UInt16 {
        case TargetSpeedZone = 0
        case TargetHrZone = 1
        case TargetCadenceZone = 2
        case TargetPowerZone = 3
        case RepeatSteps = 4
        case RepeatTime = 5
        case RepeatDistance = 6
        case RepeatCalories = 7
        case RepeatHr = 8
        case RepeatPower = 9
        case TargetStrokeType = 10
        case Subfields = 11
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum CustomTargetValueLowSubfield: UInt16 {
        case CustomTargetSpeedLow = 0
        case CustomTargetHeartRateLow = 1
        case CustomTargetCadenceLow = 2
        case CustomTargetPowerLow = 3
        case Subfields = 4
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum CustomTargetValueHighSubfield: UInt16 {
        case CustomTargetSpeedHigh = 0
        case CustomTargetHeartRateHigh = 1
        case CustomTargetCadenceHigh = 2
        case CustomTargetPowerHigh = 3
        case Subfields = 4
        case Active = 0xFFFE
        case MainField = 0xFFFF
    }
    
    public enum FieldDefNum: UInt8 {
        case MessageIndex = 254
        case WktStepName = 0
        case DurationType = 1
        case DurationValue = 2
        case TargetType = 3
        case TargetValue = 4
        case CustomTargetValueLow = 5
        case CustomTargetValueHigh = 6
        case Intensity = 7
        case Notes = 8
        case Equipment = 9
        case ExerciseCategory = 10
        case ExerciseName = 11
        case ExerciseWeight = 12
        case WeightDisplayUnit = 13
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.WorkoutStep))
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
    
    public func getWktStepName() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getWktStepNameAsString() -> String? {
        if let val = getWktStepName() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setWktStepName(_ wktStepName: String) {
        if var data = wktStepName.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setWktStepName(_ wktStepName: [UInt8]) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: wktStepName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDurationType() -> WktStepDuration? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WktStepDuration(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setDurationType(_ durationType: WktStepDuration) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: durationType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDurationValue() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDurationValue(_ durationValue: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: durationValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDurationTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: DurationValueSubfield.DurationTime.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDurationTime(_ durationTime: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: durationTime, subfieldIndex: DurationValueSubfield.DurationTime.rawValue)
    }
    
    public func getDurationDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: DurationValueSubfield.DurationDistance.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setDurationDistance(_ durationDistance: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: durationDistance, subfieldIndex: DurationValueSubfield.DurationDistance.rawValue)
    }
    
    public func getDurationHr() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: DurationValueSubfield.DurationHr.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDurationHr(_ durationHr: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: durationHr, subfieldIndex: DurationValueSubfield.DurationHr.rawValue)
    }
    
    public func getDurationCalories() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: DurationValueSubfield.DurationCalories.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDurationCalories(_ durationCalories: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: durationCalories, subfieldIndex: DurationValueSubfield.DurationCalories.rawValue)
    }
    
    public func getDurationStep() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: DurationValueSubfield.DurationStep.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDurationStep(_ durationStep: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: durationStep, subfieldIndex: DurationValueSubfield.DurationStep.rawValue)
    }
    
    public func getDurationPower() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: DurationValueSubfield.DurationPower.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDurationPower(_ durationPower: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: durationPower, subfieldIndex: DurationValueSubfield.DurationPower.rawValue)
    }
    
    public func getDurationReps() -> UInt32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: DurationValueSubfield.DurationReps.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDurationReps(_ durationReps: UInt32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: durationReps, subfieldIndex: DurationValueSubfield.DurationReps.rawValue)
    }
    
    public func getTargetType() -> WktStepTarget? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WktStepTarget(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setTargetType(_ targetType: WktStepTarget) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: targetType.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTargetValue() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTargetValue(_ targetValue: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: targetValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getTargetSpeedZone() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.TargetSpeedZone.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTargetSpeedZone(_ targetSpeedZone: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: targetSpeedZone, subfieldIndex: TargetValueSubfield.TargetSpeedZone.rawValue)
    }
    
    public func getTargetHrZone() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.TargetHrZone.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTargetHrZone(_ targetHrZone: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: targetHrZone, subfieldIndex: TargetValueSubfield.TargetHrZone.rawValue)
    }
    
    public func getTargetCadenceZone() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.TargetCadenceZone.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTargetCadenceZone(_ targetCadenceZone: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: targetCadenceZone, subfieldIndex: TargetValueSubfield.TargetCadenceZone.rawValue)
    }
    
    public func getTargetPowerZone() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.TargetPowerZone.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setTargetPowerZone(_ targetPowerZone: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: targetPowerZone, subfieldIndex: TargetValueSubfield.TargetPowerZone.rawValue)
    }
    
    public func getRepeatSteps() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.RepeatSteps.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setRepeatSteps(_ repeatSteps: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: repeatSteps, subfieldIndex: TargetValueSubfield.RepeatSteps.rawValue)
    }
    
    public func getRepeatTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.RepeatTime.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setRepeatTime(_ repeatTime: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: repeatTime, subfieldIndex: TargetValueSubfield.RepeatTime.rawValue)
    }
    
    public func getRepeatDistance() -> Float32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.RepeatDistance.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setRepeatDistance(_ repeatDistance: Float32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: repeatDistance, subfieldIndex: TargetValueSubfield.RepeatDistance.rawValue)
    }
    
    public func getRepeatCalories() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.RepeatCalories.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setRepeatCalories(_ repeatCalories: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: repeatCalories, subfieldIndex: TargetValueSubfield.RepeatCalories.rawValue)
    }
    
    public func getRepeatHr() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.RepeatHr.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setRepeatHr(_ repeatHr: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: repeatHr, subfieldIndex: TargetValueSubfield.RepeatHr.rawValue)
    }
    
    public func getRepeatPower() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.RepeatPower.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setRepeatPower(_ repeatPower: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: repeatPower, subfieldIndex: TargetValueSubfield.RepeatPower.rawValue)
    }
    
    public func getTargetStrokeType() -> SwimStroke? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: TargetValueSubfield.TargetStrokeType.rawValue) as? UInt8 {
            return SwimStroke(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setTargetStrokeType(_ targetStrokeType: UInt8) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: targetStrokeType, subfieldIndex: TargetValueSubfield.TargetStrokeType.rawValue)
    }
    
    public func getCustomTargetValueLow() -> UInt32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetValueLow(_ customTargetValueLow: UInt32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: customTargetValueLow, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCustomTargetSpeedLow() -> Float32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: CustomTargetValueLowSubfield.CustomTargetSpeedLow.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetSpeedLow(_ customTargetSpeedLow: Float32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: customTargetSpeedLow, subfieldIndex: CustomTargetValueLowSubfield.CustomTargetSpeedLow.rawValue)
    }
    
    public func getCustomTargetHeartRateLow() -> UInt32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: CustomTargetValueLowSubfield.CustomTargetHeartRateLow.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetHeartRateLow(_ customTargetHeartRateLow: UInt32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: customTargetHeartRateLow, subfieldIndex: CustomTargetValueLowSubfield.CustomTargetHeartRateLow.rawValue)
    }
    
    public func getCustomTargetCadenceLow() -> UInt32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: CustomTargetValueLowSubfield.CustomTargetCadenceLow.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetCadenceLow(_ customTargetCadenceLow: UInt32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: customTargetCadenceLow, subfieldIndex: CustomTargetValueLowSubfield.CustomTargetCadenceLow.rawValue)
    }
    
    public func getCustomTargetPowerLow() -> UInt32? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: CustomTargetValueLowSubfield.CustomTargetPowerLow.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetPowerLow(_ customTargetPowerLow: UInt32) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: customTargetPowerLow, subfieldIndex: CustomTargetValueLowSubfield.CustomTargetPowerLow.rawValue)
    }
    
    public func getCustomTargetValueHigh() -> UInt32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetValueHigh(_ customTargetValueHigh: UInt32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: customTargetValueHigh, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getCustomTargetSpeedHigh() -> Float32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: CustomTargetValueHighSubfield.CustomTargetSpeedHigh.rawValue) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetSpeedHigh(_ customTargetSpeedHigh: Float32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: customTargetSpeedHigh, subfieldIndex: CustomTargetValueHighSubfield.CustomTargetSpeedHigh.rawValue)
    }
    
    public func getCustomTargetHeartRateHigh() -> UInt32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: CustomTargetValueHighSubfield.CustomTargetHeartRateHigh.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetHeartRateHigh(_ customTargetHeartRateHigh: UInt32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: customTargetHeartRateHigh, subfieldIndex: CustomTargetValueHighSubfield.CustomTargetHeartRateHigh.rawValue)
    }
    
    public func getCustomTargetCadenceHigh() -> UInt32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: CustomTargetValueHighSubfield.CustomTargetCadenceHigh.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetCadenceHigh(_ customTargetCadenceHigh: UInt32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: customTargetCadenceHigh, subfieldIndex: CustomTargetValueHighSubfield.CustomTargetCadenceHigh.rawValue)
    }
    
    public func getCustomTargetPowerHigh() -> UInt32? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: CustomTargetValueHighSubfield.CustomTargetPowerHigh.rawValue) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setCustomTargetPowerHigh(_ customTargetPowerHigh: UInt32) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: customTargetPowerHigh, subfieldIndex: CustomTargetValueHighSubfield.CustomTargetPowerHigh.rawValue)
    }
    
    public func getIntensity() -> Intensity? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return Intensity(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setIntensity(_ intensity: Intensity) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: intensity.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getNotes() -> [UInt8]? {
        if var val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? [UInt8] {
            val.removeLast(1)
            return val
        } else {
            return nil
        }
    }
    
    public func getNotesAsString() -> String? {
        if let val = getNotes() {
            return String(data: Data(val), encoding: .utf8)
        } else {
            return nil
        }
    }
    
    public func setNotes(_ notes: String) {
        if var data = notes.data(using: .utf8) {
            data.append(0x00)
            setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: [UInt8](data), subfieldIndex: Fit.subfieldIndexMainField)
        }
    }
    
    public func setNotes(_ notes: [UInt8]) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: notes, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEquipment() -> WorkoutEquipment? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt8 {
            return WorkoutEquipment(rawValue: val)
        } else {
            return nil
        }
    }
    
    public func setEquipment(_ equipment: WorkoutEquipment) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: equipment.rawValue, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getExerciseCategory() -> UInt16? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setExerciseCategory(_ exerciseCategory: UInt16) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: exerciseCategory, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getExerciseName() -> UInt16? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setExerciseName(_ exerciseName: UInt16) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: exerciseName, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getExerciseWeight() -> Float32? {
        if let val = getFieldValue(fieldNum: 12, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setExerciseWeight(_ exerciseWeight: Float32) {
        setFieldValue(fieldNum: 12, fieldArrayIndex: 0, value: exerciseWeight, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getWeightDisplayUnit() -> UInt16? {
        if let val = getFieldValue(fieldNum: 13, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setWeightDisplayUnit(_ weightDisplayUnit: UInt16) {
        setFieldValue(fieldNum: 13, fieldArrayIndex: 0, value: weightDisplayUnit, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
