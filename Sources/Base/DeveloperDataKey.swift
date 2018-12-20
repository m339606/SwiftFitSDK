
internal class DeveloperDataKey: Hashable {
    
    private(set) public var developerDataIndex: UInt8
    private(set) public var fieldDefNum: UInt8
    
    public init(developerDataIndex: UInt8, fieldDefNum: UInt8) {
        self.developerDataIndex = developerDataIndex
        self.fieldDefNum = fieldDefNum
    }
    
    public var hashValue: Int {
        get {
            var hasher = Hasher()
            hasher.combine(developerDataIndex)
            hasher.combine(fieldDefNum)
            return hasher.finalize()
        }
    }
    
    static func == (lhs: DeveloperDataKey, rhs: DeveloperDataKey) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}
