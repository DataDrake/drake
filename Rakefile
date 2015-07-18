require_relative 'lib/drake'

task :build do
  system 'gem build drake.gemspec'
end

task :release => :build do
  system "gem push drake-#{Drake::VERSION}"
end