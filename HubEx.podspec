Pod::Spec.new do |s|
  s.name             = 'HubEx'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BloggerBird.'
  s.homepage         = 'https://github.com/ricardorauber/StrapiSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'HubEx' => 'support@HubEx.com' }
  s.source           = { :git => 'https://github.com/ricardorauber/StrapiSwift', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/HubEx/**/*'
end
