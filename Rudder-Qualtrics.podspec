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
    s.source           = { :git => 'https://github.com/rudderlabs/rudder-integration-qualtrics-ios.git', :tag => 'v1.0.0' }
    s.platform         = :ios, "11.0"

    s.source_files = 'Rudder-Qualtrics/Classes/**/*'
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.dependency 'Rudder'
    s.dependency 'Qualtrics', '2.0.0'
end
