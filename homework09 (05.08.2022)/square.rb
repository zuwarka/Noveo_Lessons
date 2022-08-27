require_relative 'figures'

class Square < Figure
  def initialize(length)
    @square_a = length
    @area = @square_a ** 2
  end
end
