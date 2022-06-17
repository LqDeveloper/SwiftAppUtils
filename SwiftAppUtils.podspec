Pod::Spec.new do |spec|
  spec.name         = 'SwiftAppUtils'
  spec.version      = '1.2.0'
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

  spec.subspec  'Core' do |sub|
    sub.source_files  = "SwiftAppUtils/Core/**/*.swift"
    sub.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => '-D APP_CORE' }
  end

  spec.subspec 'UIKitUtils' do |sub|
    sub.source_files = "SwiftAppUtils/UIKitUtils/**/*.swift"
    sub.dependency  "SwiftAppUtils/Core"
  end

  spec.subspec 'SwiftUIUtils' do |sub|
    sub.platform = :ios, "13.0"
    sub.source_files = "SwiftAppUtils/SwiftUIUtils/**/*.swift"
    sub.dependency  "SwiftAppUtils/Core"
    sub.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => '-D APP_SwiftUIUtils' }
    sub.frameworks = 'SwiftUI'
  end
end


