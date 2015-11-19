module Licensable
  attr_reader :licensed_items

  def self.included(klass)
    klass.extend ClassMethods
  end

  def licensed_items=(val)
    @licensed_items = val
    @licensed_items.each do |k, v|
      instance_variable_set "@#{k}", v
    end
  end

  module ClassMethods
    def license(attr)
      define_method attr do
        val = instance_variable_get "@#{attr}"
        "#{val} ©Walt Disney"
      end

      define_method "#{attr}=" do |val|
        instance_variable_set "@#{attr}", val
      end
    end
  end
end