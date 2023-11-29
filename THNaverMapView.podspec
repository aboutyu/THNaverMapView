Pod::Spec.new do |spec|

  spec.name             = "THNaverMapView"
  spec.version          = "1.0.0"
  spec.summary          = "Super Easy Using Naver Map"
  spec.description      = "This is Super Easy Naver Map Wrapper View"
  spec.homepage         = "https://github.com/aboutyu/THNaverMapView"
  spec.license          = { :type => "MIT", :file => "LICENSE" }
  spec.author           = { "James" => "aboutyu@gmail.com" }
  spec.platform         = :ios, "11.0"
  spec.swift_version    = '5.0'
  spec.swift_version    = spec.swift_version.to_s
  spec.source           = { :git => "https://github.com/aboutyu/THNaverMapView.git", :tag => spec.version }
  spec.source_files     = 'THNaverMapView/lib/**/*'
  spec.dependency       'NMapsMap'

end
