require_relative 'figures'

class Rectangle < Figure
  attr_writer :rectangle_a, :rectangle_b
  def initialize(length, width)
    @rectangle_a = length
    @rectangle_b = width
    @area = @rectangle_a * @rectangle_b
  end
end
