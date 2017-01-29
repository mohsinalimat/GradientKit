#
# Be sure to run `pod lib lint GradientKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GradientKit'
  s.version          = '0.1.0'
  s.summary          = 'A simple Kit to make working with Gradients super easy.'
  s.homepage         = 'https://github.com/aashishdhawan/GradientKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aashish Dhawan' => 'aashishdhawan@gmail.com' }
  s.source           = { :git => 'https://github.com/aashishdhawan/GradientKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/aashish_dhawan'
  s.ios.deployment_target = '8.0'
  s.source_files = 'GradientKit/Classes/**/*'
end
