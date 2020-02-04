def type
  :project # set `:project` for xcodeproj and `:workspace` for xcworkspace
end

def project_path
  "UILabel+Copyable/UILabel+Copyable.xcodeproj"
end

def configuration
  "Debug"
end

def test_targets
  [
    :ios
  ]
end

def schemes
  {
    ios: 'UILabel+Copyable'
  }
end

def sdks
  {
    ios: 'iphonesimulator'
  }
end

def devices
  {
    ios: "name='iPhone 11',OS=13.3"
  }
end

def xcodebuild(type, name, scheme, configuration, sdk, destination, tasks, codecoverage, xcprety_args: '')

  # set either workspace or project flag for xcodebuild
  case type
  when :project
    project_type = "-project"
  when :workspace
    project_type = "-workspace"
  else
    abort "Invalid project type, use `:project` for xcodeproj and `:workspace` for xcworkspace."
  end

  sh "set -o pipefail && xcodebuild #{project_type} '#{name}' -scheme '#{scheme}' -configuration '#{configuration}' -sdk #{sdk} -destination #{destination} #{tasks} #{codecoverage} | xcpretty -c #{xcprety_args}"

end

def execute(tasks, platform, xcprety_args)

  # platform specific settings
  sdk = sdks[platform]
  scheme = schemes[platform]
  destination = devices[platform]
  codecoverage = "GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES"

  # check if xcodebuild needs to be run on multiple devices
  if destination.respond_to?('map')
    destination.map do |destination|
      xcodebuild type, project_path, scheme, configuration, sdk, destination, tasks, codecoverage, xcprety_args
    end
  else
    xcodebuild type, project_path, scheme, configuration, sdk, destination, tasks, codecoverage, xcprety_args
  end

end

desc 'Build, then run tests.'
task :test do
    sh "gem install xcpretty"
  test_targets.map do |platform|
    execute 'build test', platform, xcprety_args: '--test'
  end

  # sh "killall Simulator"

end
