#
# Be sure to run `pod lib lint AMToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AMToast'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AMToast.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sxf/AMToast'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sxf' => '146811+owls@user.noreply.gitee.com' }
  s.source           = { :git => 'https://github.com/sxf/AMToast.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'AMToast/Classes/**/*.swift'
  s.frameworks = 'UIKit', 'Foundation'
#   s.dependency 'SnapKit'

  s.subspec 'resources' do |res|
    res.resource_bundles = {
      'AMToast' => ['AMToast/Assets/*.png']
    }
    
  end

end
