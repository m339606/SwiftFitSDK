
public enum TimeMode : UInt8 {
    case Hour12 = 0
    case Hour24 = 1
    case Military = 2
    case Hour12WithSeconds = 3
    case Hour24WithSeconds = 4
    case Utc = 5
    case Invalid = 0xFF
}
