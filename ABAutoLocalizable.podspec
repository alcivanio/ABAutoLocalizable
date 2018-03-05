Pod::Spec.new do |spec|
    spec.name                   = 'ABAutoLocalizable'
    spec.version                = '0.1.2'
    spec.summary                = 'A simple way to make your app localizable'
    spec.platform               = :ios
    spec.license                = 'MIT'
    spec.ios.deployment_target  = '8.0'
    spec.authors                = 'Alcivanio'
    spec.homepage               = 'https://github.com/alcivanio/ABAutoLocalizable.git'
    spec.social_media_url       = 'http://twitter.com/Alcivanio'
    spec.source_files           = 'ABAutoLocalizable/**/*.{swift}'
    spec.source                 = { :git => 'https://github.com/alcivanio/ABAutoLocalizable.git', :tag => spec.version.to_s }
    
    spec.framework      = 'UIKit'
    spec.requires_arc   = true
    
    
    
end


