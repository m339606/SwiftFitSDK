
public enum EventType : UInt8 {
    case Start = 0
    case Stop = 1
    case ConsecutiveDepreciated = 2
    case Marker = 3
    case StopAll = 4
    case BeginDepreciated = 5
    case EndDepreciated = 6
    case EndAllDepreciated = 7
    case StopDisable = 8
    case StopDisableAll = 9
    case Invalid = 0xFF
}
