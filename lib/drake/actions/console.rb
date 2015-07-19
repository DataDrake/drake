module Drake
  module Console
    def command( command )
      puts `#{command}`
      if $?.success?
        say_ok '[COMMAND] Command completed successfully'
      else
        say_error '[COMMAND] Command failed'
      end
    end
    def script( script , args )
      copy( script )
      puts `#{script} #{args}`
      if $?.success?
        say_ok '[SCRIPT] Script completed successfully'
      else
        say_error '[SCRIPT] Script failed'
      end
    end
    def shell( command )
      puts `/bin/sh #{command}`
      if $?.success?
        say_ok '[SHELL] Command completed successfully'
      else
        say_error '[SHELL] Command failed'
      end
    end
  end
end