def sum(my_array)
  if my_array.length == 1
    return my_array[0]
  end
  my_array.shift + sum(my_array)
end

array_first = [0, 1, 2, 3, 4, 5]
puts "The first array and its sum: "
puts sum(array_first)

array_second = [-2, 0, 3, -3]
puts "The second array and its sum: "
puts sum(array_second)

array_third = [5]
puts "The third array and its sum: "
puts sum(array_third)

array_forth = [4.33, 5.77, 1.01]
puts "The third array and its sum: "
puts sum(array_forth)

'''
array_fifth = [1, "sample", 42]
puts "The forth array and its sum: "
puts sum(array_fifth)
'''
