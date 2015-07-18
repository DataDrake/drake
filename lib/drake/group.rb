require_relative '../../lib/drake'
require 'json'

module Drake
  module Group
    def group( name , task = nil )
      if Dir.exists? './groups'
        if File.exists? "./groups/#{name}.json"
          begin
            file = File.open( "./groups/#{name}.json" ).read
            config = JSON.parse( file ,{symbolize_names: true})
            if config[:hosts]
              if config[:rakes]
                config[:hosts].each do |h|
                  config[:rakes].each do |r|
                    Drake.rake( r , h )
                  end
                end
              else
                Drake::Error.new 'ERROR: no rakes specified'
              end
            else
              Drake::Error.new 'ERROR: no hosts specified'
            end
          rescue
            Drake::Error.new "ERROR: failed to load group config file #{name}.json"
          end
        else
          Drake::Error.new "ERROR: config for group #{name} not found"
        end
      else
        Drake::Error.new 'ERROR: groups directory not found'
      end
    end
  end
end