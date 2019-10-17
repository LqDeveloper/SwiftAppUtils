Pod::Spec.new do |spec|
  spec.name         = 'LQAppUtils'

  spec.version      = '1.2.2'
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.author       = { "Quan Li" => "1083099465@qq.com" }
  spec.summary      = 'Extensions, base classes, tools commonly used in iOS development'
  spec.homepage     = 'https://github.com/lqIphone/LQAppUtils'
  spec.source       = { :git => 'git@github.com:lqIphone/LQAppUtils.git', :tag => '1.2.2' }
  spec.source_files  = "LQAppUtils/Classes/**/*.swift"
  #spec.resource     = ""
  spec.requires_arc = true
  spec.platform     = :ios, "9.0"
  spec.swift_version = '5.0'
  spec.frameworks  = "Security","WebKit","LocalAuthentication"
end

