Pod::Spec.new do |s|

  s.name         = "SwiftModule"

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

  s.source_files = "Classes/**/*.{swift}"
  s.swift_version = '5.0'
  s.module_name = s.name
  s.requires_arc = true

  s.dependency 'MixedModule'

  s.script_phase = {
    :name => "Copy Swift Public Header",
    :script => <<-DESC
    # target directory is Project root directory
    target_dir=${SRCROOT}/Headers/Public/SwiftModule/

    # Ensure the target include path exists
    mkdir -p ${target_dir}

    # Copy any file that looks like a Swift generated header to the include path
    cp ${DERIVED_SOURCES_DIR}/*-Swift.h ${target_dir}
    
    DESC
  }
  
end
