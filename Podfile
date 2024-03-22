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