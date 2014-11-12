Gem::Specification.new do |s|
  s.name        = 'time_updater'
  s.version     = '0.0.7'
  s.date        = '2014-11-12'
  s.summary     = "Time updater"
  s.description = "Monkeypatch'ing Time object in Ruby and adding functionality http://www.ruby-doc.org/core-2.1.4/Time.html#method-i-strftime"
  s.authors     = ["Aleks Senkou"]
  s.email       = 'aleksey.senkou@gmail.com'
  s.files       = ["lib/time_updater.rb"]
  s.homepage    ='http://rubygems.org/gems/time_updater'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'

  s.required_ruby_version = Gem::Requirement.new(">= 2.1.3")
  s.required_rubygems_version = ">= 1.3.4"

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'colorize', '~> 0.7', '>= 0.7.3'
end