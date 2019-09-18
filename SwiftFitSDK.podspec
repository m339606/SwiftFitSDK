Pod::Spec.new do |s|
  s.name             = 'SwiftFitSDK'
  s.version          = '20.76.01'
  s.summary          = 'Swift Fit SDK'
  s.description      = <<-EOS
  This version of FitSDK is translated from Garmin’s FitSDK based on C#
  Reference version: 20.76.00
  EOS
  s.homepage         = 'https://github.com/m339606/SwiftFitSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mize' => 'm339606@hotmail.com' }
  s.source           = { :git => 'https://github.com/m339606/SwiftFitSDK.git', :tag => s.version.to_s }
  s.swift_version = '4.2'
   
  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/**/*'
  
end
