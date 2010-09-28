Gem::Specification.new do |spec|
  spec.name = "screen_share"
  spec.version = 0.1
  spec.platform = Gem::Platform::RUBY
  spec.summary = "Simple screen sharing for conferences"
  spec.files =  Dir['lib/**/**'] + Dir['bin/*'] + Dir['vendor/**/**/**']
  spec.files.reject! { |fn| fn == "screen.png" } 
  
  spec.require_path = "lib"
  spec.executables = ["screen_share"]
  
  spec.add_dependency('sinatra', '1.0')
  spec.add_dependency('haml', '>= 3.0.18')
  
  spec.required_ruby_version = '>= 1.8.7'
  spec.required_rubygems_version = ">= 1.3.6"

  spec.author = "Jordan Byron"
  spec.email = "  jordan@ducksoupsoftware.com"
  spec.description = <<END_DESC
  Simple screen sharing for conferences
END_DESC
end
