
public enum BpStatus : UInt8 {
    case NoError = 0
    case ErrorIncompleteData = 1
    case ErrorNoMeasurement = 2
    case ErrorDataOutOfRange = 3
    case ErrorIrregularHeartRate = 4
    case Invalid = 0xFF
}
