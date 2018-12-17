Pod::Spec.new do |s|
    
    s.name                       = 'JhtNewsChannel'
    s.version                    = '1.0.0'
    s.summary                    = '新闻频道栏/滚动栏'
    s.homepage                   = 'https://github.com/jinht/NewsChannel'
    s.license                    = { :type => 'MIT', :file => 'LICENSE' }
    s.author                     = { 'Jinht' => 'jinjob@icloud.com' }
    s.social_media_url           = 'https://blog.csdn.net/Anticipate91'
    s.platform                   = :ios
    s.ios.deployment_target      = '8.0'
    s.source                     = { :git => 'https://github.com/jinht/NewsChannel.git', :tag => s.version }
    s.resource                   = 'JhtNewsChannel_SDK/JhtNewsChannel.bundle'
    s.ios.vendored_frameworks    = 'JhtNewsChannel_SDK/JhtNewsChannel.framework'
    s.frameworks                 = 'UIKit'

end
