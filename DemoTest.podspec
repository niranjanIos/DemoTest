
Pod::Spec.new do |s|


s.name         = "PodSetup"
s.version      = "0.0.1"
s.summary      = "A short description of PodSetup."


s.homepage     = "http://EXAMPLE/PodSetup"
# s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


s.license      = "MIT (example)"
# s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


s.author             = { "Niranjan SIngh Patel" => "niranjan.infograins@gmail.com" }
# Or just: s.author    = "Niranjan SIngh Patel"
# s.authors            = { "Niranjan SIngh Patel" => "niranjan.infograins@gmail.com" }
# s.social_media_url   = "http://twitter.com/Niranjan SIngh Patel"


# s.platform     = :ios
# s.platform     = :ios, "5.0"

#  When using multiple platforms
# s.ios.deployment_target = "5.0"
# s.osx.deployment_target = "10.7"
# s.watchos.deployment_target = "2.0"
# s.tvos.deployment_target = "9.0"

s.source       = { :git => "https://github.com/niranjanIos/DemoTest.git", :tag => "#{s.version}" }


# s.resource  = "icon.png"
# s.resources = "Resources/*.png"

# s.preserve_paths = "FilesToSave", "MoreFilesToSave"


// # s.framework  = "SomeFramework"
//# s.frameworks = "SomeFramework", "AnotherFramework"

# s.library   = "iconv"
# s.libraries = "iconv", "xml2"


# s.requires_arc = true

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
# s.dependency "JSONKit", "~> 1.4"

end
