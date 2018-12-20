
public class CRC {
    
    private static let crcTable: [UInt16] = [0x0000, 0xCC01, 0xD801, 0x1400, 0xF001, 0x3C00, 0x2800, 0xE401, 0xA001, 0x6C00, 0x7800, 0xB401, 0x5000, 0x9C01, 0x8801, 0x4400]
    
    public static func get16(crc: UInt16, data: UInt8) -> UInt16 {
        var crc = crc
        
        var tmp: UInt16
        
        tmp = crcTable[Int(crc & 0xF)]
        crc = ((crc >> 4) & 0x0FFF)
        crc = crc ^ tmp ^ crcTable[Int(data & 0xF)]
        
        tmp = crcTable[Int(crc & 0xF)]
        crc = ((crc >> 4) & 0x0FFF)
        crc = crc ^ tmp ^ crcTable[Int((data >> 4) & 0xF)]
        
        return crc
    }
    
    public static func calc16(dataBlock: [UInt8], size: Int) -> UInt16 {
        var crc: UInt16 = 0
        for i in 0 ..< size {
            crc = CRC.get16(crc: crc, data: dataBlock[i])
        }
        return crc
    }
}
