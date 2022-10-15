class Node
  attr_accessor :next_node, :data
  def initialize(data, next_node = nil)
    @next_node = next_node
    @data = data
  end

  def to_s
    @data.to_s
  end
  # -------------------------------------------------- Добавлено от 12.08.22
  def reverse_node(reversed = nil)
    if next_node
      next_node.reverse_node(Node.new(data, reversed))
    else
      Node.new(data, reversed)
    end
  end

  def reverse_node!(node = self, reversed_list = reverse_node)
    self.data = reversed_list.data
    if next_node
      next_node.reverse_node!(node, reversed_list.next_node)
    else
      node
    end
  end
end
