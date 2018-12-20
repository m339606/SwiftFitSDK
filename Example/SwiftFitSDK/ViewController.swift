import UIKit
import SwiftFitSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        //MARK: Decode Example
        guard var path = Bundle.main.path(forResource: "Activity", ofType: "fit") else {
            return;
        }
        path = "file://\(path)"
        
        if let data = try? Data(contentsOf: URL(string: path)!) {
            let fitData = PositionableData(data: Array<UInt8>(data))
            let decode = Decode()
            let mesgConverters = MesgConverters()
            decode.delegate = mesgConverters
            mesgConverters.delegate = self
            
            guard decode.isFIT(fitData) && decode.checkIntegrity(fitData) else {
                NSLog("Source Data is not a Fit File or is broken")
                return
            }
            
            NSLog("Decoding...")
            if decode.read(fitData) {
                NSLog("Decode Success!")
            } else {
                NSLog("Decode Fail!")
            }
        }
        
        // MARK: Encode Example
        _ = encodeActivityFile()
        _ = encodeSettingsFile()
        _ = encodeMonitoringFile()
        NSLog("Encode Done!")
    }
    
    func encodeActivityFile() -> PositionableData {
        let fileIdMesg = FileIdMesg()
        let developerIdMesg = DeveloperDataIdMesg()
        let fieldDescMesg = FieldDescriptionMesg()
        var records: [RecordMesg] = []
        
        let appId: [UInt8] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
        
        fileIdMesg.setType(.Activity)
        fileIdMesg.setManufacturer(Manufacturer.Dynastream)
        fileIdMesg.setProduct(22)
        fileIdMesg.setSerialNumber(1234)
        fileIdMesg.setTimeCreated(FitDateTime(timeStamp: 621463080))
        
        for (i, id) in appId.enumerated() {
            developerIdMesg.setApplicationId(i, id)
        }
        developerIdMesg.setDeveloperDataIndex(0)
        
        fieldDescMesg.setDeveloperDataIndex(0)
        fieldDescMesg.setFieldDefinitionNumber(0)
        fieldDescMesg.setFitBaseTypeId(FitBaseType.Sint8)
        fieldDescMesg.setFieldName(0, "doughnuts_earned")
        fieldDescMesg.setUnits(0, "doughnuts")
        
        for i in 0 ..< 3 {
            let newRecord = RecordMesg()
            var doughnutsEarnedField = DeveloperField(description: fieldDescMesg, developerDataIdMesg: developerIdMesg)
            newRecord.setDeveloperField(field: doughnutsEarnedField)
            
            newRecord.setHeartRate(UInt8(140 + (i * 2)))
            newRecord.setCadence(UInt8(88 + (i * 2)))
            newRecord.setDistance(Float32(510 + (i * 100)))
            newRecord.setSpeed(Float32(2.8 + (Float32(i) * 0.4)))
            doughnutsEarnedField.setValue(value: i + 1)
            
            records.append(newRecord)
        }
        
        let encode = Encode(.v20)
        encode.write(fileIdMesg)
        encode.write(developerIdMesg)
        encode.write(fieldDescMesg)
        encode.write(records)
        return encode.close()
    }
    
    func encodeSettingsFile() -> PositionableData {
        let fileIdMesg = FileIdMesg()
        fileIdMesg.setType(.Settings)
        fileIdMesg.setManufacturer(Manufacturer.Dynastream)
        fileIdMesg.setProduct(1000)
        fileIdMesg.setSerialNumber(12345)
        
        let myUserProfile = UserProfileMesg()
        myUserProfile.setGender(Gender.Female)
        myUserProfile.setWeight(63.1)
        myUserProfile.setAge(99)
        myUserProfile.setFriendlyName(Array<UInt8>("TestUser".data(using: .utf8)!))
        
        let encode = Encode(.v20)
        encode.write(fileIdMesg)
        encode.write(myUserProfile)
        return encode.close()
    }
    
    func encodeMonitoringFile() -> PositionableData {
        let systemStartTime = Date()
        var systemTimeNow = systemStartTime
        
        let encode = Encode(.v10)

        let fileIdMesg = FileIdMesg()
        fileIdMesg.setSerialNumber(54321)
        fileIdMesg.setTimeCreated(FitDateTime(date: systemTimeNow))
        fileIdMesg.setManufacturer(Manufacturer.Dynastream)
        fileIdMesg.setProduct(1001)
        fileIdMesg.setNumber(0)
        fileIdMesg.setType(FitFileType.MonitoringB)
        encode.write(fileIdMesg)

        let deviceInfoMesg = DeviceInfoMesg()
        deviceInfoMesg.setTimestamp(FitDateTime(date: systemTimeNow))
        deviceInfoMesg.setSerialNumber(54321)
        deviceInfoMesg.setManufacturer(Manufacturer.Dynastream)
        deviceInfoMesg.setBatteryStatus(BatteryStatus.Good)
        encode.write(deviceInfoMesg)
        
        let monitoringMesg = MonitoringMesg()
        monitoringMesg.localNum = 1
        
        for _ in 0 ..< 4 {
            for j in 0 ..< 6 {
                monitoringMesg.setTimestamp(FitDateTime(date: systemTimeNow))
                monitoringMesg.setActivityType(.Walking)
                monitoringMesg.setCycles((monitoringMesg.getCycles() ?? 0) + Float32(j))
                encode.write(monitoringMesg)
                systemTimeNow.addTimeInterval(60 * 60)
            }
            
            deviceInfoMesg.setTimestamp(FitDateTime(date: systemTimeNow))
            deviceInfoMesg.setBatteryStatus(BatteryStatus.Good)
            encode.write(deviceInfoMesg)
        }
        
        return encode.close()
    }
    
}

