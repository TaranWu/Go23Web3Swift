#
# Be sure to run `pod lib lint Go23Web3Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Go23Web3Swift'
  s.version          = '0.3.0'
  s.summary          = 'Go23Web3Swift foundationality'

  s.description      = <<-DESC
    Go23Web3Swift Core lib
                       DESC

  s.homepage         = 'https://github.com/TaranWu/Go23Web3Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'TaranWu' => 'NA' }
  s.source           = { :git => 'https://github.com/TaranWu/Go23Web3Swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'
  s.platform         = :ios, "13.0"
  
  s.source_files = 'Go23Web3Swift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Go23Web3Swift' => ['Go23Web3Swift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'Alamofire'
  s.dependency 'Alamofire-Synchronous'
  s.dependency 'BigInt', '~> 3.0'
  s.dependency 'CryptoSwift', '~> 1.0'
  s.dependency 'libsodium', '~> 1.0.12'
  s.dependency 'PromiseKit', '~> 6.3.0'
  s.dependency 'Result'
  s.dependency 'secp256k1_ios', '~> 0.1.3'
      
end
