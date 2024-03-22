platform :ios, '17.0'
use_frameworks!
inhibit_all_warnings!
workspace 'KueskiTest'

def networking
  pod 'Alamofire'
end

def ui
  pod 'Nuke'
end

target 'TheMovieDB' do
  project 'Apps/TheMovieDB/TheMovieDB'
  
  networking
  ui
  
end

## NetworkCore

target 'NetworkCore' do
  project 'Data/Core/NetworkCore/NetworkCore'
  
  networking
  
end

## Core

target 'APICore' do
  project 'Data/Core/APICore/APICore'
  
  networking
  
end

## Components

target 'UI' do
  project 'UI/UI/UI'
  
  ui
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.0'
      config.build_settings['SWIFT_VERSION'] = '5.4'
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
    end
  end
end