extension ViewController : MesgConvertersDelegate {
    
    func didReadMesg(mesg: Mesg) {

        NSLog("didReadMesg: Received Mesg global ID#\(mesg.num), name \"\(mesg.name)\"")

        for (i, field) in mesg.fields.enumerated() {
            for j in 0 ..< field.getNumValues() {
                NSLog("\t\tField\(i) Index\(j) (\"\(field.getName() ?? "nil")\" Field#\(field.num) Value: \(field.getValue() ?? "nil") (raw value \(field.getRawValue(index: j) ?? "nil"))")
            }
        }

    }
    
    func didReadMesgDefinition(mesgDef: MesgDefinition) {
        NSLog("didReadMesgDefinition: Received Defn localMesgNum#\(mesgDef.localMesgNum) globalNum#\(mesgDef.globalMesgNum)");
        NSLog("\t\t has \(mesgDef.numFields) fields, \(mesgDef.numDevFields) developer fields, Mesg Size is \(mesgDef.getMesgSize()) bytes")
    }
    
    func didReadDeveloperFieldDescription(fieldDesc: DeveloperFieldDescription) {
        NSLog("New Developer Field Description\n" +
            "\t\tApp Id: \(fieldDesc.applicationId)" +
            "\t\tApp Version: \(fieldDesc.applicationVersion)" +
            "\t\tField Number: \(fieldDesc.fieldDefinitionNumber)")
    }
    
    func didReadFileIdMesg(_ mesg: FileIdMesg) {

    }
    
    func didReadFileCreatorMesg(_ mesg: FileCreatorMesg) {
        
    }
    
    func didReadTimestampCorrelationMesg(_ mesg: TimestampCorrelationMesg) {
        
    }
    
    func didReadSoftwareMesg(_ mesg: SoftwareMesg) {
        
    }
    
    func didReadSlaveDeviceMesg(_ mesg: SlaveDeviceMesg) {
        
    }
    
    func didReadCapabilitiesMesg(_ mesg: CapabilitiesMesg) {
        
    }
    
    func didReadFileCapabilitiesMesg(_ mesg: FileCapabilitiesMesg) {
        
    }
    
