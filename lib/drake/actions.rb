require_relative '../../lib/drake/actions/console'
require_relative '../../lib/drake/actions/packages'

require 'commander'

module Drake
  module Actions
    extend Commander::UI
    extend Drake::Console
    extend Drake::Packages

    def self.execute(command)
      $ssh.exec!(command) do |channel,stream,data|
        case stream
          when :stderr
            say_warning data
          else
            say data
        end
      end
      $?.exitstatus
    end
  end
end