require_relative 'figures'

class Triangle < Figure
  def initialize(base, height)
    @triangle_a = base
    @triangle_h = height
    @area = @triangle_a * (@triangle_h / 2)
  end
end
