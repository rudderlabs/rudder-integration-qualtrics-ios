Pod::Spec.new do |s|
    s.name             = 'Rudder-Qualtrics'
    s.version          = '1.0.0'
    s.summary          = 'Privacy and Security focused Segment-alternative. Qualtrics Native SDK integration support.'

    s.description      = <<-DESC
    Rudder is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.
    DESC

    s.homepage         = 'https://github.com/rudderlabs/rudder-integration-qualtrics-ios'
    s.license          = { :type => "Apache", :file => "LICENSE" }
    s.author           = { 'Rudderlabs' => 'arnab@rudderlabs.com' }
    s.source           = { :git => 'https://github.com/rudderlabs/rudder-integration-qualtrics-ios.git', :tag => 'v1.0.1' }
    s.platform         = :ios, "9.0"

    s.source_files = 'Rudder-Qualtrics/Classes/**/*'

    s.dependency 'Rudder'
end
