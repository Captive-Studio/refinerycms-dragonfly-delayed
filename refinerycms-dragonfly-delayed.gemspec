Gem::Specification.new do |s|
  s.name        = 'refinerycms-dragonfly-delayed'
  s.version     = '0.1.0'
  s.date        = '2016-03-31'
  s.summary     = 'Delay Dragonfly Jobs for RefineryCMS'
  s.authors     = ['Captive Studio Dev Team']
  s.email       = 'ninja@captive.fr'
  s.license     = 'MIT'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["Readme.md"]
  
  
  s.add_dependency             'activerecord', '~> 5.1.0'
  s.add_dependency             'dragonfly', '~> 1.1.0'
  s.add_dependency             'delayed_job_active_record'

  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'sqlite3'
end