require_relative '../../lib/drake'
require 'json'
require 'commander/help_formatters'

module Drake
  module Group
    include Commander::UI
    def group( name , task = nil )
      if Dir.exists? './groups'
        if File.exists? "./groups/#{name}.json"
          begin
            file = File.open( "./groups/#{name}.json" ).read
            config = JSON.parse( file ,{symbolize_names: true})
            if config[:hosts]
              if config[:rakes]
                config[:hosts].each_with_index do |h , h_i|

                  say "\u{251c}\u{2500}[#{h_i}/#{config[:hosts].length}] Starting Host: #{h}"

                  config[:rakes].each_with_index do |r, r_i|

                    say "\u{2502}  \u{251c}\u2500[#{r_i+1}/#{config[:rakes].length}] Executing Rake: #{r}"

                    Drake.rake( r , h )

                    if (r_i + 1) < config[:rakes].length
                      say_ok "\u{2502}  \u{251c}\u2500[#{r_i+1}/#{config[:rakes].length}] Finished Rake: #{r}"
                      say "\u{2502}  \u{2502}"
                    else
                      say_ok "\u{2502}  \u{2514}\u2500[#{r_i+1}/#{config[:rakes].length}] Finished Rake: #{r}"
                    end

                  end

                  if (h_i + 1) < config[:hosts].length
                    say_ok "\u{251c}\u{2500}[#{h_i+1}/#{config[:hosts].length}] Finished Host: #{h}"
                    say "\u{2502}"
                  else
                    say_ok "\u{2514}\u{2500}[#{h_i+1}/#{config[:hosts].length}] Finished Host: #{h}"
                  end
                end
              else
                Drake::Error.new 'ERROR: no rakes specified'
              end
            else
              Drake::Error.new 'ERROR: no hosts specified'
            end
          rescue JSON::ParserError
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