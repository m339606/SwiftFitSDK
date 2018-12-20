
public enum ActivityType : UInt8 {
    case Generic = 0
    case Running = 1
    case Cycling = 2
    case Transition = 3
    case FitnessEquipment = 4
    case Swimming = 5
    case Walking = 6
    case Sedentary = 8
    case All = 254
    case Invalid = 0xFF
}
