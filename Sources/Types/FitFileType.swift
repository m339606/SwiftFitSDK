
public enum FitFileType : UInt8 {
    case Device = 1
    case Settings = 2
    case Sport = 3
    case Activity = 4
    case Workout = 5
    case Course = 6
    case Schedules = 7
    case Weight = 9
    case Totals = 10
    case Goals = 11
    case BloodPressure = 14
    case MonitoringA = 15
    case ActivitySummary = 20
    case MonitoringDaily = 28
    case MonitoringB = 32
    case Segment = 34
    case SegmentList = 35
    case ExdConfiguration = 40
    case MfgRangeMin = 0xF7
    case MfgRangeMax = 0xFE
    case Invalid = 0xFF
}
