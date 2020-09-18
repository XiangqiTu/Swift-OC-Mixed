
Pod::Spec.new do |s|

  s.name         = "OCModule"

  s.version      = "0.0.2"
  s.summary      = "OCModule Demo for podspec."
  s.description  = <<-DESC
                    OCModule desc.
                   DESC
  s.homepage     = "https://github.com/XiangqiTu"
  s.license      = "MIT"
  s.author       = { "XiangqiTu" => "110293734@qq.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "git@e.coding.net:MX-iOS/podsource/XiangqiTuDemo.git", :tag => s.version }

  s.source_files = "Classes/**/*.{h,m}"
  s.requires_arc = true
  s.frameworks   =  [
    "UIKit",
    "Foundation",
  ]
  s.libraries    = [
    "z",
    "c++",
  ]

  s.dependency 'SwiftModule'

end
