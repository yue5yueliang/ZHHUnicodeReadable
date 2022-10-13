#
# Be sure to run `pod lib lint ZHHUnicodeReadable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZHHUnicodeReadable'
  s.version          = '0.0.1'
  s.summary          = '解决Unicode编码不能在Xcode控制台显示中文的问题，导入工程，不需引用'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  解决Xcode控制台对于Unicode编码不能正常显示中文的问题，只需要将文件导入工程，不需要引用，即可正常志显示Unicode编码的中文数据
                       DESC

  s.homepage         = 'https://github.com/yue5yueliang/ZHHUnicodeReadable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yue5yueliang' => '136769890@qq.com' }
  s.source           = { :git => 'https://github.com/yue5yueliang/ZHHUnicodeReadable.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ZHHUnicodeReadable/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZHHUnicodeReadable' => ['ZHHUnicodeReadable/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
