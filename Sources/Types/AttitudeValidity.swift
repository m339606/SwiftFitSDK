
public struct AttitudeValidity {
    public static let TrackAngleHeadingValid: UInt16 = 0x0001
    public static let PitchValid: UInt16 = 0x0002
    public static let RollValid: UInt16 = 0x0004
    public static let LateralBodyAccelValid: UInt16 = 0x0008
    public static let NormalBodyAccelValid: UInt16 = 0x0010
    public static let TurnRateValid: UInt16 = 0x0020
    public static let HwFail: UInt16 = 0x0040
    public static let MagInvalid: UInt16 = 0x0080
    public static let NoGps: UInt16 = 0x0100
    public static let GpsInvalid: UInt16 = 0x0200
    public static let SolutionCoasting: UInt16 = 0x0400
    public static let TrueTrackAngle: UInt16 = 0x0800
    public static let MagneticHeading: UInt16 = 0x1000
    public static let Invalid: UInt16 = 0xFFFF
}
