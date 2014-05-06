# vim: set syntax=ruby

require 'irbtools/more'
# require 'irb/completion'
# require 'pp'
# require 'wirb'

class Object
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end
