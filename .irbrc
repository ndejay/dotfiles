# vim: set syntax=ruby

class Object
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end
