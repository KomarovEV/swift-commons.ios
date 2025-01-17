# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsObjC'
  s.summary               = 'A collection of Objective-C frameworks, utility classes and 3rd party libraries used by other modules of this library.'
  s.version               = '1.3.2'

  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.swift_version         = '4.2'

  s.cocoapods_version     = '>= 1.4.0'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/swift-commons.ios.git',
    tag: s.version.to_s
  }

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/ObjC/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.{h,m,c}'

  s.public_header_files = [
    # SSZipArchive
    base_dir + 'Sources/SSZipArchive/SSZipArchive.h',
    base_dir + 'Sources/SSZipArchive/SSZipArchiveDelegate.h',
    base_dir + 'Sources/SSZipArchive/minizip/unzip.h',
    base_dir + 'Sources/SSZipArchive/minizip/ioapi.h',
    # StreamTypedCoder
    base_dir + 'Sources/StreamTypedCoder/StreamTypedCoder.h',
    # TryCatchFinally
    base_dir + 'Sources/TryCatchFinally/TryCatchFinally.h'
  ]

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }
end
