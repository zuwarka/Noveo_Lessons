class Figure
  attr_accessor :area
  def initialize(my_area)
    @area = my_area
  end

  def <=>(other_shape)
    self.area <=> other_shape.area
  end

  def to_s
    "#{@area}"
  end
end
