require_relative 'module_triable'
require_relative 'proc_add_num'

class Object
  include Triable
end

puts "---The first task---"
add_num_1 = add_num(1) # proc
p add_num_1.call(3) # 4
p add_num_1.call(5.7) # 6.7
add_num_m10 = add_num(-10)
p add_num_m10.call(44) # 34
p add_num_m10.call(-20) # -30
puts "---The second task---"
p false.try { even? } # nil
p false.try(&:even?) # nil
p 2.try(&:even?) # true
p 1.try { |obj| obj + 1 } # 2
p true.try { |obj| obj + 1 } # nil
#p 1.try { |obj| obj + '' } # it still should raise error “String can't be coerced into Integer”
