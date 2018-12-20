
public enum AutolapTrigger : UInt8 {
    case Time = 0
    case Distance = 1
    case PositionStart = 2
    case PositionLap = 3
    case PositionWaypoint = 4
    case PositionMarked = 5
    case Off = 6
    case Invalid = 0xFF
}
