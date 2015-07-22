module Drake
  module Console
    def command( command )
      $ssh.exec!(command) do |channel,stream,data|
        case stream
          when :stderr
            say_warning data
          else
            say data
        end
      end
      if $?.success?
        say_ok '[COMMAND] Command completed successfully'
      else
        say_error '[COMMAND] Command failed'
      end
    end
    def script( script , args )
      copy( script )
      $ssh.exec!("#{script} #{args}") do |channel,stream,data|
        case stream
          when :stderr
            say_warning data
          else
            say data
        end
      end
      if $?.success?
        say_ok '[SCRIPT] Script completed successfully'
      else
        say_error '[SCRIPT] Script failed'
      end
    end
    def shell( command )
      $ssh.exec!("/bin/sh #{command}") do |channel,stream,data|
        case stream
          when :stderr
            say_warning data
          else
            say data
        end
      end
      if $?.success?
        say_ok '[SHELL] Command completed successfully'
      else
        say_error '[SHELL] Command failed'
      end
    end
  end
end