    func didReadMesgCapabilitiesMesg(_ mesg: MesgCapabilitiesMesg) {
        
    }
    
    func didReadFieldCapabilitiesMesg(_ mesg: FieldCapabilitiesMesg) {
        
    }
    
    func didReadDeviceSettingsMesg(_ mesg: DeviceSettingsMesg) {
        
    }
    
    func didReadUserProfileMesg(_ mesg: UserProfileMesg) {

    }
    
    func didReadHrmProfileMesg(_ mesg: HrmProfileMesg) {
        
    }
    
    func didReadSdmProfileMesg(_ mesg: SdmProfileMesg) {
        
    }
    
    func didReadBikeProfileMesg(_ mesg: BikeProfileMesg) {
        
    }
    
    func didReadConnectivityMesg(_ mesg: ConnectivityMesg) {
        
    }
    
    func didReadWatchfaceSettingsMesg(_ mesg: WatchfaceSettingsMesg) {
        
    }
    
    func didReadOhrSettingsMesg(_ mesg: OhrSettingsMesg) {
        
    }
    
    func didReadZonesTargetMesg(_ mesg: ZonesTargetMesg) {
        
    }
    
    func didReadSportMesg(_ mesg: SportMesg) {
        
    }
    
    func didReadHrZoneMesg(_ mesg: HrZoneMesg) {
        
    }
    
    func didReadSpeedZoneMesg(_ mesg: SpeedZoneMesg) {
        
    }
    
    func didReadCadenceZoneMesg(_ mesg: CadenceZoneMesg) {
        
    }
    
    func didReadPowerZoneMesg(_ mesg: PowerZoneMesg) {
        
    }
    
    func didReadMetZoneMesg(_ mesg: MetZoneMesg) {
        
    }
    
    func didReadDiveSettingsMesg(_ mesg: DiveSettingsMesg) {
        
    }
    
    func didReadDiveAlarmMesg(_ mesg: DiveAlarmMesg) {
        
    }
    
    func didReadDiveGasMesg(_ mesg: DiveGasMesg) {
        
    }
    
    func didReadGoalMesg(_ mesg: GoalMesg) {
        
    }
    
    func didReadActivityMesg(_ mesg: ActivityMesg) {
        
    }
    
    func didReadSessionMesg(_ mesg: SessionMesg) {
        
    }
    
    func didReadLapMesg(_ mesg: LapMesg) {
        
    }
    
    func didReadLengthMesg(_ mesg: LengthMesg) {
        
    }
    
    func didReadRecordMesg(_ mesg: RecordMesg) {

    }
    
    func didReadEventMesg(_ mesg: EventMesg) {
        
    }
    
    func didReadDeviceInfoMesg(_ mesg: DeviceInfoMesg) {
        
    }
    
    func didReadTrainingFileMesg(_ mesg: TrainingFileMesg) {
        
    }
    
    func didReadHrvMesg(_ mesg: HrvMesg) {
        
    }
    
    func didReadWeatherConditionsMesg(_ mesg: WeatherConditionsMesg) {
        
    }
    
    func didReadWeatherAlertMesg(_ mesg: WeatherAlertMesg) {
        
    }
    
    func didReadGpsMetadataMesg(_ mesg: GpsMetadataMesg) {
        
    }
    
    func didReadCameraEventMesg(_ mesg: CameraEventMesg) {
        
    }
    
    func didReadGyroscopeDataMesg(_ mesg: GyroscopeDataMesg) {
        
    }
    
    func didReadAccelerometerDataMesg(_ mesg: AccelerometerDataMesg) {
        
    }
    
    func didReadMagnetometerDataMesg(_ mesg: MagnetometerDataMesg) {
        
    }
    
    func didReadBarometerDataMesg(_ mesg: BarometerDataMesg) {
        
    }
    
    func didReadThreeDSensorCalibrationMesg(_ mesg: ThreeDSensorCalibrationMesg) {
        
    }
    
    func didReadOneDSensorCalibrationMesg(_ mesg: OneDSensorCalibrationMesg) {
        
    }
    
