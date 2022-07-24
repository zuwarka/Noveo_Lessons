class Node
  attr_accessor :value, :left, :right
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def add(other_value)
    if other_value < value
      left.nil? ? @left = Node.new(other_value) : left.add(other_value)
    elsif other_value > value
      right.nil? ? @right = Node.new(other_value) : right.add(other_value)
    else
      nil
    end
  end

  def to_s
    @value
  end
end
