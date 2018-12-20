
public class Profile {
    
    public enum Types {
        case Enum
        case Sint8
        case Uint8
        case Sint16
        case Uint16
        case Sint32
        case Uint32
        case String
        case Float32
        case Float64
        case Uint8z
        case Uint16z
        case Uint32z
        case Byte
        case Sint64
        case Uint64
        case Uint64z
        case Bool
        case File
        case MesgNum
        case Checksum
        case FileFlags
        case MesgCount
        case DateTime
        case LocalDateTime
        case MessageIndex
        case DeviceIndex
        case Gender
        case Language
        case LanguageBits0
        case LanguageBits1
        case LanguageBits2
        case LanguageBits3
        case LanguageBits4
        case TimeZone
        case DisplayMeasure
        case DisplayHeart
        case DisplayPower
        case DisplayPosition
        case Switch
        case Sport
        case SportBits0
        case SportBits1
        case SportBits2
        case SportBits3
        case SportBits4
        case SportBits5
        case SportBits6
        case SubSport
        case SportEvent
        case Activity
        case Intensity
        case SessionTrigger
        case AutolapTrigger
        case LapTrigger
        case TimeMode
        case BacklightMode
        case DateMode
        case BacklightTimeout
        case Event
        case EventType
        case TimerTrigger
        case FitnessEquipmentState
        case Tone
        case Autoscroll
        case ActivityClass
        case HrZoneCalc
        case PwrZoneCalc
        case WktStepDuration
        case WktStepTarget
        case Goal
        case GoalRecurrence
        case GoalSource
        case Schedule
        case CoursePoint
        case Manufacturer
        case GarminProduct
        case AntplusDeviceType
        case AntNetwork
        case WorkoutCapabilities
        case BatteryStatus
        case HrType
        case CourseCapabilities
        case Weight
        case WorkoutHr
        case WorkoutPower
        case BpStatus
        case UserLocalId
        case SwimStroke
        case ActivityType
        case ActivitySubtype
        case ActivityLevel
        case Side
        case LeftRightBalance
        case LeftRightBalance100
        case LengthType
        case DayOfWeek
        case ConnectivityCapabilities
        case WeatherReport
        case WeatherStatus
        case WeatherSeverity
        case WeatherSevereType
        case TimeIntoDay
        case LocaltimeIntoDay
        case StrokeType
        case BodyLocation
        case SegmentLapStatus
        case SegmentLeaderboardType
        case SegmentDeleteStatus
        case SegmentSelectionType
        case SourceType
        case LocalDeviceType
        case DisplayOrientation
        case WorkoutEquipment
        case WatchfaceMode
        case DigitalWatchfaceLayout
        case AnalogWatchfaceLayout
        case RiderPositionType
        case PowerPhaseType
        case CameraEventType
        case SensorType
        case BikeLightNetworkConfigType
        case CommTimeoutType
        case CameraOrientationType
        case AttitudeStage
        case AttitudeValidity
        case AutoSyncFrequency
        case ExdLayout
        case ExdDisplayType
        case ExdDataUnits
        case ExdQualifiers
        case ExdDescriptors
        case AutoActivityDetect
        case SupportedExdScreenLayouts
        case FitBaseType
        case TurnType
        case BikeLightBeamAngleMode
        case FitBaseUnit
        case SetType
        case ExerciseCategory
        case BenchPressExerciseName
        case CalfRaiseExerciseName
        case CardioExerciseName
        case CarryExerciseName
        case ChopExerciseName
        case CoreExerciseName
        case CrunchExerciseName
        case CurlExerciseName
        case DeadliftExerciseName
        case FlyeExerciseName
        case HipRaiseExerciseName
        case HipStabilityExerciseName
        case HipSwingExerciseName
        case HyperextensionExerciseName
        case LateralRaiseExerciseName
        case LegCurlExerciseName
        case LegRaiseExerciseName
        case LungeExerciseName
        case OlympicLiftExerciseName
        case PlankExerciseName
        case PlyoExerciseName
        case PullUpExerciseName
        case PushUpExerciseName
        case RowExerciseName
        case ShoulderPressExerciseName
        case ShoulderStabilityExerciseName
        case ShrugExerciseName
        case SitUpExerciseName
        case SquatExerciseName
        case TotalBodyExerciseName
        case TricepsExtensionExerciseName
        case WarmUpExerciseName
        case RunExerciseName
        case WaterType
        case TissueModelType
        case DiveGasStatus
        case DiveAlarmType
        case DiveBacklightMode

        case NumTypes
    }
    
    private static var mesgLookup: [UInt16: Mesg] = [:]
    
    public static func getMesg(globalMesgNum: UInt16) -> Mesg {
        if let mesg = lookupMesg(globalMesgNum: globalMesgNum) {
            return mesg
        } else {
            return Mesg(name: "unknown", num: globalMesgNum)
        }
    }
    
    public static func getField(globalMesgNum: UInt16, fieldNum: UInt8) -> Field? {
        if let mesg = lookupMesg(globalMesgNum: globalMesgNum) {
            return mesg.getField(fieldNum: fieldNum)
        } else {
            return Field(name: "unknown", num: fieldNum, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Enum)
        }
    }
    
    public static func getField(globalMesgNum: UInt16, fieldName: String) -> Field? {
        if let mesg = lookupMesg(globalMesgNum: globalMesgNum) {
            return mesg.getField(fieldName: fieldName)
        } else {
            return nil
        }
    }
    
    private static func lookupMesg(globalMesgNum: UInt16) -> Mesg? {
        if !mesgLookup.contains(where: { $0.key == globalMesgNum }) {
            initMesg(num: globalMesgNum)
        }
        
        if let mesg = mesgLookup[globalMesgNum] {
            return mesg
        } else {
            return nil
        }
    }
    
