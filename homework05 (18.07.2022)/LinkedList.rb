# Нужно реализовать класс LinkedList, в котором можно будет хранить элементы класса Node.
# У класса должны быть методы для добавления в конец и произвольную позицию, удаления и поиска элемента.
# Классы должны быть описаны в разных файлах. Примеры:
#
#
# list = LinkedList.new
#
# list.append(3)
# list.append(5)
# list.append(10)
# puts list #=> (3, 5, 10)
#
# list.append_after(3, 15)
# puts list #=> (3, 15, 5, 10)
# list.append_after(10, 25)
# puts list #=> (3, 15, 5, 10, 25)
#
# list.delete(10)
# list.find(25)
#
# У класса должен быть реализован метод to_s для лаконичного отображения.

require_relative 'Node'

class LinkedList
  def initialize
    @head = nil
  end

  def find(data)
    node = @head
    return nil unless nods # на случай, если пытаемся найти элемент в пустом списке
    return nil unless node.next_node
    return node if node.data == data

    while (node = node.next_node) # если следующий - nil, то
      return node if node.data == data # вернет nil, если не найдет значения в списке, так как node сейчас nil
    end
  end

  def append(data)
    if @head
      find_tail.next_node = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def append_after(element, data)
    node = find(element)
    return unless node

    old = node.next_node
    node.next_node = Node.new(data)
    node.next_node.next_node = old
  end

  def delete(data)
    if @head.data == data
      @head = @head.next_node
      return
    end

    node = find_before(data)
    node.next_node = node.next_node.next_node
  end

  def to_s
    node = @head
    print "(", node.data
    while (node = node.next_node)
      print ", ", node.data
    end
    print ")"
  end
      # -------------------------------------------------- Добавлено от 12.08.22
  def reverse(node = @head, previous = nil)
    return unless node
    return node unless node.next_node

    to_s(node.reverse_node)
  end

  def reverse!
    return unless @head
    return @head unless @head.next_node

    to_s(@head.reverse_node!)
  end
    
  private

  def find_before(data)
    node = @head
    return false unless node.next_node
    return node if node.next_node.data == data

    while (node = node.next_node)
      return node if node.next_node && node.next_node.data == data
    end
  end

  def find_tail
    node = @head
    return node unless node.next_node
    return node unless node.next_node while (node = node.next_node)
  end
end
