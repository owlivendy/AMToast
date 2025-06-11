#
# Be sure to run `pod lib lint AMToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AMToast'
  s.version          = '0.3.1'
  s.summary          = 'A simple and customizable toast library for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AMToast is a simple and customizable toast library for iOS. It supports:
- Multiple positions (top and center)
- Queue-based display for multiple toasts
- Customizable styles (corner radius, background color)
- Dark mode support
- Customizable font size and style
- Custom view support
- Screen rotation adaptation
                       DESC

  s.homepage         = 'https://github.com/owlivendy/AMToast'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'owlivendy' => 'owlivendy@gmail.com' }
  s.source           = { :git => 'https://github.com/owlivendy/AMToast.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/AMToast/**/*.swift'
  s.resource_bundles = {
    'AMToast' => ['Sources/AMToast/Resources/*.png']
  }
  
  s.frameworks = 'UIKit'
#   s.dependency 'SnapKit'

end
