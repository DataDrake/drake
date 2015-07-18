require 'commander'
require_relative 'drake'

module Drake
  class CLI
    include Commander::Methods

    def run
      program :name ,'drake'
      program :version , Drake::VERSION
      program :description, 'drake, or distributed Rake, is a Ruby-based platform for daemonless configuration of Linux server environments'

      command :group do |c|
        c.syntax = 'drake group [group_name] <rake or task>'
        c.description = 'Run rakes or tasks for a specific group'
        c.action do |args, options|
          case args.length
            when 1
              say "Executing all rakes for group: #{args[0]}"
            when 2
              say "Executing #{args[1]} for group: #{args[0]}"
            else
              say_error "Usage: #{c.syntax}"
          end
        end
      end

      command :host do |c|
        c.syntax = 'drake host [host_name] <rake or task>'
        c.description  = 'Run rakes or tasks for a specific host'
        c.action do |args,options|
          case args.length
            when 2
            say "Executing #{args[1]} for host: #{args[0]}"
            else
            say_error "Usage: #{c.syntax}"
          end
        end
      end

      run!
    end
  end
end