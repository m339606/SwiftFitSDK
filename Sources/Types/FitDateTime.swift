public struct FitDateTime {
    
    private(set) public var fractionalTimeStamp: Float64
    private(set) public var timeStamp: UInt32
    private var min: UInt32 = 0x10000000
    
    public static var offset: Date {
        var comps = DateComponents(year: 1989,
                                   month: 12,
                                   day: 31)
        comps.timeZone = TimeZone(abbreviation: "UTC")
        return Calendar(identifier: .gregorian).date(from: comps)!
    }
    
    public init(timeStamp: UInt32) {
        self.timeStamp = timeStamp
        self.fractionalTimeStamp = 0
    }
    
    public init(timeStamp: UInt32, fractionalTimeStamp: Float64) {
        self.timeStamp = timeStamp + UInt32(floor(fractionalTimeStamp))
        self.fractionalTimeStamp = fractionalTimeStamp - floor(fractionalTimeStamp)
    }
    
    public init(date: Date) {
        let diff = date.timeIntervalSince1970 - FitDateTime.offset.timeIntervalSince1970
        timeStamp = UInt32(diff)
        fractionalTimeStamp = diff - Float64(timeStamp)
    }
    
    public init(fitDateTime: FitDateTime) {
        self.init(timeStamp: fitDateTime.timeStamp, fractionalTimeStamp: fitDateTime.fractionalTimeStamp)
    }
    
    public mutating func convertSystemTimeToUTC(systemTimeOffset: UInt32) {
        if timeStamp < min {
            timeStamp += systemTimeOffset
        }
    }
    
    public func getDate() -> Date {
        return Date(timeIntervalSince1970: Float64(timeStamp) + fractionalTimeStamp + FitDateTime.offset.timeIntervalSince1970)
    }
    
}
