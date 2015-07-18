require_relative '../../lib/drake'

module Drake
  module Rake
    def rake( task , host)
      if File.exists? "#{task}.rake"
        output =  `rake --trace REMOTE_HOST=#{host} -f #{task}.rake 2>&1`
        output.each_line do |l|
          say_warning "\u{2502}  \u{2502}  #{l.strip}"
        end
      else
        Drake::Error.new( "ERROR: #{task}.rake not found" )
      end
    end
  end
end