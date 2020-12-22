Pod::Spec.new do |s|
  s.name         = "LYCategory"
  s.version      = "1.0.0"
  s.summary      = "常用的分类"
  s.homepage     = "https://github.com/YoungerLi/LYCategory"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "LiYang" => "liyang2696@163.com" }
  s.social_media_url   = "https://youngerli.github.io"
  
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.requires_arc = true
  
  s.source       = { :git => "https://github.com/YoungerLi/LYCategory.git", :tag => "#{s.version}" }
  s.source_files = "LYCategory/*.{h,m}"
  s.public_header_files = "LYCategory/*.h"

  s.framework    = "UIKit"
end
