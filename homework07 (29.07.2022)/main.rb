require_relative 'string_editor'
require_relative 'indifferent_accessible'
puts "----The first task----"
str1 = 'string one'
str2 = 'string two'

str1.singleton_class.include(StringEditor)

puts str1.capitalize_each_word
#puts str2.capitalize_each_word #=> NoMethodError
puts "----The second task----"
hash1 = { a: 1, 'b' => 2, 1 => 3 }.make_indifferent_accessible! # можно вызвать метод так

p hash1['a'] #=> 1
p hash1[:b] #=> 2
p hash1[1] #=> 3

hash2 = { d: 55, true => 'True' }
p hash2.make_indifferent_accessible!['d'] # можно и так, сразу обращаться по ключу
p hash2[true] #=> True
