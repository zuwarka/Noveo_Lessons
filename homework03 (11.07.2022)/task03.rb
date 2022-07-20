=begin
1. Привести до 5 примеров использования различных методов для массивов, хешей и интервалов.
Например, методы .select, .delete_if, .each_with_object.
2.  Установить гем Rails и запустить простой каркас rails приложения. (приложение в гитхаб добавлять не надо)
3. Сделать пару задач:
а) Написать функцию, которая преобразует строку в хеш.
Например, такая строка "a=1, b=2, c=3, d=4" станет { a: 1, b: 2, c: 3, d: 4}


Тестовые примеры:
* Input: “”, output = {}
* Input: "a=1, b=2, c=3, d=4", output = { a: 1, b: 2, c: 3, d: 4}


б) Дан массив с числами, необходимо вернуть массив в проставленными рангами для этих чисел.
Наибольшее число имеет ранг 1, следующее за ним ранг 2 и так далее.
Одинаковые числа имеют одинаковый ранг,
но при этом счетчик ранга увеличивается для следующего отличающего числа (тестовый вариант 2).
Тестовые примеры:
* ranks([9,3,6,10]) = [2,4,3,1]
* ranks([3,3,3,3,3,5,1]) = [2,2,2,2,2,1,7]
=end

def test_hash(my_hash)
  puts "Testing for hash - BEGIN"
  my_hash.each{|k,v| print "#{k}: #{v}\n"}
  puts "Testing for hash - END"
end

def str_to_hash(buf_string)
  pairs = buf_string.split(/[,=]/).map(&:strip).each_slice(2).map { |k,v| [k.strip.to_sym, v.strip] }
  puts result = Hash[pairs]
  test_hash(result)
end

def inputting_ranks(arr)
  ranks = []
  count_ranks = 1
  num_ranks = 1
  ranks.fill(0, 0, arr.length)

  arr.length.times do
    max_elem = arr.max
    ranks[arr.index(arr.max)] = num_ranks
    arr[arr.index(arr.max)] = -99999 # простите за костыль :С
    count_ranks += 1
    if max_elem != arr.max
      num_ranks = count_ranks
    end
  end
  print "Ranks array: ", ranks
end

def hash_methods()
  months = Hash.new( "month" )
  months = {"1" => "January", "2" => "February", "3" => "March", "4" => "April", "5" => "May", "6" => "June"}
  puts "The hash months has been created"
  puts "\nHas hash a key \"2\"?"
  puts months.has_key?("1")
  puts "\nOutput hash like string"
  puts months.inspect
  puts "\nRemove the first element and show it to us"
  puts months.shift
  puts "\nReturn the length of the hash"
  puts months.size
  puts "\nIs there in the hash element such as May?"
  puts months.value?("May")
end

def array_methods()
  array = Array.new(5) {|i| i*2}
  puts "The array has been created"
  puts "\nShow us the array"
  print array, "\n"
  puts "\nPush to the end of the array a 10"
  print array.push(10), "\n"
  puts "\nRemove the last element and show it to us"
  print array.pop, "\n"
  puts "\nDelete an element from index 3"
  print array.delete_at(3), "\n"
  puts "\nReverse the array"
  print array.reverse!, "\n"
end

def range_methods()
  rang = ('a'..'l')
  puts "The range of letters has been created"
  puts "\nShow us the range"
  print rang.to_a, "\n"
  puts "\nGo through the range with step 3"
  print rang.step(3).to_a, "\n"
  puts "\nIs there a letter 'g' in range?"
  print rang.include?('g'), "\n"
  puts "\nIs the word 'zulfia' cover the range?"
  print rang.cover?('zulfia'), "\n"
  puts "\nOutput max letter from range"
  print rang.max, "\n"
end

def choosing_task(task_num)
  case task_num
  when 1
    puts "You've chosen the first task"
    print "Input your string, in which one \"=\" is separator between keys and values and \",\" is separator between elements: "
    my_str = gets
    str_to_hash(my_str)
    print "\n"
  when 2
    puts "You've chosen the second task"
    #my_arr = [2, 2, 2, 4, 7, 81, 9, 9, 9, 0, -1]
    #my_arr = [9, 3, 6, 10]
    my_arr = [3,3,3,3,3,5,1]
    #my_arr = [3,3,3,3]
    #my_arr = [-1,-2,-3.5, 0.3, 0.3]
    print "Input array: ", my_arr, "\n"
    inputting_ranks(my_arr)
    print "\n"
  when 3
    puts "You've chosen the third task"
    puts "Now you'll see some methods for hashes, arrays, ranges"
    hash_methods
    array_methods
    range_methods
  else
    puts "Your num of the task is invalid"
    exit(-1)
  end
end

print "Input 1 or 2 or 3 to choose a task: "
num_of_def = gets.chomp.to_i
choosing_task(num_of_def)
