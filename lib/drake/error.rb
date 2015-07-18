require_relative '../../lib/drake'

module Drake
  class Error
    attr_reader :message
    def initialize(message)
      @message = message
    end
  end
end