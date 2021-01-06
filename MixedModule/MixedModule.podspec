
Pod::Spec.new do |s|

  s.name         = "MixedModule"
  
  s.version      = "0.0.2"
  s.summary      = "MixedModule Demo for podspec."
  s.description  = <<-DESC
                    MixedModule desc.
                   DESC
  s.homepage     = "https://github.com/XiangqiTu"
  s.license      = "MIT"
  s.author       = { "XiangqiTu" => "110293734@qq.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "git@e.coding.net:MX-iOS/podsource/XiangqiTuDemo.git", :tag => s.version }

  s.source_files = "Classes/**/*.{h,m,swift}"
  s.swift_version = '5.0'
  s.module_name = s.name
  
  s.frameworks   =  [
    "UIKit",
    "Foundation",
  ]

  s.libraries    = [
    "z",
    "c++",
  ]

  s.requires_arc = true

  s.dependency 'Masonry', '1.1.0'
  
  
  s.script_phase = {
    :name => "Copy Swift Public Header",
    :script => <<-DESC
    # target directory is Project root directory
    target_dir=${SRCROOT}/Headers/Public/MixedModule/

    # Ensure the target include path exists
    mkdir -p ${target_dir}

    # Copy any file that looks like a Swift generated header to the include path
    cp ${DERIVED_SOURCES_DIR}/*-Swift.h ${target_dir}
    
    DESC
  }



  #Master 1
  #Release 1

  #Master 2

end
