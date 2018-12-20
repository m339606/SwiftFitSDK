
public enum LapTrigger : UInt8 {
    case Manual = 0
    case Time = 1
    case Distance = 2
    case PositionStart = 3
    case PositionLap = 4
    case PositionWaypoint = 5
    case PositionMarked = 6
    case SessionEnd = 7
    case FitnessEquipment = 8
    case Invalid = 0xFF
}
