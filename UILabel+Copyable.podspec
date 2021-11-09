
Pod::Spec.new do |s|
    s.name         = "UILabel+Copyable"
    s.version      = "2.0"
    s.summary      = "A simple category to add copy functionality to UILabel."

    s.description  = <<-DESC
    # Features
    - Supports Interface Builder
    - Supports long press gesture
    - Allows enable/disble the copy feature
    - Works with all UILabel objects already in your project
    DESC

    s.homepage     = "https://github.com/alexandreos/UILabel-Copyable"
    s.screenshots  = "https://raw.githubusercontent.com/alexandreos/UILabel-Copyable/screenshots/screenshot.png"
    s.license      = { :type => "MIT", :file => "LICENSE.md" }
    s.author             = { "Alexandre Santos" => "alexandre_o_s@yahoo.com" }
    s.social_media_url   = "https://twitter.com/alexandre_o_s"

    s.platform     = :ios
    s.source       = { :git => "https://github.com/alexandreos/UILabel-Copyable.git", :tag => "2.0" }

    s.source_files  = "UILabel+Copyable/**/*.{swift}"
    s.swift_version = '5.1'
    s.ios.deployment_target = '9.0'
    s.ios.framework = 'UIKit'

end
