require_relative 'figures'

class Square < Figure
  attr_writer :square_a
  def initialize(length)
    @square_a = length
    @area = @square_a ** 2
  end
end
