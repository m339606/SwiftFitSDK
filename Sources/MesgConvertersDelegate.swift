
public protocol MesgConvertersDelegate : class {
    
    func didReadMesg(mesg: Mesg)
    
    func didReadMesgDefinition(mesgDef: MesgDefinition)
    
    func didReadDeveloperFieldDescription(fieldDesc: DeveloperFieldDescription)
    
    func didReadFileIdMesg(_ mesg: FileIdMesg)
    
    func didReadFileCreatorMesg(_ mesg: FileCreatorMesg)
    
    func didReadTimestampCorrelationMesg(_ mesg: TimestampCorrelationMesg)
    
    func didReadSoftwareMesg(_ mesg: SoftwareMesg)
    
    func didReadSlaveDeviceMesg(_ mesg: SlaveDeviceMesg)
    
    func didReadCapabilitiesMesg(_ mesg: CapabilitiesMesg)
    
    func didReadFileCapabilitiesMesg(_ mesg: FileCapabilitiesMesg)
    
    func didReadMesgCapabilitiesMesg(_ mesg: MesgCapabilitiesMesg)
    
    func didReadFieldCapabilitiesMesg(_ mesg: FieldCapabilitiesMesg)
    
    func didReadDeviceSettingsMesg(_ mesg: DeviceSettingsMesg)
    
    func didReadUserProfileMesg(_ mesg: UserProfileMesg)
    
    func didReadHrmProfileMesg(_ mesg: HrmProfileMesg)
    
    func didReadSdmProfileMesg(_ mesg: SdmProfileMesg)
    
    func didReadBikeProfileMesg(_ mesg: BikeProfileMesg)
    
    func didReadConnectivityMesg(_ mesg: ConnectivityMesg)
    
    func didReadWatchfaceSettingsMesg(_ mesg: WatchfaceSettingsMesg)
    
    func didReadOhrSettingsMesg(_ mesg: OhrSettingsMesg)
    
    func didReadZonesTargetMesg(_ mesg: ZonesTargetMesg)
    
    func didReadSportMesg(_ mesg: SportMesg)
    
    func didReadHrZoneMesg(_ mesg: HrZoneMesg)
    
    func didReadSpeedZoneMesg(_ mesg: SpeedZoneMesg)
    
    func didReadCadenceZoneMesg(_ mesg: CadenceZoneMesg)
    
    func didReadPowerZoneMesg(_ mesg: PowerZoneMesg)
    
    func didReadMetZoneMesg(_ mesg: MetZoneMesg)
    
    func didReadDiveSettingsMesg(_ mesg: DiveSettingsMesg)
    
    func didReadDiveAlarmMesg(_ mesg: DiveAlarmMesg)
    
    func didReadDiveGasMesg(_ mesg: DiveGasMesg)
    
    func didReadGoalMesg(_ mesg: GoalMesg)
    
    func didReadActivityMesg(_ mesg: ActivityMesg)
    
    func didReadSessionMesg(_ mesg: SessionMesg)
    
    func didReadLapMesg(_ mesg: LapMesg)
    
    func didReadLengthMesg(_ mesg: LengthMesg)
    
    func didReadRecordMesg(_ mesg: RecordMesg)
    
    func didReadEventMesg(_ mesg: EventMesg)
    
    func didReadDeviceInfoMesg(_ mesg: DeviceInfoMesg)
    
    func didReadTrainingFileMesg(_ mesg: TrainingFileMesg)
    
    func didReadHrvMesg(_ mesg: HrvMesg)
    
    func didReadWeatherConditionsMesg(_ mesg: WeatherConditionsMesg)
    
    func didReadWeatherAlertMesg(_ mesg: WeatherAlertMesg)
    
    func didReadGpsMetadataMesg(_ mesg: GpsMetadataMesg)
    
    func didReadCameraEventMesg(_ mesg: CameraEventMesg)
    
