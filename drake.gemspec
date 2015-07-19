Gem::Specification.new do |s|
  s.name        = 'drake'
  s.version     = '0.0.1'
  s.date        = '2015-07-18'
  s.summary     = 'distributed Rake'
  s.description = 'drake, or distributed Rake, is a Ruby-based platform for daemonless configuration of Linux server environments'
  s.authors     = ['Bryan T. Meyers']
  s.email       = 'bmeyers@datadrake.com'
  s.files       =  Dir.glob('lib/**/*') + %w(LICENSE README.md)
  s.homepage    = 'http://rubygems.org/gems/drake'
  s.license     = 'GPL v3'
  s.executables = ['bin/drake']
  s.add_development_dependency 'rake'
  s.add_runtime_dependency 'commander'
  s.add_runtime_dependency 'net-ssh'
  s.add_runtime_dependency 'rake'
end