    private static func initMesg(num: UInt16) {
        var newMesg: Mesg? = nil
        if mesgLookup.contains(where: { $0.key == num }) {
            return
        }
        
        switch num {
        case MesgNum.FileId:
            newMesg = createFileIdMesg()
        case MesgNum.FileCreator:
            newMesg = createFileCreatorMesg()
        case MesgNum.TimestampCorrelation:
            newMesg = createTimestampCorrelationMesg()
        case MesgNum.Software:
            newMesg = createSoftwareMesg()
        case MesgNum.SlaveDevice:
            newMesg = createSlaveDeviceMesg()
        case MesgNum.Capabilities:
            newMesg = createCapabilitiesMesg()
        case MesgNum.FileCapabilities:
            newMesg = createFileCapabilitiesMesg()
        case MesgNum.MesgCapabilities:
            newMesg = createMesgCapabilitiesMesg()
        case MesgNum.FieldCapabilities:
            newMesg = createFieldCapabilitiesMesg()
        case MesgNum.DeviceSettings:
            newMesg = createDeviceSettingsMesg()
        case MesgNum.UserProfile:
            newMesg = createUserProfileMesg()
        case MesgNum.HrmProfile:
            newMesg = createHrmProfileMesg()
        case MesgNum.SdmProfile:
            newMesg = createSdmProfileMesg()
        case MesgNum.BikeProfile:
            newMesg = createBikeProfileMesg()
        case MesgNum.Connectivity:
            newMesg = createConnectivityMesg()
        case MesgNum.WatchfaceSettings:
            newMesg = createWatchfaceSettingsMesg()
        case MesgNum.OhrSettings:
            newMesg = createOhrSettingsMesg()
        case MesgNum.ZonesTarget:
            newMesg = createZonesTargetMesg()
        case MesgNum.Sport:
            newMesg = createSportMesg()
        case MesgNum.HrZone:
            newMesg = createHrZoneMesg()
        case MesgNum.SpeedZone:
            newMesg = createSpeedZoneMesg()
        case MesgNum.CadenceZone:
            newMesg = createCadenceZoneMesg()
        case MesgNum.PowerZone:
            newMesg = createPowerZoneMesg()
        case MesgNum.MetZone:
            newMesg = createMetZoneMesg()
        case MesgNum.DiveSettings:
            newMesg = createDiveSettingsMesg()
        case MesgNum.DiveAlarm:
            newMesg = createDiveAlarmMesg()
        case MesgNum.DiveGas:
            newMesg = createDiveGasMesg()
        case MesgNum.Goal:
            newMesg = createGoalMesg()
        case MesgNum.Activity:
            newMesg = createActivityMesg()
        case MesgNum.Session:
            newMesg = createSessionMesg()
        case MesgNum.Lap:
            newMesg = createLapMesg()
        case MesgNum.Length:
            newMesg = createLengthMesg()
        case MesgNum.Record:
            newMesg = createRecordMesg()
        case MesgNum.Event:
            newMesg = createEventMesg()
        case MesgNum.DeviceInfo:
            newMesg = createDeviceInfoMesg()
        case MesgNum.TrainingFile:
            newMesg = createTrainingFileMesg()
        case MesgNum.Hrv:
            newMesg = createHrvMesg()
        case MesgNum.WeatherConditions:
            newMesg = createWeatherConditionsMesg()
        case MesgNum.WeatherAlert:
            newMesg = createWeatherAlertMesg()
        case MesgNum.GpsMetadata:
            newMesg = createGpsMetadataMesg()
        case MesgNum.CameraEvent:
            newMesg = createCameraEventMesg()
        case MesgNum.GyroscopeData:
            newMesg = createGyroscopeDataMesg()
        case MesgNum.AccelerometerData:
            newMesg = createAccelerometerDataMesg()
        case MesgNum.MagnetometerData:
            newMesg = createMagnetometerDataMesg()
        case MesgNum.BarometerData:
            newMesg = createBarometerDataMesg()
        case MesgNum.ThreeDSensorCalibration:
            newMesg = createThreeDSensorCalibrationMesg()
        case MesgNum.OneDSensorCalibration:
            newMesg = createOneDSensorCalibrationMesg()
        case MesgNum.VideoFrame:
            newMesg = createVideoFrameMesg()
        case MesgNum.ObdiiData:
            newMesg = createObdiiDataMesg()
        case MesgNum.NmeaSentence:
            newMesg = createNmeaSentenceMesg()
        case MesgNum.AviationAttitude:
            newMesg = createAviationAttitudeMesg()
        case MesgNum.Video:
            newMesg = createVideoMesg()
        case MesgNum.VideoTitle:
            newMesg = createVideoTitleMesg()
        case MesgNum.VideoDescription:
            newMesg = createVideoDescriptionMesg()
        case MesgNum.VideoClip:
            newMesg = createVideoClipMesg()
        case MesgNum.Set:
            newMesg = createSetMesg()
        case MesgNum.Course:
            newMesg = createCourseMesg()
        case MesgNum.CoursePoint:
            newMesg = createCoursePointMesg()
        case MesgNum.SegmentId:
            newMesg = createSegmentIdMesg()
        case MesgNum.SegmentLeaderboardEntry:
            newMesg = createSegmentLeaderboardEntryMesg()
        case MesgNum.SegmentPoint:
            newMesg = createSegmentPointMesg()
        case MesgNum.SegmentLap:
            newMesg = createSegmentLapMesg()
        case MesgNum.SegmentFile:
            newMesg = createSegmentFileMesg()
        case MesgNum.Workout:
            newMesg = createWorkoutMesg()
        case MesgNum.WorkoutSession:
            newMesg = createWorkoutSessionMesg()
        case MesgNum.WorkoutStep:
            newMesg = createWorkoutStepMesg()
        case MesgNum.ExerciseTitle:
            newMesg = createExerciseTitleMesg()
        case MesgNum.Schedule:
            newMesg = createScheduleMesg()
        case MesgNum.Totals:
            newMesg = createTotalsMesg()
        case MesgNum.WeightScale:
            newMesg = createWeightScaleMesg()
        case MesgNum.BloodPressure:
            newMesg = createBloodPressureMesg()
        case MesgNum.MonitoringInfo:
            newMesg = createMonitoringInfoMesg()
        case MesgNum.Monitoring:
            newMesg = createMonitoringMesg()
        case MesgNum.Hr:
            newMesg = createHrMesg()
        case MesgNum.StressLevel:
            newMesg = createStressLevelMesg()
        case MesgNum.MemoGlob:
            newMesg = createMemoGlobMesg()
        case MesgNum.AntChannelId:
            newMesg = createAntChannelIdMesg()
        case MesgNum.AntRx:
            newMesg = createAntRxMesg()
        case MesgNum.AntTx:
            newMesg = createAntTxMesg()
        case MesgNum.ExdScreenConfiguration:
            newMesg = createExdScreenConfigurationMesg()
        case MesgNum.ExdDataFieldConfiguration:
            newMesg = createExdDataFieldConfigurationMesg()
        case MesgNum.ExdDataConceptConfiguration:
            newMesg = createExdDataConceptConfigurationMesg()
        case MesgNum.FieldDescription:
            newMesg = createFieldDescriptionMesg()
        case MesgNum.DeveloperDataId:
            newMesg = createDeveloperDataIdMesg()
        case MesgNum.DiveSummary:
            newMesg = createDiveSummaryMesg()
        case MesgNum.Pad:
            newMesg = createPadMesg()

        default:
            break
        }
        
        if let newMesg = newMesg {
            objc_sync_enter(mesgLookup.self)
            if !mesgLookup.contains(where: { $0.key == num }) {
                mesgLookup.updateValue(newMesg, forKey: num)
            }
            objc_sync_exit(mesgLookup.self)
        }
    }
    