    func didReadVideoFrameMesg(_ mesg: VideoFrameMesg) {
        
    }
    
    func didReadObdiiDataMesg(_ mesg: ObdiiDataMesg) {
        
    }
    
    func didReadNmeaSentenceMesg(_ mesg: NmeaSentenceMesg) {
        
    }
    
    func didReadAviationAttitudeMesg(_ mesg: AviationAttitudeMesg) {
        
    }
    
    func didReadVideoMesg(_ mesg: VideoMesg) {
        
    }
    
    func didReadVideoTitleMesg(_ mesg: VideoTitleMesg) {
        
    }
    
    func didReadVideoDescriptionMesg(_ mesg: VideoDescriptionMesg) {
        
    }
    
    func didReadVideoClipMesg(_ mesg: VideoClipMesg) {
        
    }
    
    func didReadSetMesg(_ mesg: SetMesg) {
        
    }
    
    func didReadCourseMesg(_ mesg: CourseMesg) {
        
    }
    
    func didReadCoursePointMesg(_ mesg: CoursePointMesg) {
        
    }
    
    func didReadSegmentIdMesg(_ mesg: SegmentIdMesg) {
        
    }
    
    func didReadSegmentLeaderboardEntryMesg(_ mesg: SegmentLeaderboardEntryMesg) {
        
    }
    
    func didReadSegmentPointMesg(_ mesg: SegmentPointMesg) {
        
    }
    
    func didReadSegmentLapMesg(_ mesg: SegmentLapMesg) {
        
    }
    
    func didReadSegmentFileMesg(_ mesg: SegmentFileMesg) {
        
    }
    
    func didReadWorkoutMesg(_ mesg: WorkoutMesg) {
        
    }
    
    func didReadWorkoutSessionMesg(_ mesg: WorkoutSessionMesg) {
        
    }
    
    func didReadWorkoutStepMesg(_ mesg: WorkoutStepMesg) {
        
    }
    
    func didReadExerciseTitleMesg(_ mesg: ExerciseTitleMesg) {
        
    }
    
    func didReadScheduleMesg(_ mesg: ScheduleMesg) {
        
    }
    
    func didReadTotalsMesg(_ mesg: TotalsMesg) {
        
    }
    
    func didReadWeightScaleMesg(_ mesg: WeightScaleMesg) {
        
    }
    
    func didReadBloodPressureMesg(_ mesg: BloodPressureMesg) {
        
    }
    
    func didReadMonitoringInfoMesg(_ mesg: MonitoringInfoMesg) {
        
    }
    
    func didReadMonitoringMesg(_ mesg: MonitoringMesg) {
        
    }
    
    func didReadHrMesg(_ mesg: HrMesg) {
        
    }
    
    func didReadStressLevelMesg(_ mesg: StressLevelMesg) {
        
    }
    
    func didReadMemoGlobMesg(_ mesg: MemoGlobMesg) {
        
    }
    
    func didReadAntChannelIdMesg(_ mesg: AntChannelIdMesg) {
        
    }
    
    func didReadAntRxMesg(_ mesg: AntRxMesg) {
        
    }
    
    func didReadAntTxMesg(_ mesg: AntTxMesg) {
        
    }
    
    func didReadExdScreenConfigurationMesg(_ mesg: ExdScreenConfigurationMesg) {
        
    }
    
    func didReadExdDataFieldConfigurationMesg(_ mesg: ExdDataFieldConfigurationMesg) {
        
    }
    
    func didReadExdDataConceptConfigurationMesg(_ mesg: ExdDataConceptConfigurationMesg) {
        
    }
    
    func didReadFieldDescriptionMesg(_ mesg: FieldDescriptionMesg) {
        
    }
    
    func didReadDeveloperDataIdMesg(_ mesg: DeveloperDataIdMesg) {
        
    }
    
    func didReadDiveSummaryMesg(_ mesg: DiveSummaryMesg) {
        
    }
    
}
