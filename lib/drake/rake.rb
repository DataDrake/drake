require_relative '../../lib/drake'
require 'rake'

class DrakeProc
  include Drake::Actions
  def initialize( &block )
    @block = block
  end

  def arity
    @block.arity
  end

  def call(*args)
    Drake::Actions.module_exec *args, &@block
  end
end

module Rake
  class Task
    def enhance(deps=nil, &block)
      @prerequisites |= deps if deps
      @actions << DrakeProc.new(&block) if block_given?
      self
    end
  end
end

module Drake
  module RAKE
    def rake( task , host)
      if File.exists? "./#{task}.rake"
        rake = Rake.application
        rake.init
        path = `pwd`.strip + '/'
        rake.rake_require( "#{task}", [path])
        rake['default'].invoke
      else
        Drake::Error.new( "ERROR: #{task}.rake not found" )
      end
    end
  end
end