Pod::Spec.new do |spec|
  spec.name         = 'SwiftAppUtils'
  spec.version      = '1.0.9.2'
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.author       = { "Quan Li" => "1083099465@qq.com" }
  spec.summary      = 'Extensions, base classes, tools commonly used in iOS development'
  spec.description  = <<-EOS
  LQAppUtils contains UI utils, common tool classes, MVVM framework, etc.
  EOS
  spec.homepage     = 'https://github.com/LqDeveloper/SwiftAppUtils'
  spec.source       = { :git => 'https://github.com/LqDeveloper/SwiftAppUtils.git', :tag => "#{spec.version}" }
  
  spec.requires_arc = true
  spec.platform     = :ios, "9.0"
  spec.swift_version = '5.0'
  spec.default_subspec = 'Core'
  # spec.cocoapods_version = '>= 1.4.0' 

  spec.subspec  'AppExtension' do |sub|
    sub.source_files  = "LQAppUtils/Core/**/*.swift"
    # sub.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => '-D APP_EXTENSION' }
  end

  spec.subspec  'Core' do |sub|
    sub.source_files  = "LQAppUtils/Core/**/*.swift"
    sub.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => '-D APP_CORE' }
  end

  spec.subspec 'MVVM' do |sub|
    sub.source_files = "LQAppUtils/MVVM/**/*.swift"
    sub.dependency  "SwiftAppUtils/Core"
  end
end


