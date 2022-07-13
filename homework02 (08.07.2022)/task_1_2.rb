=begin
1. Дано число n,
необходимо найти побитовое ИЛИ (сложение) для цепочки чисел от 0 до n.
То есть, складывать эти числа надо в их двоичной вариации.
Что-то типа 0 + 1 + 2 + 3 = 3, так как 00 + 01 + 10 + 11 = 11
Тестовые варианты:
* Input: 0, output = 0
* Input: 1, output = 1
* Input: 4, output = 7
* Input: 5, output = 7
* Input: 6, output = 7
* Input: 7, output = 7

2. Считать "#" символом для удаления прошлого символа.
Это значит, что строка "a#bc#d" преобразуется к виду "bd".
Необходимо написать метод для обработки строки с "#" символами.


Тестовые варианты:
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""
=end

def bitter_sum_row(num)
  s = 0
  s.upto(num) { |i| s = s | i }
  print "Total sum is: ", s
end

def delete_dash(m_str)
  stack = []
  res_str = []
  count_dash = 0

  m_str.chars.each do |i|
    stack << i
  end

  while stack.length != 0
    buf = stack.pop
    if buf == "#"
      count_dash += 1
    else
      while count_dash > 0
        buf = stack.pop
        if buf == "#"
          count_dash += 2
        end
        count_dash -= 1
      end
      res_str << buf
    end
  end

  print "Total string is: "
  print res_str.reverse.join("")
end

def choosing_task(task_num)
  if task_num == 1
    puts "You've chosen the first task"
    print "Input your n number: "
    n = gets.chomp.to_i
    bitter_sum_row(n)
    print "\n"
  end

  if task_num == 2
    puts "You've chosen the second task"
    print "Input your string: "
    str = gets
    delete_dash(str)
    print "\n"
  end
end

print "Input 1 or 2 to choose a task: "
num_of_def = gets.chomp.to_i
choosing_task(num_of_def)
