require_relative 'licensable'
class Agency
  include Licensable
  license :movie
  license :book

  def initialize
    yield self if block_given?
  end
end