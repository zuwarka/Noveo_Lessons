=begin

2. Нужно реализовать класс BinaryTree, в котором можно будет хранить элементы Node.
У класса должны быть методы для
-- добавления элемента в дерево,
-- удаления
-- и поиска элемента.
За тип данных можно принять Integer.
Методы желательно делать через чистую рекурсию, без циклов

=end
require_relative 'node'

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(value)
    iter = root

    if iter == nil
      @root = Node.new(value)
    else
      root.add_node(value)
    end
  end

  def find(value)
    root.find_node(value, root)
  end

  def delete(value)
    root.delete_node(value, root)
  end

  def to_s(node = self.root)
    if node != nil
      print "("
      to_s(node.left)
      print " #{node.value} "
      to_s(node.right)
      print ")"
    end
  end
end
