public class DiveSummaryMesg : Mesg {
    
    public enum FieldDefNum: UInt8 {
        case Timestamp = 253
        case ReferenceMesg = 0
        case ReferenceIndex = 1
        case AvgDepth = 2
        case MaxDepth = 3
        case SurfaceInterval = 4
        case StartCns = 5
        case EndCns = 6
        case StartN2 = 7
        case EndN2 = 8
        case O2Toxicity = 9
        case DiveNumber = 10
        case BottomTime = 11
    }
    
    public init() {
        super.init(mesg: Profile.getMesg(globalMesgNum: MesgNum.DiveSummary))
    }
    
    public init(_ mesg: Mesg) {
        super.init(mesg: mesg)
    }
    
    public func getTimestamp() -> FitDateTime? {
        if let val = getFieldValue(fieldNum: 253, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) as? UInt32 {
            return timestampToDate(timestamp: val)
        } else {
            return nil
        }
    }
    
    public func setTimestamp(_ timestamp: FitDateTime) {
        setFieldValue(fieldNum: 253, fieldArrayIndex: 0, value: timestamp.timeStamp, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getReferenceMesg() -> UInt16? {
        if let val = getFieldValue(fieldNum: 0, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setReferenceMesg(_ referenceMesg: UInt16) {
        setFieldValue(fieldNum: 0, fieldArrayIndex: 0, value: referenceMesg, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getReferenceIndex() -> UInt16? {
        if let val = getFieldValue(fieldNum: 1, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setReferenceIndex(_ referenceIndex: UInt16) {
        setFieldValue(fieldNum: 1, fieldArrayIndex: 0, value: referenceIndex, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getAvgDepth() -> Float32? {
        if let val = getFieldValue(fieldNum: 2, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setAvgDepth(_ avgDepth: Float32) {
        setFieldValue(fieldNum: 2, fieldArrayIndex: 0, value: avgDepth, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getMaxDepth() -> Float32? {
        if let val = getFieldValue(fieldNum: 3, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setMaxDepth(_ maxDepth: Float32) {
        setFieldValue(fieldNum: 3, fieldArrayIndex: 0, value: maxDepth, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getSurfaceInterval() -> UInt32? {
        if let val = getFieldValue(fieldNum: 4, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setSurfaceInterval(_ surfaceInterval: UInt32) {
        setFieldValue(fieldNum: 4, fieldArrayIndex: 0, value: surfaceInterval, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartCns() -> UInt8? {
        if let val = getFieldValue(fieldNum: 5, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setStartCns(_ startCns: UInt8) {
        setFieldValue(fieldNum: 5, fieldArrayIndex: 0, value: startCns, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEndCns() -> UInt8? {
        if let val = getFieldValue(fieldNum: 6, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt8
        } else {
            return nil
        }
    }
    
    public func setEndCns(_ endCns: UInt8) {
        setFieldValue(fieldNum: 6, fieldArrayIndex: 0, value: endCns, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getStartN2() -> UInt16? {
        if let val = getFieldValue(fieldNum: 7, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setStartN2(_ startN2: UInt16) {
        setFieldValue(fieldNum: 7, fieldArrayIndex: 0, value: startN2, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getEndN2() -> UInt16? {
        if let val = getFieldValue(fieldNum: 8, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setEndN2(_ endN2: UInt16) {
        setFieldValue(fieldNum: 8, fieldArrayIndex: 0, value: endN2, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getO2Toxicity() -> UInt16? {
        if let val = getFieldValue(fieldNum: 9, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt16
        } else {
            return nil
        }
    }
    
    public func setO2Toxicity(_ o2Toxicity: UInt16) {
        setFieldValue(fieldNum: 9, fieldArrayIndex: 0, value: o2Toxicity, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getDiveNumber() -> UInt32? {
        if let val = getFieldValue(fieldNum: 10, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? UInt32
        } else {
            return nil
        }
    }
    
    public func setDiveNumber(_ diveNumber: UInt32) {
        setFieldValue(fieldNum: 10, fieldArrayIndex: 0, value: diveNumber, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
    public func getBottomTime() -> Float32? {
        if let val = getFieldValue(fieldNum: 11, fieldArrayIndex: 0, subFieldIndex: Fit.subfieldIndexMainField) {
            return val as? Float32
        } else {
            return nil
        }
    }
    
    public func setBottomTime(_ bottomTime: Float32) {
        setFieldValue(fieldNum: 11, fieldArrayIndex: 0, value: bottomTime, subfieldIndex: Fit.subfieldIndexMainField)
    }
    
}
