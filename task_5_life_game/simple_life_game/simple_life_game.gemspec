Gem::Specification.new do |s|
  s.name        = 'simple_life_game'
  s.version     = '0.0.2'
  s.date        = '2014-11-16'
  s.summary     = "Conway's Game of Life"
  s.description = "Simple realization of Life game"
  s.authors     = ["Aleks Senkou"]
  s.email       = 'aleksey.senkou@gmail.com'
  s.files       = ["lib/simple_life_game.rb", "lib/cell.rb"]
  s.homepage    ='https://github.com/AleksSenkou/rubyroid_labs/tree/master/task_5_life_game/simple_life_game'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'

  s.required_ruby_version = Gem::Requirement.new(">= 2.1.3")
  s.required_rubygems_version = ">= 1.3.4"

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'colorize', '~> 0.7', '>= 0.7.3'
end