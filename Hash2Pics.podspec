#
# Be sure to run `pod lib lint Hash2Pics.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Hash2Pics'
  s.version          = '0.1.3'
  s.summary          = 'Lib for creating crypto avatars.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: This is open-source lib for creating awesome avatars from any crypto address.
                       DESC

  s.homepage         = 'https://github.com/Multy-io/Hash2Pics-IOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pidji' => 'alexeevartsiom@gmail.com' }
  s.source           = { :git => 'https://github.com/Multy-io/Hash2Pics-IOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Hash2Pics/Classes/**/*'
  s.swift_version = '4.1'
  # s.resource_bundles = {
  #   'Hash2Pics' => ['Hash2Pics/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
