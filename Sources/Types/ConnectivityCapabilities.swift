
public struct ConnectivityCapabilities {
    public static let Bluetooth:UInt32 = 0x00000001
    public static let BluetoothLe:UInt32 = 0x00000002
    public static let Ant:UInt32 = 0x00000004
    public static let ActivityUpload:UInt32 = 0x00000008
    public static let CourseDownload:UInt32 = 0x00000010
    public static let WorkoutDownload:UInt32 = 0x00000020
    public static let LiveTrack:UInt32 = 0x00000040
    public static let WeatherConditions:UInt32 = 0x00000080
    public static let WeatherAlerts:UInt32 = 0x00000100
    public static let GpsEphemerisDownload:UInt32 = 0x00000200
    public static let ExplicitArchive:UInt32 = 0x00000400
    public static let SetupIncomplete:UInt32 = 0x00000800
    public static let ContinueSyncAfterSoftwareUpdate:UInt32 = 0x00001000
    public static let ConnectIqAppDownload:UInt32 = 0x00002000
    public static let GolfCourseDownload:UInt32 = 0x00004000
    public static let DeviceInitiatesSync:UInt32 = 0x00008000
    public static let ConnectIqWatchAppDownload:UInt32 = 0x00010000
    public static let ConnectIqWidgetDownload:UInt32 = 0x00020000
    public static let ConnectIqWatchFaceDownload:UInt32 = 0x00040000
    public static let ConnectIqDataFieldDownload:UInt32 = 0x00080000
    public static let ConnectIqAppManagment:UInt32 = 0x00100000
    public static let SwingSensor:UInt32 = 0x00200000
    public static let SwingSensorRemote:UInt32 = 0x00400000
    public static let IncidentDetection:UInt32 = 0x00800000
    public static let AudioPrompts:UInt32 = 0x01000000
    public static let WifiVerification:UInt32 = 0x02000000
    public static let TrueUp:UInt32 = 0x04000000
    public static let FindMyWatch:UInt32 = 0x08000000
    public static let RemoteManualSync:UInt32 = 0x10000000
    public static let LiveTrackAutoStart:UInt32 = 0x20000000
    public static let LiveTrackMessaging:UInt32 = 0x40000000
    public static let InstantInput:UInt32 = 0x80000000
    public static let Invalid:UInt32 = 0x00000000
}
