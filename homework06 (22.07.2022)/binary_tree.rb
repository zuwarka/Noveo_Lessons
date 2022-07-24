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
      root.add(value)
    end
  end

  def find(value, node = self.root)
    unless value.is_a?(Integer)
      raise 'Invalid value'
    end

    return if node.nil?
    if node.value < value
      return find(value, node.right)
    elsif node.value > value
      return find(value, node.left)
    else
      return node
    end
  end

  def delete(value, node = self.root)
    unless value.is_a?(Integer)
      raise 'Invalid value'
    end

    return if node.nil?
    if node.value < value
      node.right = delete(value, node.right)
    elsif node.value > value
      node.left = delete(value, node.left)
    else
      if node.left != nil && node.right != nil
        min_of_right_subtree = find_min(node.right)
        node.value = min_of_right_subtree.value
        node.right = delete(min_of_right_subtree.value, node.right)
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

  def to_s(node = self.root)
    if node != nil
      print "("
      to_s(node.left)
      print " #{node.value} "
      to_s(node.right)
      print ")"
    end
  end

  private
  def find_min(node = self.root)
    if node == nil
      return nil
    elsif node.left == nil
      return node
    end
    return find_min(node.left)
  end
end
