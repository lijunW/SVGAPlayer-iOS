#source 'https://github.com/CocoaPods/Specs.git'
source 'https://cdn.cocoapods.org/'

platform :ios, '12.0'

target 'SVGAPlayer' do

    pod 'SSZipArchive', '~> 2.1.4'
    pod 'Protobuf', '= 3.22.1'

end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
end
