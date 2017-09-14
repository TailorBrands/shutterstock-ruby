# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'shutterstock-ruby'
  s.version     = '0.4.1'
  s.platform    = Gem::Platform::RUBY
  s.date        = Date.today.to_s
  s.summary     = "An API wrapper for the Shutterstock API's"
  s.description = "A Gem to expose a wrapping API for the Shutterstock API's"
  s.authors     = ['Nadav Shatz']
  s.email       = 'nadav@tailorbrands.com'
  s.homepage    = 'https://github.com/TailorBrands/shutterstock-ruby'
  s.license     = 'MIT'

  s.files        = Dir[
    'README.md', 'LICENSE', 'Rakefile', 'lib/**/*'
  ]
  s.test_files   = Dir['spec/**/*']

  s.add_runtime_dependency 'rest-client', '~> 2'

  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  s.add_development_dependency 'faker', '~> 0'
end
