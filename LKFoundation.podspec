
Pod::Spec.new do |s|
  s.name             = 'LKFoundation'
  s.version          = '1.0'
  s.summary          = 'A short description of LKFoundation.'
  s.homepage         = 'https://github.com/cnzlh/LKFoundation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhulinhua' => '20825520@qq.com' }
  s.source           = { :git => 'https://github.com/cnzlh/LKFoundation.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files     = 'LKFoundation/Classes/**/*'
  s.frameworks       = 'Foundation'
end
