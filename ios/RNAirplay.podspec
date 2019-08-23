
Pod::Spec.new do |s|
  s.name         = "RNAirplay"
  s.version      = "1.0.0"
  s.summary      = "RNAirplay"
  s.description  = <<-DESC
                  RNAirplay, React Native Airplay Support
                   DESC
  s.homepage     = "https://github.com/mantaskaveckas/rn-airplay"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "../LICENSE" }
  s.author             = { "author" => "mantas.kaveckas@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/mantaskaveckas/rn-airplay.git", :tag => "master" }
  s.source_files  = "RNAirplay/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"

end
