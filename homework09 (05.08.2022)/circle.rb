require_relative 'figures'

class Circle < Figure
  include Math
  attr_writer :circle_r
  def initialize(radius)
    @circle_r = radius
    @area = PI * (@circle_r ** 2)
  end
end