    private static func createFileIdMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "FileId", num: MesgNum.FileId)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Type", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.File))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Manufacturer", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Manufacturer))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Product", num: 2, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "GarminProduct", type: 132, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 15)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 13)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SerialNumber", num: 3, type: 140, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeCreated", num: 4, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Number", num: 5, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ProductName", num: 8, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createFileCreatorMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "FileCreator", num: MesgNum.FileCreator)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "SoftwareVersion", num: 0, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HardwareVersion", num: 1, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createTimestampCorrelationMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "TimestampCorrelation", num: MesgNum.TimestampCorrelation)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FractionalTimestamp", num: 0, type: 132, scale: 32768, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SystemTimestamp", num: 1, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FractionalSystemTimestamp", num: 2, type: 132, scale: 32768, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LocalTimestamp", num: 3, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.LocalDateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 4, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SystemTimestampMs", num: 5, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSoftwareMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Software", num: MesgNum.Software)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Version", num: 3, type: 132, scale: 100, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PartNumber", num: 5, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSlaveDeviceMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "SlaveDevice", num: MesgNum.SlaveDevice)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Manufacturer", num: 0, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Manufacturer))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Product", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "GarminProduct", type: 132, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 15)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 13)
        subfieldIndex += 1
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createCapabilitiesMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Capabilities", num: MesgNum.Capabilities)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Languages", num: 0, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sports", num: 1, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SportBits0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WorkoutsSupported", num: 21, type: 140, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WorkoutCapabilities))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ConnectivitySupported", num: 23, type: 140, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ConnectivityCapabilities))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createFileCapabilitiesMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "FileCapabilities", num: MesgNum.FileCapabilities)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Type", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.File))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Flags", num: 1, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.FileFlags))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Directory", num: 2, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxCount", num: 3, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxSize", num: 4, type: 134, scale: 1, offset: 0, units: "bytes", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createMesgCapabilitiesMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "MesgCapabilities", num: MesgNum.MesgCapabilities)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "File", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.File))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MesgNum", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MesgNum))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CountType", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MesgCount))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Count", num: 3, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "NumPerFile", type: 132, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 2, refFieldValue: 0)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 2, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 2, refFieldValue: 2)
        subfieldIndex += 1
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createFieldCapabilitiesMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "FieldCapabilities", num: MesgNum.FieldCapabilities)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "File", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.File))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MesgNum", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MesgNum))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FieldNum", num: 2, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Count", num: 3, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createDeviceSettingsMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "DeviceSettings", num: MesgNum.DeviceSettings)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "ActiveTimeZone", num: 0, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "UtcOffset", num: 1, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeOffset", num: 2, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeMode", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.TimeMode))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeZoneOffset", num: 5, type: 1, scale: 4, offset: 0, units: "hr", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BacklightMode", num: 12, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.BacklightMode))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityTrackerEnabled", num: 36, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ClockTime", num: 39, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PagesEnabled", num: 40, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MoveAlertEnabled", num: 46, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DateMode", num: 47, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateMode))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DisplayOrientation", num: 55, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayOrientation))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MountingSide", num: 56, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Side))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DefaultPage", num: 57, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AutosyncMinSteps", num: 58, type: 132, scale: 1, offset: 0, units: "steps", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AutosyncMinTime", num: 59, type: 132, scale: 1, offset: 0, units: "minutes", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LactateThresholdAutodetectEnabled", num: 80, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BleAutoUploadEnabled", num: 86, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AutoSyncFrequency", num: 89, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.AutoSyncFrequency))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AutoActivityDetect", num: 90, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.AutoActivityDetect))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NumberOfScreens", num: 94, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SmartNotificationDisplayOrientation", num: 95, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayOrientation))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TapInterface", num: 134, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Switch))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createUserProfileMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "UserProfile", num: MesgNum.UserProfile)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FriendlyName", num: 0, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Gender", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Gender))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Age", num: 2, type: 2, scale: 1, offset: 0, units: "years", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Height", num: 3, type: 2, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Weight", num: 4, type: 132, scale: 10, offset: 0, units: "kg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Language", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Language))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ElevSetting", num: 6, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WeightSetting", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RestingHeartRate", num: 8, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DefaultMaxRunningHeartRate", num: 9, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DefaultMaxBikingHeartRate", num: 10, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DefaultMaxHeartRate", num: 11, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HrSetting", num: 12, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayHeart))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SpeedSetting", num: 13, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DistSetting", num: 14, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PowerSetting", num: 16, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayPower))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityClass", num: 17, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ActivityClass))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionSetting", num: 18, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayPosition))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TemperatureSetting", num: 21, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LocalId", num: 22, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.UserLocalId))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GlobalId", num: 23, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WakeTime", num: 28, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LocaltimeIntoDay))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SleepTime", num: 29, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LocaltimeIntoDay))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HeightSetting", num: 30, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "UserRunningStepLength", num: 31, type: 132, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "UserWalkingStepLength", num: 32, type: 132, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DepthSetting", num: 47, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DiveCount", num: 49, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createHrmProfileMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "HrmProfile", num: MesgNum.HrmProfile)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Enabled", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HrmAntId", num: 1, type: 139, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LogHrv", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HrmAntIdTransType", num: 3, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSdmProfileMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "SdmProfile", num: MesgNum.SdmProfile)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Enabled", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SdmAntId", num: 1, type: 139, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SdmCalFactor", num: 2, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Odometer", num: 3, type: 134, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SpeedSource", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SdmAntIdTransType", num: 5, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OdometerRollover", num: 7, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createBikeProfileMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "BikeProfile", num: MesgNum.BikeProfile)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 0, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sport", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Odometer", num: 3, type: 134, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikeSpdAntId", num: 4, type: 139, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikeCadAntId", num: 5, type: 139, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikeSpdcadAntId", num: 6, type: 139, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikePowerAntId", num: 7, type: 139, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CustomWheelsize", num: 8, type: 132, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AutoWheelsize", num: 9, type: 132, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikeWeight", num: 10, type: 132, scale: 10, offset: 0, units: "kg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PowerCalFactor", num: 11, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AutoWheelCal", num: 12, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AutoPowerZero", num: 13, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Id", num: 14, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SpdEnabled", num: 15, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CadEnabled", num: 16, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SpdcadEnabled", num: 17, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PowerEnabled", num: 18, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CrankLength", num: 19, type: 2, scale: 2, offset: -110, units: "mm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Enabled", num: 20, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikeSpdAntIdTransType", num: 21, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikeCadAntIdTransType", num: 22, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikeSpdcadAntIdTransType", num: 23, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BikePowerAntIdTransType", num: 24, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OdometerRollover", num: 37, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FrontGearNum", num: 38, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FrontGear", num: 39, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RearGearNum", num: 40, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RearGear", num: 41, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ShimanoDi2Enabled", num: 44, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createConnectivityMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Connectivity", num: MesgNum.Connectivity)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "BluetoothEnabled", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BluetoothLeEnabled", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AntEnabled", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 3, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LiveTrackingEnabled", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WeatherConditionsEnabled", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WeatherAlertsEnabled", num: 6, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AutoActivityUploadEnabled", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CourseDownloadEnabled", num: 8, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WorkoutDownloadEnabled", num: 9, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GpsEphemerisDownloadEnabled", num: 10, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "IncidentDetectionEnabled", num: 11, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GrouptrackEnabled", num: 12, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createWatchfaceSettingsMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "WatchfaceSettings", num: MesgNum.WatchfaceSettings)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Mode", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WatchfaceMode))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Layout", num: 1, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "DigitalLayout", type: 0, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 0)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 1)
        subfieldIndex += 1
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createOhrSettingsMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "OhrSettings", num: MesgNum.OhrSettings)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Enabled", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Switch))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createZonesTargetMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "ZonesTarget", num: MesgNum.ZonesTarget)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MaxHeartRate", num: 1, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ThresholdHeartRate", num: 2, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FunctionalThresholdPower", num: 3, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HrCalcType", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.HrZoneCalc))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PwrCalcType", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.PwrZoneCalc))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSportMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Sport", num: MesgNum.Sport)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Sport", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 3, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createHrZoneMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "HrZone", num: MesgNum.HrZone)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HighBpm", num: 1, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 2, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSpeedZoneMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "SpeedZone", num: MesgNum.SpeedZone)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HighValue", num: 0, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 1, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createCadenceZoneMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "CadenceZone", num: MesgNum.CadenceZone)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HighValue", num: 0, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 1, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createPowerZoneMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "PowerZone", num: MesgNum.PowerZone)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HighValue", num: 1, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 2, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createMetZoneMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "MetZone", num: MesgNum.MetZone)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HighBpm", num: 1, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Calories", num: 2, type: 132, scale: 10, offset: 0, units: "kcal/min", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FatCalories", num: 3, type: 2, scale: 10, offset: 0, units: "kcal/min", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createDiveSettingsMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "DiveSettings", num: MesgNum.DiveSettings)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 0, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Model", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.TissueModelType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GfLow", num: 2, type: 2, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GfHigh", num: 3, type: 2, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WaterType", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WaterType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WaterDensity", num: 5, type: 136, scale: 1, offset: 0, units: "kg/m^3", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Po2Warn", num: 6, type: 2, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Po2Critical", num: 7, type: 2, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Po2Deco", num: 8, type: 2, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SafetyStopEnabled", num: 9, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BottomDepth", num: 10, type: 136, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BottomTime", num: 11, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ApneaCountdownEnabled", num: 12, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ApneaCountdownTime", num: 13, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BacklightMode", num: 14, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DiveBacklightMode))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BacklightBrightness", num: 15, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BacklightTimeout", num: 16, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.BacklightTimeout))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RepeatDiveInterval", num: 17, type: 132, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SafetyStopTime", num: 18, type: 132, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HeartRateSourceType", num: 19, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SourceType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HeartRateSource", num: 20, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "HeartRateAntplusDeviceType", type: 2, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 19, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 19, refFieldValue: 5)
        subfieldIndex += 1
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createDiveAlarmMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "DiveAlarm", num: MesgNum.DiveAlarm)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Depth", num: 0, type: 134, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Time", num: 1, type: 133, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Enabled", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AlarmType", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DiveAlarmType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sound", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Tone))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DiveTypes", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createDiveGasMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "DiveGas", num: MesgNum.DiveGas)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HeliumContent", num: 0, type: 2, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OxygenContent", num: 1, type: 2, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Status", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DiveGasStatus))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createGoalMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Goal", num: MesgNum.Goal)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sport", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartDate", num: 2, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndDate", num: 3, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Type", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Goal))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Value", num: 5, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Repeat", num: 6, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TargetValue", num: 7, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Recurrence", num: 8, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.GoalRecurrence))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RecurrenceValue", num: 9, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Enabled", num: 10, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Source", num: 11, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.GoalSource))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createActivityMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Activity", num: MesgNum.Activity)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalTimerTime", num: 0, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NumSessions", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Type", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Activity))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Event", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Event))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventType", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.EventType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LocalTimestamp", num: 5, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LocalDateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventGroup", num: 6, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSessionMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "Session", num: MesgNum.Session)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Event", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Event))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventType", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.EventType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTime", num: 2, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartPositionLat", num: 3, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartPositionLong", num: 4, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sport", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 6, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalElapsedTime", num: 7, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalTimerTime", num: 8, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalDistance", num: 9, type: 134, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalCycles", num: 10, type: 134, scale: 1, offset: 0, units: "cycles", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "TotalStrides", type: 134, scale: 1, offset: 0, units: "strides"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 5, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 5, refFieldValue: 11)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalCalories", num: 11, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalFatCalories", num: 13, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgSpeed", num: 14, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 124, accumulate: false, bits: 16, scale: 1000, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxSpeed", num: 15, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 125, accumulate: false, bits: 16, scale: 1000, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgHeartRate", num: 16, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxHeartRate", num: 17, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCadence", num: 18, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "AvgRunningCadence", type: 2, scale: 1, offset: 0, units: "strides/min"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 5, refFieldValue: 1)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxCadence", num: 19, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "MaxRunningCadence", type: 2, scale: 1, offset: 0, units: "strides/min"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 5, refFieldValue: 1)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPower", num: 20, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPower", num: 21, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalAscent", num: 22, type: 132, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalDescent", num: 23, type: 132, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalTrainingEffect", num: 24, type: 2, scale: 10, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FirstLapIndex", num: 25, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NumLaps", num: 26, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventGroup", num: 27, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Trigger", num: 28, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SessionTrigger))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NecLat", num: 29, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NecLong", num: 30, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SwcLat", num: 31, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SwcLong", num: 32, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NormalizedPower", num: 34, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TrainingStressScore", num: 35, type: 132, scale: 10, offset: 0, units: "tss", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "IntensityFactor", num: 36, type: 132, scale: 1000, offset: 0, units: "if", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftRightBalance", num: 37, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LeftRightBalance100))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStrokeCount", num: 41, type: 134, scale: 10, offset: 0, units: "strokes/lap", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStrokeDistance", num: 42, type: 132, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SwimStroke", num: 43, type: 0, scale: 1, offset: 0, units: "swim_stroke", accumulated: false, profileType: Types.SwimStroke))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PoolLength", num: 44, type: 132, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ThresholdPower", num: 45, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PoolLengthUnit", num: 46, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NumActiveLengths", num: 47, type: 132, scale: 1, offset: 0, units: "lengths", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalWork", num: 48, type: 134, scale: 1, offset: 0, units: "J", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgAltitude", num: 49, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 126, accumulate: false, bits: 16, scale: 5, offset: 500))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxAltitude", num: 50, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 128, accumulate: false, bits: 16, scale: 5, offset: 500))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GpsAccuracy", num: 51, type: 2, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgGrade", num: 52, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPosGrade", num: 53, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgNegGrade", num: 54, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPosGrade", num: 55, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxNegGrade", num: 56, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgTemperature", num: 57, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxTemperature", num: 58, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalMovingTime", num: 59, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPosVerticalSpeed", num: 60, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgNegVerticalSpeed", num: 61, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPosVerticalSpeed", num: 62, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxNegVerticalSpeed", num: 63, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinHeartRate", num: 64, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInHrZone", num: 65, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInSpeedZone", num: 66, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInCadenceZone", num: 67, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInPowerZone", num: 68, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLapTime", num: 69, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BestLapIndex", num: 70, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinAltitude", num: 71, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 127, accumulate: false, bits: 16, scale: 5, offset: 500))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PlayerScore", num: 82, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OpponentScore", num: 83, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OpponentName", num: 84, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StrokeCount", num: 85, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ZoneCount", num: 86, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxBallSpeed", num: 87, type: 132, scale: 100, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgBallSpeed", num: 88, type: 132, scale: 100, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgVerticalOscillation", num: 89, type: 132, scale: 10, offset: 0, units: "mm", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStanceTimePercent", num: 90, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStanceTime", num: 91, type: 132, scale: 10, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgFractionalCadence", num: 92, type: 2, scale: 128, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxFractionalCadence", num: 93, type: 2, scale: 128, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalFractionalCycles", num: 94, type: 2, scale: 128, offset: 0, units: "cycles", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgTotalHemoglobinConc", num: 95, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinTotalHemoglobinConc", num: 96, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxTotalHemoglobinConc", num: 97, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgSaturatedHemoglobinPercent", num: 98, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinSaturatedHemoglobinPercent", num: 99, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxSaturatedHemoglobinPercent", num: 100, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftTorqueEffectiveness", num: 101, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightTorqueEffectiveness", num: 102, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPedalSmoothness", num: 103, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPedalSmoothness", num: 104, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCombinedPedalSmoothness", num: 105, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SportIndex", num: 111, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeStanding", num: 112, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StandCount", num: 113, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPco", num: 114, type: 1, scale: 1, offset: 0, units: "mm", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPco", num: 115, type: 1, scale: 1, offset: 0, units: "mm", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPowerPhase", num: 116, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPowerPhasePeak", num: 117, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPowerPhase", num: 118, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPowerPhasePeak", num: 119, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPowerPosition", num: 120, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPowerPosition", num: 121, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCadencePosition", num: 122, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxCadencePosition", num: 123, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedAvgSpeed", num: 124, type: 134, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedMaxSpeed", num: 125, type: 134, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedAvgAltitude", num: 126, type: 134, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedMinAltitude", num: 127, type: 134, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedMaxAltitude", num: 128, type: 134, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLevMotorPower", num: 129, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxLevMotorPower", num: 130, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LevBatteryConsumption", num: 131, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgVerticalRatio", num: 132, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStanceTimeBalance", num: 133, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStepLength", num: 134, type: 132, scale: 10, offset: 0, units: "mm", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalAnaerobicTrainingEffect", num: 137, type: 2, scale: 10, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgVam", num: 139, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createLapMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "Lap", num: MesgNum.Lap)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Event", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Event))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventType", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.EventType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTime", num: 2, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartPositionLat", num: 3, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartPositionLong", num: 4, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndPositionLat", num: 5, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndPositionLong", num: 6, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalElapsedTime", num: 7, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalTimerTime", num: 8, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalDistance", num: 9, type: 134, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalCycles", num: 10, type: 134, scale: 1, offset: 0, units: "cycles", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "TotalStrides", type: 134, scale: 1, offset: 0, units: "strides"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 25, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 25, refFieldValue: 11)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalCalories", num: 11, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalFatCalories", num: 12, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgSpeed", num: 13, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 110, accumulate: false, bits: 16, scale: 1000, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxSpeed", num: 14, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 111, accumulate: false, bits: 16, scale: 1000, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgHeartRate", num: 15, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxHeartRate", num: 16, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCadence", num: 17, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "AvgRunningCadence", type: 2, scale: 1, offset: 0, units: "strides/min"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 25, refFieldValue: 1)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxCadence", num: 18, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "MaxRunningCadence", type: 2, scale: 1, offset: 0, units: "strides/min"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 25, refFieldValue: 1)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPower", num: 19, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPower", num: 20, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalAscent", num: 21, type: 132, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalDescent", num: 22, type: 132, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Intensity", num: 23, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Intensity))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LapTrigger", num: 24, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LapTrigger))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sport", num: 25, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventGroup", num: 26, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NumLengths", num: 32, type: 132, scale: 1, offset: 0, units: "lengths", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NormalizedPower", num: 33, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftRightBalance", num: 34, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LeftRightBalance100))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FirstLengthIndex", num: 35, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStrokeDistance", num: 37, type: 132, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SwimStroke", num: 38, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SwimStroke))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 39, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NumActiveLengths", num: 40, type: 132, scale: 1, offset: 0, units: "lengths", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalWork", num: 41, type: 134, scale: 1, offset: 0, units: "J", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgAltitude", num: 42, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 112, accumulate: false, bits: 16, scale: 5, offset: 500))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxAltitude", num: 43, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 114, accumulate: false, bits: 16, scale: 5, offset: 500))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GpsAccuracy", num: 44, type: 2, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgGrade", num: 45, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPosGrade", num: 46, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgNegGrade", num: 47, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPosGrade", num: 48, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxNegGrade", num: 49, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgTemperature", num: 50, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxTemperature", num: 51, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalMovingTime", num: 52, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPosVerticalSpeed", num: 53, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgNegVerticalSpeed", num: 54, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPosVerticalSpeed", num: 55, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxNegVerticalSpeed", num: 56, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInHrZone", num: 57, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInSpeedZone", num: 58, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInCadenceZone", num: 59, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInPowerZone", num: 60, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RepetitionNum", num: 61, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinAltitude", num: 62, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 113, accumulate: false, bits: 16, scale: 5, offset: 500))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinHeartRate", num: 63, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WktStepIndex", num: 71, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OpponentScore", num: 74, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StrokeCount", num: 75, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ZoneCount", num: 76, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgVerticalOscillation", num: 77, type: 132, scale: 10, offset: 0, units: "mm", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStanceTimePercent", num: 78, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStanceTime", num: 79, type: 132, scale: 10, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgFractionalCadence", num: 80, type: 2, scale: 128, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxFractionalCadence", num: 81, type: 2, scale: 128, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalFractionalCycles", num: 82, type: 2, scale: 128, offset: 0, units: "cycles", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PlayerScore", num: 83, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgTotalHemoglobinConc", num: 84, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinTotalHemoglobinConc", num: 85, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxTotalHemoglobinConc", num: 86, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgSaturatedHemoglobinPercent", num: 87, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinSaturatedHemoglobinPercent", num: 88, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxSaturatedHemoglobinPercent", num: 89, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftTorqueEffectiveness", num: 91, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightTorqueEffectiveness", num: 92, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPedalSmoothness", num: 93, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPedalSmoothness", num: 94, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCombinedPedalSmoothness", num: 95, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeStanding", num: 98, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StandCount", num: 99, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPco", num: 100, type: 1, scale: 1, offset: 0, units: "mm", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPco", num: 101, type: 1, scale: 1, offset: 0, units: "mm", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPowerPhase", num: 102, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPowerPhasePeak", num: 103, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPowerPhase", num: 104, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPowerPhasePeak", num: 105, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPowerPosition", num: 106, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPowerPosition", num: 107, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCadencePosition", num: 108, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxCadencePosition", num: 109, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedAvgSpeed", num: 110, type: 134, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedMaxSpeed", num: 111, type: 134, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedAvgAltitude", num: 112, type: 134, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedMinAltitude", num: 113, type: 134, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedMaxAltitude", num: 114, type: 134, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLevMotorPower", num: 115, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxLevMotorPower", num: 116, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LevBatteryConsumption", num: 117, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgVerticalRatio", num: 118, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStanceTimeBalance", num: 119, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgStepLength", num: 120, type: 132, scale: 10, offset: 0, units: "mm", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgVam", num: 121, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createLengthMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Length", num: MesgNum.Length)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Event", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Event))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventType", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.EventType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTime", num: 2, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalElapsedTime", num: 3, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalTimerTime", num: 4, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalStrokes", num: 5, type: 132, scale: 1, offset: 0, units: "strokes", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgSpeed", num: 6, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SwimStroke", num: 7, type: 0, scale: 1, offset: 0, units: "swim_stroke", accumulated: false, profileType: Types.SwimStroke))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgSwimmingCadence", num: 9, type: 2, scale: 1, offset: 0, units: "strokes/min", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventGroup", num: 10, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalCalories", num: 11, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LengthType", num: 12, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LengthType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PlayerScore", num: 18, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OpponentScore", num: 19, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StrokeCount", num: 20, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ZoneCount", num: 21, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createRecordMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Record", num: MesgNum.Record)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionLat", num: 0, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionLong", num: 1, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Altitude", num: 2, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 78, accumulate: false, bits: 16, scale: 5, offset: 500))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HeartRate", num: 3, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Cadence", num: 4, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Distance", num: 5, type: 134, scale: 100, offset: 0, units: "m", accumulated: true, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Speed", num: 6, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 73, accumulate: false, bits: 16, scale: 1000, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Power", num: 7, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CompressedSpeedDistance", num: 8, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 6, accumulate: false, bits: 12, scale: 100, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 5, accumulate: true, bits: 12, scale: 16, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Grade", num: 9, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Resistance", num: 10, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeFromCourse", num: 11, type: 133, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CycleLength", num: 12, type: 2, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Temperature", num: 13, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Speed1s", num: 17, type: 2, scale: 16, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Cycles", num: 18, type: 2, scale: 1, offset: 0, units: "cycles", accumulated: false, profileType: Types.Uint8))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 19, accumulate: true, bits: 8, scale: 1, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalCycles", num: 19, type: 134, scale: 1, offset: 0, units: "cycles", accumulated: true, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CompressedAccumulatedPower", num: 28, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 29, accumulate: true, bits: 16, scale: 1, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AccumulatedPower", num: 29, type: 134, scale: 1, offset: 0, units: "watts", accumulated: true, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftRightBalance", num: 30, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LeftRightBalance))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GpsAccuracy", num: 31, type: 2, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "VerticalSpeed", num: 32, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Calories", num: 33, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "VerticalOscillation", num: 39, type: 132, scale: 10, offset: 0, units: "mm", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StanceTimePercent", num: 40, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StanceTime", num: 41, type: 132, scale: 10, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityType", num: 42, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ActivityType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftTorqueEffectiveness", num: 43, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RightTorqueEffectiveness", num: 44, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftPedalSmoothness", num: 45, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RightPedalSmoothness", num: 46, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CombinedPedalSmoothness", num: 47, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Time128", num: 48, type: 2, scale: 128, offset: 0, units: "s", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StrokeType", num: 49, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.StrokeType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Zone", num: 50, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BallSpeed", num: 51, type: 132, scale: 100, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Cadence256", num: 52, type: 132, scale: 256, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FractionalCadence", num: 53, type: 2, scale: 128, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalHemoglobinConc", num: 54, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalHemoglobinConcMin", num: 55, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalHemoglobinConcMax", num: 56, type: 132, scale: 100, offset: 0, units: "g/dL", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SaturatedHemoglobinPercent", num: 57, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SaturatedHemoglobinPercentMin", num: 58, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SaturatedHemoglobinPercentMax", num: 59, type: 132, scale: 10, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceIndex", num: 62, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DeviceIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftPco", num: 67, type: 1, scale: 1, offset: 0, units: "mm", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RightPco", num: 68, type: 1, scale: 1, offset: 0, units: "mm", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftPowerPhase", num: 69, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftPowerPhasePeak", num: 70, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RightPowerPhase", num: 71, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RightPowerPhasePeak", num: 72, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedSpeed", num: 73, type: 134, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedAltitude", num: 78, type: 134, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BatterySoc", num: 81, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MotorPower", num: 82, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "VerticalRatio", num: 83, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StanceTimeBalance", num: 84, type: 132, scale: 100, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StepLength", num: 85, type: 132, scale: 10, offset: 0, units: "mm", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AbsolutePressure", num: 91, type: 134, scale: 1, offset: 0, units: "Pa", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Depth", num: 92, type: 134, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NextStopDepth", num: 93, type: 134, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NextStopTime", num: 94, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeToSurface", num: 95, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NdlTime", num: 96, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CnsLoad", num: 97, type: 2, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "N2Load", num: 98, type: 132, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createEventMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "Event", num: MesgNum.Event)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Event", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Event))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventType", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.EventType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Data16", num: 2, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 3, accumulate: false, bits: 16, scale: 1, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Data", num: 3, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "TimerTrigger", type: 0, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 0)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 10)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 11)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 12)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 13)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 14)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 15)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 16)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 17)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 18)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 19)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 20)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 23)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 24)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 25)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 27)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 33)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 42)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 43)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 44)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 47)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventGroup", num: 4, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Score", num: 7, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OpponentScore", num: 8, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FrontGearNum", num: 9, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FrontGear", num: 10, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RearGearNum", num: 11, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RearGear", num: 12, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceIndex", num: 13, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DeviceIndex))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createDeviceInfoMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "DeviceInfo", num: MesgNum.DeviceInfo)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceIndex", num: 0, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DeviceIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceType", num: 1, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "AntplusDeviceType", type: 2, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 25, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 25, refFieldValue: 0)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Manufacturer", num: 2, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Manufacturer))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SerialNumber", num: 3, type: 140, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Product", num: 4, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "GarminProduct", type: 132, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 2, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 2, refFieldValue: 15)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 2, refFieldValue: 13)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SoftwareVersion", num: 5, type: 132, scale: 100, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HardwareVersion", num: 6, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CumOperatingTime", num: 7, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BatteryVoltage", num: 10, type: 132, scale: 256, offset: 0, units: "V", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BatteryStatus", num: 11, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.BatteryStatus))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SensorPosition", num: 18, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.BodyLocation))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Descriptor", num: 19, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AntTransmissionType", num: 20, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AntDeviceNumber", num: 21, type: 139, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AntNetwork", num: 22, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.AntNetwork))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SourceType", num: 25, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SourceType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ProductName", num: 27, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createTrainingFileMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "TrainingFile", num: MesgNum.TrainingFile)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Type", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.File))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Manufacturer", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Manufacturer))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Product", num: 2, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "GarminProduct", type: 132, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 15)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 13)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SerialNumber", num: 3, type: 140, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeCreated", num: 4, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createHrvMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Hrv", num: MesgNum.Hrv)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Time", num: 0, type: 132, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createWeatherConditionsMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "WeatherConditions", num: MesgNum.WeatherConditions)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WeatherReport", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WeatherReport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Temperature", num: 1, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Condition", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WeatherStatus))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WindDirection", num: 3, type: 132, scale: 1, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WindSpeed", num: 4, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PrecipitationProbability", num: 5, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TemperatureFeelsLike", num: 6, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RelativeHumidity", num: 7, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Location", num: 8, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ObservedAtTime", num: 9, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ObservedLocationLat", num: 10, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ObservedLocationLong", num: 11, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DayOfWeek", num: 12, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DayOfWeek))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HighTemperature", num: 13, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LowTemperature", num: 14, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createWeatherAlertMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "WeatherAlert", num: MesgNum.WeatherAlert)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ReportId", num: 0, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "IssueTime", num: 1, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ExpireTime", num: 2, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Severity", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WeatherSeverity))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Type", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WeatherSevereType))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createGpsMetadataMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "GpsMetadata", num: MesgNum.GpsMetadata)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionLat", num: 1, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionLong", num: 2, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedAltitude", num: 3, type: 134, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EnhancedSpeed", num: 4, type: 134, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Heading", num: 5, type: 132, scale: 100, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "UtcTimestamp", num: 6, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Velocity", num: 7, type: 131, scale: 100, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createCameraEventMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "CameraEvent", num: MesgNum.CameraEvent)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CameraEventType", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.CameraEventType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CameraFileUuid", num: 2, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CameraOrientation", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.CameraOrientationType))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createGyroscopeDataMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "GyroscopeData", num: MesgNum.GyroscopeData)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SampleTimeOffset", num: 1, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GyroX", num: 2, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GyroY", num: 3, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GyroZ", num: 4, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedGyroX", num: 5, type: 136, scale: 1, offset: 0, units: "deg/s", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedGyroY", num: 6, type: 136, scale: 1, offset: 0, units: "deg/s", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedGyroZ", num: 7, type: 136, scale: 1, offset: 0, units: "deg/s", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createAccelerometerDataMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "AccelerometerData", num: MesgNum.AccelerometerData)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SampleTimeOffset", num: 1, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AccelX", num: 2, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AccelY", num: 3, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AccelZ", num: 4, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedAccelX", num: 5, type: 136, scale: 1, offset: 0, units: "g", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedAccelY", num: 6, type: 136, scale: 1, offset: 0, units: "g", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedAccelZ", num: 7, type: 136, scale: 1, offset: 0, units: "g", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CompressedCalibratedAccelX", num: 8, type: 131, scale: 1, offset: 0, units: "mG", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CompressedCalibratedAccelY", num: 9, type: 131, scale: 1, offset: 0, units: "mG", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CompressedCalibratedAccelZ", num: 10, type: 131, scale: 1, offset: 0, units: "mG", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createMagnetometerDataMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "MagnetometerData", num: MesgNum.MagnetometerData)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SampleTimeOffset", num: 1, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MagX", num: 2, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MagY", num: 3, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MagZ", num: 4, type: 132, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedMagX", num: 5, type: 136, scale: 1, offset: 0, units: "G", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedMagY", num: 6, type: 136, scale: 1, offset: 0, units: "G", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibratedMagZ", num: 7, type: 136, scale: 1, offset: 0, units: "G", accumulated: false, profileType: Types.Float32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createBarometerDataMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "BarometerData", num: MesgNum.BarometerData)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SampleTimeOffset", num: 1, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BaroPres", num: 2, type: 134, scale: 1, offset: 0, units: "Pa", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createThreeDSensorCalibrationMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "ThreeDSensorCalibration", num: MesgNum.ThreeDSensorCalibration)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SensorType", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SensorType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibrationFactor", num: 1, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "AccelCalFactor", type: 134, scale: 1, offset: 0, units: "g"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 0)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 1)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibrationDivisor", num: 2, type: 134, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LevelShift", num: 3, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OffsetCal", num: 4, type: 133, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OrientationMatrix", num: 5, type: 133, scale: 65535, offset: 0, units: "", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createOneDSensorCalibrationMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "OneDSensorCalibration", num: MesgNum.OneDSensorCalibration)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SensorType", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SensorType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibrationFactor", num: 1, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "BaroCalFactor", type: 134, scale: 1, offset: 0, units: "Pa"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 3)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CalibrationDivisor", num: 2, type: 134, scale: 1, offset: 0, units: "counts", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LevelShift", num: 3, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "OffsetCal", num: 4, type: 133, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createVideoFrameMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "VideoFrame", num: MesgNum.VideoFrame)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FrameNumber", num: 1, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createObdiiDataMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "ObdiiData", num: MesgNum.ObdiiData)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeOffset", num: 1, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Pid", num: 2, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RawData", num: 3, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PidDataSize", num: 4, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SystemTime", num: 5, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTimestamp", num: 6, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTimestampMs", num: 7, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createNmeaSentenceMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "NmeaSentence", num: MesgNum.NmeaSentence)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sentence", num: 1, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createAviationAttitudeMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "AviationAttitude", num: MesgNum.AviationAttitude)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMs", num: 0, type: 132, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SystemTime", num: 1, type: 134, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Pitch", num: 2, type: 131, scale: 10430.38, offset: 0, units: "radians", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Roll", num: 3, type: 131, scale: 10430.38, offset: 0, units: "radians", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AccelLateral", num: 4, type: 131, scale: 100, offset: 0, units: "m/s^2", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AccelNormal", num: 5, type: 131, scale: 100, offset: 0, units: "m/s^2", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TurnRate", num: 6, type: 131, scale: 1024, offset: 0, units: "radians/second", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Stage", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.AttitudeStage))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AttitudeStageComplete", num: 8, type: 2, scale: 1, offset: 0, units: "%", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Track", num: 9, type: 132, scale: 10430.38, offset: 0, units: "radians", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Validity", num: 10, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.AttitudeValidity))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createVideoMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Video", num: MesgNum.Video)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Url", num: 0, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HostingProvider", num: 1, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Duration", num: 2, type: 134, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createVideoTitleMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "VideoTitle", num: MesgNum.VideoTitle)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MessageCount", num: 0, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Text", num: 1, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createVideoDescriptionMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "VideoDescription", num: MesgNum.VideoDescription)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MessageCount", num: 0, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Text", num: 1, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createVideoClipMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "VideoClip", num: MesgNum.VideoClip)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "ClipNumber", num: 0, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTimestamp", num: 1, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTimestampMs", num: 2, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndTimestamp", num: 3, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndTimestampMs", num: 4, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ClipStart", num: 6, type: 134, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ClipEnd", num: 7, type: 134, scale: 1, offset: 0, units: "ms", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSetMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Set", num: MesgNum.Set)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 254, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Duration", num: 0, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Repetitions", num: 3, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Weight", num: 4, type: 132, scale: 16, offset: 0, units: "kg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SetType", num: 5, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SetType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTime", num: 6, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Category", num: 7, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ExerciseCategory))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CategorySubtype", num: 8, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WeightDisplayUnit", num: 9, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.FitBaseUnit))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MessageIndex", num: 10, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WktStepIndex", num: 11, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createCourseMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Course", num: MesgNum.Course)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Sport", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 5, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Capabilities", num: 6, type: 140, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.CourseCapabilities))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createCoursePointMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "CoursePoint", num: MesgNum.CoursePoint)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Timestamp", num: 1, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionLat", num: 2, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionLong", num: 3, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Distance", num: 4, type: 134, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Type", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.CoursePoint))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 6, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Favorite", num: 8, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSegmentIdMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "SegmentId", num: MesgNum.SegmentId)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Name", num: 0, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Uuid", num: 1, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sport", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Enabled", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "UserProfilePrimaryKey", num: 4, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceId", num: 5, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DefaultRaceLeader", num: 6, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeleteStatus", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SegmentDeleteStatus))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SelectionType", num: 8, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SegmentSelectionType))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSegmentLeaderboardEntryMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "SegmentLeaderboardEntry", num: MesgNum.SegmentLeaderboardEntry)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 0, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Type", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SegmentLeaderboardType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GroupPrimaryKey", num: 2, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityId", num: 3, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SegmentTime", num: 4, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityIdString", num: 5, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSegmentPointMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "SegmentPoint", num: MesgNum.SegmentPoint)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionLat", num: 1, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PositionLong", num: 2, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Distance", num: 3, type: 134, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Altitude", num: 4, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeaderTime", num: 5, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSegmentLapMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "SegmentLap", num: MesgNum.SegmentLap)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Event", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Event))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventType", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.EventType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartTime", num: 2, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartPositionLat", num: 3, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartPositionLong", num: 4, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndPositionLat", num: 5, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndPositionLong", num: 6, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalElapsedTime", num: 7, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalTimerTime", num: 8, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalDistance", num: 9, type: 134, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalCycles", num: 10, type: 134, scale: 1, offset: 0, units: "cycles", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "TotalStrokes", type: 134, scale: 1, offset: 0, units: "strokes"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 23, refFieldValue: 2)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalCalories", num: 11, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalFatCalories", num: 12, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgSpeed", num: 13, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxSpeed", num: 14, type: 132, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgHeartRate", num: 15, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxHeartRate", num: 16, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCadence", num: 17, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxCadence", num: 18, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPower", num: 19, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPower", num: 20, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalAscent", num: 21, type: 132, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalDescent", num: 22, type: 132, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sport", num: 23, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventGroup", num: 24, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NecLat", num: 25, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NecLong", num: 26, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SwcLat", num: 27, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SwcLong", num: 28, type: 133, scale: 1, offset: 0, units: "semicircles", accumulated: false, profileType: Types.Sint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Name", num: 29, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NormalizedPower", num: 30, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeftRightBalance", num: 31, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LeftRightBalance100))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 32, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalWork", num: 33, type: 134, scale: 1, offset: 0, units: "J", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgAltitude", num: 34, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxAltitude", num: 35, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "GpsAccuracy", num: 36, type: 2, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgGrade", num: 37, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPosGrade", num: 38, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgNegGrade", num: 39, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPosGrade", num: 40, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxNegGrade", num: 41, type: 131, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgTemperature", num: 42, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxTemperature", num: 43, type: 1, scale: 1, offset: 0, units: "C", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalMovingTime", num: 44, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPosVerticalSpeed", num: 45, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgNegVerticalSpeed", num: 46, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPosVerticalSpeed", num: 47, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxNegVerticalSpeed", num: 48, type: 131, scale: 1000, offset: 0, units: "m/s", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInHrZone", num: 49, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInSpeedZone", num: 50, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInCadenceZone", num: 51, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeInPowerZone", num: 52, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RepetitionNum", num: 53, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinAltitude", num: 54, type: 132, scale: 5, offset: 500, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MinHeartRate", num: 55, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActiveTime", num: 56, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WktStepIndex", num: 57, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SportEvent", num: 58, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SportEvent))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftTorqueEffectiveness", num: 59, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightTorqueEffectiveness", num: 60, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPedalSmoothness", num: 61, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPedalSmoothness", num: 62, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCombinedPedalSmoothness", num: 63, type: 2, scale: 2, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Status", num: 64, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SegmentLapStatus))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Uuid", num: 65, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgFractionalCadence", num: 66, type: 2, scale: 128, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxFractionalCadence", num: 67, type: 2, scale: 128, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TotalFractionalCycles", num: 68, type: 2, scale: 128, offset: 0, units: "cycles", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FrontGearShiftCount", num: 69, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RearGearShiftCount", num: 70, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeStanding", num: 71, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StandCount", num: 72, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPco", num: 73, type: 1, scale: 1, offset: 0, units: "mm", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPco", num: 74, type: 1, scale: 1, offset: 0, units: "mm", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPowerPhase", num: 75, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgLeftPowerPhasePeak", num: 76, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPowerPhase", num: 77, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgRightPowerPhasePeak", num: 78, type: 2, scale: 0.7111111, offset: 0, units: "degrees", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgPowerPosition", num: 79, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxPowerPosition", num: 80, type: 132, scale: 1, offset: 0, units: "watts", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgCadencePosition", num: 81, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxCadencePosition", num: 82, type: 2, scale: 1, offset: 0, units: "rpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Manufacturer", num: 83, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Manufacturer))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createSegmentFileMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "SegmentFile", num: MesgNum.SegmentFile)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FileUuid", num: 1, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Enabled", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "UserProfilePrimaryKey", num: 4, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeaderType", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SegmentLeaderboardType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeaderGroupPrimaryKey", num: 8, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeaderActivityId", num: 9, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LeaderActivityIdString", num: 10, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DefaultRaceLeader", num: 11, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createWorkoutMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Workout", num: MesgNum.Workout)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Sport", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Capabilities", num: 5, type: 140, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WorkoutCapabilities))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NumValidSteps", num: 6, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WktName", num: 8, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 11, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PoolLength", num: 14, type: 132, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PoolLengthUnit", num: 15, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createWorkoutSessionMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "WorkoutSession", num: MesgNum.WorkoutSession)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sport", num: 0, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SubSport", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.SubSport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NumValidSteps", num: 2, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FirstStepIndex", num: 3, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PoolLength", num: 4, type: 132, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PoolLengthUnit", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DisplayMeasure))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createWorkoutStepMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "WorkoutStep", num: MesgNum.WorkoutStep)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WktStepName", num: 0, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DurationType", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WktStepDuration))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DurationValue", num: 2, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "DurationTime", type: 134, scale: 1000, offset: 0, units: "s"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 0)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 28)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 2)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 3)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 4)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 6)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 7)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 8)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 9)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 10)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 11)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 12)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 13)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 14)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 15)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 29)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TargetType", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WktStepTarget))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TargetValue", num: 4, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "TargetSpeedZone", type: 134, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 0)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 3)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 4)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 6)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 7)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 8)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 9)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 10)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 11)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 12)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 1, refFieldValue: 13)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 11)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CustomTargetValueLow", num: 5, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "CustomTargetSpeedLow", type: 134, scale: 1000, offset: 0, units: "m/s"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 0)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 3)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 4)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CustomTargetValueHigh", num: 6, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "CustomTargetSpeedHigh", type: 134, scale: 1000, offset: 0, units: "m/s"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 0)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 3)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 3, refFieldValue: 4)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Intensity", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Intensity))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Notes", num: 8, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Equipment", num: 9, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.WorkoutEquipment))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ExerciseCategory", num: 10, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ExerciseCategory))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ExerciseName", num: 11, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ExerciseWeight", num: 12, type: 132, scale: 100, offset: 0, units: "kg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WeightDisplayUnit", num: 13, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.FitBaseUnit))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createExerciseTitleMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "ExerciseTitle", num: MesgNum.ExerciseTitle)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ExerciseCategory", num: 0, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ExerciseCategory))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ExerciseName", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "WktStepName", num: 2, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createScheduleMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "Schedule", num: MesgNum.Schedule)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Manufacturer", num: 0, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Manufacturer))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Product", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "GarminProduct", type: 132, scale: 1, offset: 0, units: ""))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 15)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 0, refFieldValue: 13)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SerialNumber", num: 2, type: 140, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimeCreated", num: 3, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Completed", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Type", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Schedule))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ScheduledTime", num: 6, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LocalDateTime))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createTotalsMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Totals", num: MesgNum.Totals)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "MessageIndex", num: 254, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimerTime", num: 0, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Distance", num: 1, type: 134, scale: 1, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Calories", num: 2, type: 134, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sport", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sport))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ElapsedTime", num: 4, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Sessions", num: 5, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActiveTime", num: 6, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SportIndex", num: 9, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createWeightScaleMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "WeightScale", num: MesgNum.WeightScale)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Weight", num: 0, type: 132, scale: 100, offset: 0, units: "kg", accumulated: false, profileType: Types.Weight))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PercentFat", num: 1, type: 132, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PercentHydration", num: 2, type: 132, scale: 100, offset: 0, units: "%", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "VisceralFatMass", num: 3, type: 132, scale: 100, offset: 0, units: "kg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BoneMass", num: 4, type: 132, scale: 100, offset: 0, units: "kg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MuscleMass", num: 5, type: 132, scale: 100, offset: 0, units: "kg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BasalMet", num: 7, type: 132, scale: 4, offset: 0, units: "kcal/day", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "PhysiqueRating", num: 8, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActiveMet", num: 9, type: 132, scale: 4, offset: 0, units: "kcal/day", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MetabolicAge", num: 10, type: 2, scale: 1, offset: 0, units: "years", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "VisceralFatRating", num: 11, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "UserProfileIndex", num: 12, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createBloodPressureMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "BloodPressure", num: MesgNum.BloodPressure)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SystolicPressure", num: 0, type: 132, scale: 1, offset: 0, units: "mmHg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DiastolicPressure", num: 1, type: 132, scale: 1, offset: 0, units: "mmHg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MeanArterialPressure", num: 2, type: 132, scale: 1, offset: 0, units: "mmHg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Map3SampleMean", num: 3, type: 132, scale: 1, offset: 0, units: "mmHg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MapMorningValues", num: 4, type: 132, scale: 1, offset: 0, units: "mmHg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MapEveningValues", num: 5, type: 132, scale: 1, offset: 0, units: "mmHg", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HeartRate", num: 6, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HeartRateType", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.HrType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Status", num: 8, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.BpStatus))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "UserProfileIndex", num: 9, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createMonitoringInfoMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "MonitoringInfo", num: MesgNum.MonitoringInfo)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LocalTimestamp", num: 0, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.LocalDateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityType", num: 1, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ActivityType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CyclesToDistance", num: 3, type: 132, scale: 5000, offset: 0, units: "m/cycle", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CyclesToCalories", num: 4, type: 132, scale: 5000, offset: 0, units: "kcal/cycle", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "RestingMetabolicRate", num: 5, type: 132, scale: 1, offset: 0, units: "kcal/day", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createMonitoringMesg() -> Mesg {
        var fieldIndex: UInt16
        var subfieldIndex: UInt16
        let newMesg = Mesg(name: "Monitoring", num: MesgNum.Monitoring)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceIndex", num: 0, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DeviceIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Calories", num: 1, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Distance", num: 2, type: 134, scale: 100, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Cycles", num: 3, type: 134, scale: 2, offset: 0, units: "cycles", accumulated: false, profileType: Types.Uint32))
        subfieldIndex = 0
        newMesg.fields[Int(fieldIndex)].subfields.append(Subfield(name: "Steps", type: 134, scale: 1, offset: 0, units: "steps"))
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 5, refFieldValue: 6)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 5, refFieldValue: 1)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 5, refFieldValue: 2)
        newMesg.fields[Int(fieldIndex)].subfields[Int(subfieldIndex)].addMap(refFieldNum: 5, refFieldValue: 5)
        subfieldIndex += 1
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActiveTime", num: 4, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityType", num: 5, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ActivityType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivitySubtype", num: 6, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ActivitySubtype))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityLevel", num: 7, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ActivityLevel))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Distance16", num: 8, type: 132, scale: 1, offset: 0, units: "100*m", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Cycles16", num: 9, type: 132, scale: 1, offset: 0, units: "2*cycles(steps)", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActiveTime16", num: 10, type: 132, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "LocalTimestamp", num: 11, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.LocalDateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Temperature", num: 12, type: 131, scale: 100, offset: 0, units: "C", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TemperatureMin", num: 14, type: 131, scale: 100, offset: 0, units: "C", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TemperatureMax", num: 15, type: 131, scale: 100, offset: 0, units: "C", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActivityTime", num: 16, type: 132, scale: 1, offset: 0, units: "minutes", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ActiveCalories", num: 19, type: 132, scale: 1, offset: 0, units: "kcal", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "CurrentActivityTypeIntensity", num: 24, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 5, accumulate: false, bits: 5, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 28, accumulate: false, bits: 3, scale: 1, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TimestampMin8", num: 25, type: 2, scale: 1, offset: 0, units: "min", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Timestamp16", num: 26, type: 132, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "HeartRate", num: 27, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Intensity", num: 28, type: 2, scale: 10, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DurationMin", num: 29, type: 132, scale: 1, offset: 0, units: "min", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Duration", num: 30, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Ascent", num: 31, type: 134, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Descent", num: 32, type: 134, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ModerateActivityMinutes", num: 33, type: 132, scale: 1, offset: 0, units: "minutes", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "VigorousActivityMinutes", num: 34, type: 132, scale: 1, offset: 0, units: "minutes", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createHrMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "Hr", num: MesgNum.Hr)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FractionalTimestamp", num: 0, type: 132, scale: 32768, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Time256", num: 1, type: 2, scale: 256, offset: 0, units: "s", accumulated: false, profileType: Types.Uint8))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 0, accumulate: false, bits: 8, scale: 256, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FilteredBpm", num: 6, type: 2, scale: 1, offset: 0, units: "bpm", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventTimestamp", num: 9, type: 134, scale: 1024, offset: 0, units: "s", accumulated: true, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EventTimestamp12", num: 10, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 9, accumulate: true, bits: 12, scale: 1024, offset: 0))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createStressLevelMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "StressLevel", num: MesgNum.StressLevel)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "StressLevelValue", num: 0, type: 131, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StressLevelTime", num: 1, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createMemoGlobMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "MemoGlob", num: MesgNum.MemoGlob)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "PartIndex", num: 250, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Memo", num: 0, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MessageNumber", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MessageIndex", num: 2, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createAntChannelIdMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "AntChannelId", num: MesgNum.AntChannelId)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "ChannelNumber", num: 0, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceType", num: 1, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceNumber", num: 2, type: 139, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint16z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "TransmissionType", num: 3, type: 10, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8z))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeviceIndex", num: 4, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.DeviceIndex))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createAntRxMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "AntRx", num: MesgNum.AntRx)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FractionalTimestamp", num: 0, type: 132, scale: 32768, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MesgId", num: 1, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MesgData", num: 2, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 3, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ChannelNumber", num: 3, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Data", num: 4, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createAntTxMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "AntTx", num: MesgNum.AntTx)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FractionalTimestamp", num: 0, type: 132, scale: 32768, offset: 0, units: "s", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MesgId", num: 1, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MesgData", num: 2, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 3, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 4, accumulate: false, bits: 8, scale: 1, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ChannelNumber", num: 3, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Data", num: 4, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createExdScreenConfigurationMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "ExdScreenConfiguration", num: MesgNum.ExdScreenConfiguration)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "ScreenIndex", num: 0, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FieldCount", num: 1, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Layout", num: 2, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ExdLayout))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ScreenEnabled", num: 3, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createExdDataFieldConfigurationMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "ExdDataFieldConfiguration", num: MesgNum.ExdDataFieldConfiguration)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "ScreenIndex", num: 0, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ConceptField", num: 1, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 2, accumulate: false, bits: 4, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 3, accumulate: false, bits: 4, scale: 1, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FieldId", num: 2, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ConceptCount", num: 3, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DisplayType", num: 4, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ExdDisplayType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Title", num: 5, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createExdDataConceptConfigurationMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "ExdDataConceptConfiguration", num: MesgNum.ExdDataConceptConfiguration)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "ScreenIndex", num: 0, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ConceptField", num: 1, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 2, accumulate: false, bits: 4, scale: 1, offset: 0))
        newMesg.fields[Int(fieldIndex)].components.append(FieldComponent(fieldNum: 3, accumulate: false, bits: 4, scale: 1, offset: 0))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FieldId", num: 2, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ConceptIndex", num: 3, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DataPage", num: 4, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ConceptKey", num: 5, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Scaling", num: 6, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DataUnits", num: 8, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ExdDataUnits))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Qualifier", num: 9, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ExdQualifiers))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Descriptor", num: 10, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.ExdDescriptors))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "IsSigned", num: 11, type: 0, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Bool))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createFieldDescriptionMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "FieldDescription", num: MesgNum.FieldDescription)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "DeveloperDataIndex", num: 0, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FieldDefinitionNumber", num: 1, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FitBaseTypeId", num: 2, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.FitBaseType))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FieldName", num: 3, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Array", num: 4, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Components", num: 5, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Scale", num: 6, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Offset", num: 7, type: 1, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Sint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Units", num: 8, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Bits", num: 9, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "Accumulate", num: 10, type: 7, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.String))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "FitBaseUnitId", num: 13, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.FitBaseUnit))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NativeMesgNum", num: 14, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MesgNum))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "NativeFieldNum", num: 15, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createDeveloperDataIdMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "DeveloperDataId", num: MesgNum.DeveloperDataId)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "DeveloperId", num: 0, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ApplicationId", num: 1, type: 13, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Byte))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ManufacturerId", num: 2, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Manufacturer))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DeveloperDataIndex", num: 3, type: 2, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ApplicationVersion", num: 4, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createDiveSummaryMesg() -> Mesg {
        var fieldIndex: UInt16
        var _: UInt16
        let newMesg = Mesg(name: "DiveSummary", num: MesgNum.DiveSummary)
        fieldIndex = 0
        newMesg.setField(field: Field(name: "Timestamp", num: 253, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.DateTime))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ReferenceMesg", num: 0, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MesgNum))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "ReferenceIndex", num: 1, type: 132, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.MessageIndex))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "AvgDepth", num: 2, type: 134, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "MaxDepth", num: 3, type: 134, scale: 1000, offset: 0, units: "m", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "SurfaceInterval", num: 4, type: 134, scale: 1, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartCns", num: 5, type: 2, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndCns", num: 6, type: 2, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint8))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "StartN2", num: 7, type: 132, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "EndN2", num: 8, type: 132, scale: 1, offset: 0, units: "percent", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "O2Toxicity", num: 9, type: 132, scale: 1, offset: 0, units: "OTUs", accumulated: false, profileType: Types.Uint16))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "DiveNumber", num: 10, type: 134, scale: 1, offset: 0, units: "", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        newMesg.setField(field: Field(name: "BottomTime", num: 11, type: 134, scale: 1000, offset: 0, units: "s", accumulated: false, profileType: Types.Uint32))
        fieldIndex += 1
        
        return newMesg
    }
    
    private static func createPadMesg() -> Mesg {
        let newMesg = Mesg(name: "Pad", num: MesgNum.Pad)
        return newMesg
    }

}
