require_relative 'LinkedList'
require_relative 'PaginationHelper'

puts "The first task"
list = LinkedList.new

list.append(3)
list.append(5)
list.append(10)
puts list.to_s #=> (3, 5, 10)
list.append_after(3, 15)
puts list.to_s #=> (3, 15, 5, 10)
list.append_after(10, 25)
puts list.to_s #=> (3, 15, 5, 10, 25)

list.delete(10)
puts list.find(25) #=> 25
p list.find(0) #=> nil
p list.append_after(11, 21) #=> nil
puts list.to_s #=> (3, 15, 5, 25)

puts "----------"

puts "The second task"

helper_one = PaginationHelper.new(['a','b','c','d','e','f'], 4)
puts "\nThe first example: #{helper_one}"
puts helper_one.page_count # 2
puts helper_one.item_count # 6
puts helper_one.page_item_count(0)  # 4, т.к нумерация страниц с 0
puts helper_one.page_item_count(1) # 2, последняя страница содержит 2 элемента
puts helper_one.page_item_count(2) # -1
#
# # page_index принимает индекс элемента и возвращает страницу, на которой этот элемент находится
#
puts helper_one.page_index(5) # 1
puts helper_one.page_index(2) # 0
puts helper_one.page_index(20) # -1
puts helper_one.page_index(-10) # -1

helper_two = PaginationHelper.new(['a','b','c','d','e','f', 'g', 'h', 'i'], 2)
puts "\nThe second example: #{helper_two}"
puts helper_two.page_count # 5
puts helper_two.item_count # 9
puts helper_two.page_item_count(0)  # 2
puts helper_two.page_item_count(1) # 2
puts helper_two.page_item_count(4) # 1
#
# # page_index принимает индекс элемента и возвращает страницу, на которой этот элемент находится
#
puts helper_two.page_index(5) # 2
puts helper_two.page_index(2) # 1
puts helper_two.page_index(20) # -1
puts helper_two.page_index(-10) # -1

helper_three = PaginationHelper.new(['a','b','c','d','e','f', 'g', 'h', 'i'], -3)
puts "\nThe third example: #{helper_three}"
puts helper_three.page_count # -3
puts helper_three.item_count # 9
puts helper_three.page_item_count(0)  # -1
puts helper_three.page_item_count(2) # -1
puts helper_three.page_item_count(-3) # -1
#
# # page_index принимает индекс элемента и возвращает страницу, на которой этот элемент находится
#
puts helper_three.page_index(0) # 0
puts helper_three.page_index(7) # -3
puts helper_three.page_index(11) # -1
puts helper_three.page_index(-10) # -1
