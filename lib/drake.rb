require_relative 'drake/cli'
require_relative 'drake/error'
require_relative 'drake/group'
require_relative 'drake/rake'

module Drake
  VERSION = '0.0.1'
  extend Drake::Group
  extend Drake::Rake
end