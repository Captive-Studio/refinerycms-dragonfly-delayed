Gem::Specification.new do |s|
  s.name        = 'refinerycms-dragonfly-delayed'
  s.version     = '0.0.1'
  s.date        = '2016-03-31'
  s.summary     = 'Delay Dragonfly Jobs for RefineryCMS'
  s.authors     = ['Captive Studio Dev Team']
  s.email       = 'ninja@captive.fr'
  s.license     = 'MIT'
  
  s.add_dependency             'activerecord', '~> 3.2.22'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'sqlite3'
end