Gem::Specification.new do |s|
  s.name        = 'refinerycms-dragonfly-delayed'
  s.version     = '0.0.1'
  s.date        = '2016-03-31'
  s.summary     = 'Delay Dragonfly Jobs for RefineryCMS'
  s.authors     = ['Captive Studio Dev Team']
  s.email       = 'ninja@captive.fr'
  s.license     = 'MIT'
  
  s.add_dependency             'activerecord', '~> 3.2.22'
  s.add_dependency             'dragonfly', '~> 0.9.14'
  s.add_dependency             'delayed_job_active_record'

  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.0.dev'
  
end