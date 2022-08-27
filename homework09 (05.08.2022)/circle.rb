require_relative 'figures'

class Circle < Figure
  def initialize(radius)
    @circle_r = radius
    @area = Math::PI * (@circle_r ** 2)
  end
end
