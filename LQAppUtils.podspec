Pod::Spec.new do |spec|
  spec.name         = 'LQAppUtils'
  spec.version      = '1.5.4'
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.author       = { "Quan Li" => "1083099465@qq.com" }
  spec.summary      = 'Extensions, base classes, tools commonly used in iOS development'
  spec.description  = <<-EOS
  LQAppUtils contains UI utils, common tool classes, MVVM framework, etc.
  EOS
  spec.homepage     = 'https://github.com/LqDeveloper/LQAppUtils'
  spec.source       = { :git => 'https://github.com/LqDeveloper/LQAppUtils.git', :tag => '1.5.4' }
  
  #spec.resource     = ""
  spec.requires_arc = true
  spec.platform     = :ios, "9.0"
  spec.swift_version = '5.0'
  spec.default_subspec = 'Core'
  spec.cocoapods_version = '>= 1.4.0' 

  spec.subspec  'Core' do |sub|
    sub.source_files  = "LQAppUtils/Core/**/*.swift"
    sub.frameworks  = "Foundation","UIKit","WebKit","Security"
    #"LocalAuthentication"
  end

  spec.subspec 'MVVM' do |sub|
    sub.source_files = "LQAppUtils/MVVM/**/*.swift"
    sub.dependency  "LQAppUtils/Core"
  end

  spec.subspec 'UIUtils' do |sub|
    sub.source_files = "LQAppUtils/UIUtils/**/*.swift"
    sub.dependency "LQAppUtils/Core"
  end
end


