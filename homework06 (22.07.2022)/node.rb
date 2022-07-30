class Node
  attr_accessor :value, :left, :right
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def add_node(other_value)
    if other_value < value
      left.nil? ? @left = Node.new(other_value) : left.add_node(other_value)
    elsif other_value > value
      right.nil? ? @right = Node.new(other_value) : right.add_node(other_value)
    else
      nil
    end
  end

  def find_node(other_value, node)
    unless other_value.is_a?(Integer)
      raise 'Invalid value'
    end

    return if node.nil?
    if node.value < other_value
      return find_node(other_value, node.right)
    elsif node.value > other_value
      return find_node(other_value, node.left)
    else
      return other_value
    end
  end

  def delete_node(other_value, node)
    unless other_value.is_a?(Integer)
      raise 'Invalid value'
    end

    return if node.nil?
    if node.value < other_value
      node.right = delete_node(other_value, node.right)
    elsif node.value > other_value
      node.left = delete_node(other_value, node.left)
    else
      if node.left != nil && node.right != nil
        min_of_right_subtree = find_min(node.right)
        node.value = min_of_right_subtree.value
        node.right = delete_node(min_of_right_subtree.value, node.right)
      elsif node.left != nil
        node = node.left
      elsif node.right != nil
        node = node.right
      else
        node = nil
      end
    end
    return node
  end

  def to_s
    @value
  end

  private
  def find_min(node)
    return if node.nil?
    return node if node.left.nil?
    find_min(node.left)
  end
end
