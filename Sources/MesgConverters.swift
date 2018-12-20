
public class MesgConverters : DecodeDelegate {
    
    public weak var delegate: MesgConvertersDelegate? = nil

    public init() {
        
    }
    
    public func didReadMesg(mesg: Mesg) {
        delegate?.didReadMesg(mesg: mesg)
        
        switch mesg.num {
        case MesgNum.FileId:
            delegate?.didReadFileIdMesg(FileIdMesg(mesg))
        case MesgNum.FileCreator:
            delegate?.didReadFileCreatorMesg(FileCreatorMesg(mesg))
        case MesgNum.TimestampCorrelation:
            delegate?.didReadTimestampCorrelationMesg(TimestampCorrelationMesg(mesg))
        case MesgNum.Software:
            delegate?.didReadSoftwareMesg(SoftwareMesg(mesg))
        case MesgNum.SlaveDevice:
            delegate?.didReadSlaveDeviceMesg(SlaveDeviceMesg(mesg))
        case MesgNum.Capabilities:
            delegate?.didReadCapabilitiesMesg(CapabilitiesMesg(mesg))
        case MesgNum.FileCapabilities:
            delegate?.didReadFileCapabilitiesMesg(FileCapabilitiesMesg(mesg))
        case MesgNum.MesgCapabilities:
            delegate?.didReadMesgCapabilitiesMesg(MesgCapabilitiesMesg(mesg))
        case MesgNum.FieldCapabilities:
            delegate?.didReadFieldCapabilitiesMesg(FieldCapabilitiesMesg(mesg))
        case MesgNum.DeviceSettings:
            delegate?.didReadDeviceSettingsMesg(DeviceSettingsMesg(mesg))
        case MesgNum.UserProfile:
            delegate?.didReadUserProfileMesg(UserProfileMesg(mesg))
        case MesgNum.HrmProfile:
            delegate?.didReadHrmProfileMesg(HrmProfileMesg(mesg))
        case MesgNum.SdmProfile:
            delegate?.didReadSdmProfileMesg(SdmProfileMesg(mesg))
        case MesgNum.BikeProfile:
            delegate?.didReadBikeProfileMesg(BikeProfileMesg(mesg))
        case MesgNum.Connectivity:
            delegate?.didReadConnectivityMesg(ConnectivityMesg(mesg))
        case MesgNum.WatchfaceSettings:
            delegate?.didReadWatchfaceSettingsMesg(WatchfaceSettingsMesg(mesg))
        case MesgNum.OhrSettings:
            delegate?.didReadOhrSettingsMesg(OhrSettingsMesg(mesg))
        case MesgNum.ZonesTarget:
            delegate?.didReadZonesTargetMesg(ZonesTargetMesg(mesg))
        case MesgNum.Sport:
            delegate?.didReadSportMesg(SportMesg(mesg))
        case MesgNum.HrZone:
            delegate?.didReadHrZoneMesg(HrZoneMesg(mesg))
        case MesgNum.SpeedZone:
            delegate?.didReadSpeedZoneMesg(SpeedZoneMesg(mesg))
        case MesgNum.CadenceZone:
            delegate?.didReadCadenceZoneMesg(CadenceZoneMesg(mesg))
        case MesgNum.PowerZone:
            delegate?.didReadPowerZoneMesg(PowerZoneMesg(mesg))
        case MesgNum.MetZone:
            delegate?.didReadMetZoneMesg(MetZoneMesg(mesg))
        case MesgNum.DiveSettings:
            delegate?.didReadDiveSettingsMesg(DiveSettingsMesg(mesg))
        case MesgNum.DiveAlarm:
            delegate?.didReadDiveAlarmMesg(DiveAlarmMesg(mesg))
        case MesgNum.DiveGas:
            delegate?.didReadDiveGasMesg(DiveGasMesg(mesg))
        case MesgNum.Goal:
            delegate?.didReadGoalMesg(GoalMesg(mesg))
        case MesgNum.Activity:
            delegate?.didReadActivityMesg(ActivityMesg(mesg))
        case MesgNum.Session:
            delegate?.didReadSessionMesg(SessionMesg(mesg))
        case MesgNum.Lap:
            delegate?.didReadLapMesg(LapMesg(mesg))
        case MesgNum.Length:
            delegate?.didReadLengthMesg(LengthMesg(mesg))
        case MesgNum.Record:
            delegate?.didReadRecordMesg(RecordMesg(mesg))
        case MesgNum.Event:
            delegate?.didReadEventMesg(EventMesg(mesg))
        case MesgNum.DeviceInfo:
            delegate?.didReadDeviceInfoMesg(DeviceInfoMesg(mesg))
        case MesgNum.TrainingFile:
            delegate?.didReadTrainingFileMesg(TrainingFileMesg(mesg))
        case MesgNum.Hrv:
            delegate?.didReadHrvMesg(HrvMesg(mesg))
        case MesgNum.WeatherConditions:
            delegate?.didReadWeatherConditionsMesg(WeatherConditionsMesg(mesg))
        case MesgNum.WeatherAlert:
            delegate?.didReadWeatherAlertMesg(WeatherAlertMesg(mesg))
        case MesgNum.GpsMetadata:
            delegate?.didReadGpsMetadataMesg(GpsMetadataMesg(mesg))
        case MesgNum.CameraEvent:
            delegate?.didReadCameraEventMesg(CameraEventMesg(mesg))
        case MesgNum.GyroscopeData:
            delegate?.didReadGyroscopeDataMesg(GyroscopeDataMesg(mesg))
        case MesgNum.AccelerometerData:
            delegate?.didReadAccelerometerDataMesg(AccelerometerDataMesg(mesg))
        case MesgNum.MagnetometerData:
            delegate?.didReadMagnetometerDataMesg(MagnetometerDataMesg(mesg))
        case MesgNum.BarometerData:
            delegate?.didReadBarometerDataMesg(BarometerDataMesg(mesg))
        case MesgNum.ThreeDSensorCalibration:
            delegate?.didReadThreeDSensorCalibrationMesg(ThreeDSensorCalibrationMesg(mesg))
        case MesgNum.OneDSensorCalibration:
            delegate?.didReadOneDSensorCalibrationMesg(OneDSensorCalibrationMesg(mesg))
        case MesgNum.VideoFrame:
            delegate?.didReadVideoFrameMesg(VideoFrameMesg(mesg))
        case MesgNum.ObdiiData:
            delegate?.didReadObdiiDataMesg(ObdiiDataMesg(mesg))
        case MesgNum.NmeaSentence:
            delegate?.didReadNmeaSentenceMesg(NmeaSentenceMesg(mesg))
        case MesgNum.AviationAttitude:
            delegate?.didReadAviationAttitudeMesg(AviationAttitudeMesg(mesg))
        case MesgNum.Video:
            delegate?.didReadVideoMesg(VideoMesg(mesg))
        case MesgNum.VideoTitle:
            delegate?.didReadVideoTitleMesg(VideoTitleMesg(mesg))
        case MesgNum.VideoDescription:
            delegate?.didReadVideoDescriptionMesg(VideoDescriptionMesg(mesg))
        case MesgNum.VideoClip:
            delegate?.didReadVideoClipMesg(VideoClipMesg(mesg))
        case MesgNum.Set:
            delegate?.didReadSetMesg(SetMesg(mesg))
        case MesgNum.Course:
            delegate?.didReadCourseMesg(CourseMesg(mesg))
        case MesgNum.CoursePoint:
            delegate?.didReadCoursePointMesg(CoursePointMesg(mesg))
        case MesgNum.SegmentId:
            delegate?.didReadSegmentIdMesg(SegmentIdMesg(mesg))
        case MesgNum.SegmentLeaderboardEntry:
            delegate?.didReadSegmentLeaderboardEntryMesg(SegmentLeaderboardEntryMesg(mesg))
        case MesgNum.SegmentPoint:
            delegate?.didReadSegmentPointMesg(SegmentPointMesg(mesg))
        case MesgNum.SegmentLap:
            delegate?.didReadSegmentLapMesg(SegmentLapMesg(mesg))
        case MesgNum.SegmentFile:
            delegate?.didReadSegmentFileMesg(SegmentFileMesg(mesg))
        case MesgNum.Workout:
            delegate?.didReadWorkoutMesg(WorkoutMesg(mesg))
        case MesgNum.WorkoutSession:
            delegate?.didReadWorkoutSessionMesg(WorkoutSessionMesg(mesg))
        case MesgNum.WorkoutStep:
            delegate?.didReadWorkoutStepMesg(WorkoutStepMesg(mesg))
        case MesgNum.ExerciseTitle:
            delegate?.didReadExerciseTitleMesg(ExerciseTitleMesg(mesg))
        case MesgNum.Schedule:
            delegate?.didReadScheduleMesg(ScheduleMesg(mesg))
        case MesgNum.Totals:
            delegate?.didReadTotalsMesg(TotalsMesg(mesg))
        case MesgNum.WeightScale:
            delegate?.didReadWeightScaleMesg(WeightScaleMesg(mesg))
        case MesgNum.BloodPressure:
            delegate?.didReadBloodPressureMesg(BloodPressureMesg(mesg))
        case MesgNum.MonitoringInfo:
            delegate?.didReadMonitoringInfoMesg(MonitoringInfoMesg(mesg))
        case MesgNum.Monitoring:
            delegate?.didReadMonitoringMesg(MonitoringMesg(mesg))
        case MesgNum.Hr:
            delegate?.didReadHrMesg(HrMesg(mesg))
        case MesgNum.StressLevel:
            delegate?.didReadStressLevelMesg(StressLevelMesg(mesg))
        case MesgNum.MemoGlob:
            delegate?.didReadMemoGlobMesg(MemoGlobMesg(mesg))
        case MesgNum.AntChannelId:
            delegate?.didReadAntChannelIdMesg(AntChannelIdMesg(mesg))
        case MesgNum.AntRx:
            delegate?.didReadAntRxMesg(AntRxMesg(mesg))
        case MesgNum.AntTx:
            delegate?.didReadAntTxMesg(AntTxMesg(mesg))
        case MesgNum.ExdScreenConfiguration:
            delegate?.didReadExdScreenConfigurationMesg(ExdScreenConfigurationMesg(mesg))
        case MesgNum.ExdDataFieldConfiguration:
            delegate?.didReadExdDataFieldConfigurationMesg(ExdDataFieldConfigurationMesg(mesg))
        case MesgNum.ExdDataConceptConfiguration:
            delegate?.didReadExdDataConceptConfigurationMesg(ExdDataConceptConfigurationMesg(mesg))
        case MesgNum.FieldDescription:
            delegate?.didReadFieldDescriptionMesg(FieldDescriptionMesg(mesg))
        case MesgNum.DeveloperDataId:
            delegate?.didReadDeveloperDataIdMesg(DeveloperDataIdMesg(mesg))
        case MesgNum.DiveSummary:
            delegate?.didReadDiveSummaryMesg(DiveSummaryMesg(mesg))
        default:
            break
        }
    }
    
    public func didReadMesgDefinition(mesgDef: MesgDefinition) {
        delegate?.didReadMesgDefinition(mesgDef: mesgDef)
    }
    
    public func didReadDeveloperFieldDescription(fieldDesc: DeveloperFieldDescription) {
        delegate?.didReadDeveloperFieldDescription(fieldDesc: fieldDesc)
    }
    
}