    func didReadGyroscopeDataMesg(_ mesg: GyroscopeDataMesg)
    
    func didReadAccelerometerDataMesg(_ mesg: AccelerometerDataMesg)
    
    func didReadMagnetometerDataMesg(_ mesg: MagnetometerDataMesg)
    
    func didReadBarometerDataMesg(_ mesg: BarometerDataMesg)
    
    func didReadThreeDSensorCalibrationMesg(_ mesg: ThreeDSensorCalibrationMesg)
    
    func didReadOneDSensorCalibrationMesg(_ mesg: OneDSensorCalibrationMesg)
    
    func didReadVideoFrameMesg(_ mesg: VideoFrameMesg)
    
    func didReadObdiiDataMesg(_ mesg: ObdiiDataMesg)
    
    func didReadNmeaSentenceMesg(_ mesg: NmeaSentenceMesg)
    
    func didReadAviationAttitudeMesg(_ mesg: AviationAttitudeMesg)
    
    func didReadVideoMesg(_ mesg: VideoMesg)
    
    func didReadVideoTitleMesg(_ mesg: VideoTitleMesg)
    
    func didReadVideoDescriptionMesg(_ mesg: VideoDescriptionMesg)
    
    func didReadVideoClipMesg(_ mesg: VideoClipMesg)
    
    func didReadSetMesg(_ mesg: SetMesg)
    
    func didReadCourseMesg(_ mesg: CourseMesg)
    
    func didReadCoursePointMesg(_ mesg: CoursePointMesg)
    
    func didReadSegmentIdMesg(_ mesg: SegmentIdMesg)
    
    func didReadSegmentLeaderboardEntryMesg(_ mesg: SegmentLeaderboardEntryMesg)
    
    func didReadSegmentPointMesg(_ mesg: SegmentPointMesg)
    
    func didReadSegmentLapMesg(_ mesg: SegmentLapMesg)
    
    func didReadSegmentFileMesg(_ mesg: SegmentFileMesg)
    
    func didReadWorkoutMesg(_ mesg: WorkoutMesg)
    
    func didReadWorkoutSessionMesg(_ mesg: WorkoutSessionMesg)
    
    func didReadWorkoutStepMesg(_ mesg: WorkoutStepMesg)
    
    func didReadExerciseTitleMesg(_ mesg: ExerciseTitleMesg)
    
    func didReadScheduleMesg(_ mesg: ScheduleMesg)
    
    func didReadTotalsMesg(_ mesg: TotalsMesg)
    
    func didReadWeightScaleMesg(_ mesg: WeightScaleMesg)
    
    func didReadBloodPressureMesg(_ mesg: BloodPressureMesg)
    
    func didReadMonitoringInfoMesg(_ mesg: MonitoringInfoMesg)
    
    func didReadMonitoringMesg(_ mesg: MonitoringMesg)
    
    func didReadHrMesg(_ mesg: HrMesg)
    
    func didReadStressLevelMesg(_ mesg: StressLevelMesg)
    
    func didReadMemoGlobMesg(_ mesg: MemoGlobMesg)
    
    func didReadAntChannelIdMesg(_ mesg: AntChannelIdMesg)
    
    func didReadAntRxMesg(_ mesg: AntRxMesg)
    
    func didReadAntTxMesg(_ mesg: AntTxMesg)
    
    func didReadExdScreenConfigurationMesg(_ mesg: ExdScreenConfigurationMesg)
    
    func didReadExdDataFieldConfigurationMesg(_ mesg: ExdDataFieldConfigurationMesg)
    
    func didReadExdDataConceptConfigurationMesg(_ mesg: ExdDataConceptConfigurationMesg)
    
    func didReadFieldDescriptionMesg(_ mesg: FieldDescriptionMesg)
    
    func didReadDeveloperDataIdMesg(_ mesg: DeveloperDataIdMesg)
    
    func didReadDiveSummaryMesg(_ mesg: DiveSummaryMesg)
    
}
