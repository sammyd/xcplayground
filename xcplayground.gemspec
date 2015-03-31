
require File.expand_path('../lib/xcplayground/gem_version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'xcplayground'
  s.version       = Xcplayground::VERSION
  s.summary       = "Create Xcode playgrounds"
  s.description   = %(
    xcplayground allows you to create Xcode playground documents from the
    command line or within Ruby.
  ).strip.gsub(/\s+/, ' ')
  s.authors       = ["Sam Davies"]
  s.email         = 'sam@visualputty.co.uk'
  s.files         = %w{ README.md LICENSE } + Dir["lib/**/*.rb"]
  s.homepage      = 'https://github.com/sammyd/xcplayground'
  s.license       = 'MIT'
  s.executables   = %{xcplayground}
  s.require_paths = %{lib}

  s.add_runtime_dependency 'builder', '~> 3.2', '>= 3.2.2'

  s.required_ruby_version = '>= 2.0.0'
end

