# Нужно реализовать класс HashWithIndifferentAccess, который позволит обращаться к ключу-строке по символу и наоборот.
# Для это следует расширить существующий класс Hash. Также добавить метод для перехода от обычного хеша к модифицированному.

# Тестовые варианты

# h = { a: 'apple' }.with_indifferent_access
# puts h['a'] # => apple
# hash[:foo] = 'bar'
# puts hash['foo']  # => bar

class HashWithIndifferentAccess < Hash
  def [](key) # key == :a => 'a'; key == 'a' => 'a'; real_key = :a
    buf_key = key.is_a?(Symbol) ? key.to_s : key
    self.each do |k, v|
      if k == buf_key.to_s || k == buf_key || k == buf_key.to_r
        return v
      end
    end
    nil #возвращает, если не выполнено условие в each
  end
end

class Hash
  def with_indifferent_access #: return HashWithIndifferentAccess
    HashWithIndifferentAccess[self]
  end
end

puts "The first task"
my_hash = Hash["a" => 1, 'b' => 22, 4 => 44, 'text' => 'sample text']
print "Your hash is: ", my_hash, "\n"
hash_with_indif_acc = my_hash.with_indifferent_access # hash_with_indif_acc.class => HashWithIndifferentAccess
print "Key = \"a\", value = ", hash_with_indif_acc["a"], "\n"
print "Key = :a, value = ", hash_with_indif_acc[:a], "\n"
print "Key = 'b', value = ", hash_with_indif_acc['b'], "\n"
print "Key = :b, value = ", hash_with_indif_acc[:b], "\n"
print "Key = \"4\", value = ", hash_with_indif_acc["4"], "\n"
print "Key = 4, value = ", hash_with_indif_acc[4], "\n"
print "Key = 'text', value = ", hash_with_indif_acc['text'], "\n"
print "Key = :text, value = ", hash_with_indif_acc[:text], "\n"
print "Key = 'foo', value = ", hash_with_indif_acc['foo'], "\n"
print "Key = :foo, value = ", hash_with_indif_acc[:foo], "\n"

# Нужно реализовать класс Vector с соответствующими методами по сложению,
# вычитанию векторов. Если оперируемые векторы разной длины, то это должна быть ошибка или nil результат.

# Тестовые варианты

# a = Vector.new([1, 2, 3])
# b = Vector.new([3, 4, 5])
# c = Vector.new([5, 6, 7, 8])

# a.add(b)      # should return a new Vector([4, 6, 8])
# a.subtract(b) # should return a new Vector([-2, -2, -2])
# a.dot(b)      # should return 1*3 + 2*4 + 3*5 = 26
# a.norm()      # should return sqrt(1^2 + 2^2 + 3^2) = sqrt(14)
# a.add(c)      # throws an nil
# a.to_s        # (1, 2, 3)

class Vector
  attr_reader :vector

  def initialize(vector)
    @vector = vector
  end

  def vector
    @vector
  end

  def [](index)
    vector[index]
  end

  def add!(other)
    if vector.size != other.vector.size
      return nil
    end

    index = 0
    vector.each do
      vector[index] += other[index]
      index += 1
    end
    vector
  end

  def subtract(other)
    if vector.size != other.vector.size
      return nil
    end

    index = 0
    res = Vector.new(vector)
    res.vector.each do |elem|
      res.vector[index] = elem - other[index]
      index += 1
    end
    res
  end

  def dot!(other)
    if vector.size != other.vector.size
      return nil
    end

    sum = 0
    index = 0
    vector.each do
      vector[index] *= other[index]
      sum += vector[index]
      index += 1
    end

    sum
  end

  def norm
    norma = 0
    vector.each {|i| norma += i**2}
    Math.sqrt(norma)
  end

  def to_s
    "(" + vector.join(", ") + ")"
  end
end

a = Vector.new([1, 2, 3])
b = Vector.new([3, 4, 5])
c = Vector.new([5, 6, 7, 8])

puts "The second task"
print "Vector a: ", a, "\n"
print "Vector b: ", b, "\n"
print "Vector c: ", c, "\n"
print "Add a+b: ", a.add!(b), "\n"
print "Now a.vector is: ", a, "\n"
print "Subtract a-b, new vector: ", a.subtract(b), "\n"
print "Dot a+b: ", a.dot!(b), "\n"
print "Now a.vector is: ", a, "\n"
print "Norm a: ", a.norm, "\n"
print "Add a+c: ", a.add!(c), "\n"
print "To string a: ", a.to_s, "\n"
