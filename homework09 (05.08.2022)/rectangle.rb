require_relative 'figures'

class Rectangle < Figure
  def initialize(length, width)
    @rectangle_a = length
    @rectangle_b = width
    @area = @rectangle_a * @rectangle_b
  end
end
