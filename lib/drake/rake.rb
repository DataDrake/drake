require_relative '../../lib/drake'

module Drake
  module Rake
    def rake( task , host)
      if File.exists? "#{task}.rake"
        s = `rake REMOTE_HOST=#{host} -f #{task}.rake 2>&1`
        puts s
      else
        Drake::Error.new( "ERROR: #{task}.rake not found" )
      end
    end
  end
end