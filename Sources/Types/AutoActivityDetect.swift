
public struct AutoActivityDetect {
    public static let None: UInt32 = 0x00000000
    public static let Running: UInt32 = 0x00000001
    public static let Cycling: UInt32 = 0x00000002
    public static let Swimming: UInt32 = 0x00000004
    public static let Walking: UInt32 = 0x00000008
    public static let Elliptical: UInt32 = 0x00000020
    public static let Sedentary: UInt32 = 0x00000400
    public static let Invalid: UInt32 = 0xFFFFFFFF
}
