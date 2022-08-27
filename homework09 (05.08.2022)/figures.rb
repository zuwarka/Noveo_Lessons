class Figure
  attr_accessor :area
  include Comparable
  def initialize(my_area)
    @area = my_area
  end

  def <=>(other_shape)
    self.area <=> other_shape.area
  end
end
