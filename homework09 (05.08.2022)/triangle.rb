require_relative 'figures'

class Triangle < Figure
  attr_writer :triangle_a, :triangle_h
  def initialize(base, height)
    @triangle_a = base
    @triangle_h = height
    @area = @triangle_a * (@triangle_h / 2)
  end
end
