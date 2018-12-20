
public enum CameraEventType : UInt8 {
    case VideoStart = 0
    case VideoSplit = 1
    case VideoEnd = 2
    case PhotoTaken = 3
    case VideoSecondStreamStart = 4
    case VideoSecondStreamSplit = 5
    case VideoSecondStreamEnd = 6
    case VideoSplitStart = 7
    case VideoSecondStreamSplitStart = 8
    case VideoPause = 11
    case VideoSecondStreamPause = 12
    case VideoResume = 13
    case VideoSecondStreamResume = 14
    case Invalid = 0xFF
}
