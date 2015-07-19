require_relative '../../lib/drake/actions/console'
require_relative '../../lib/drake/actions/packages'

require 'commander'

module Drake
  module Actions
    extend Commander::UI
    extend Drake::Console
    extend Drake::Packages
  end
end