# Снова вернемся к задаче с хешом, которую мы делали,
# когда строковые и символьные ключи доступны по одинаковым ключам.
# Решить только надо теперь с использованием модуля,
# который будет дополнять текущий хеш дополнительным функционалом:
#
# module IndifferentAccessible
#   def [](key)
#     # your code here
#   end
# end
#
# class Hash
#   def make_indifferent_accessible!
#     # your code here
#   end
# end
#
# hash1 = { a: 1, 'b' => 2, 1 => 3 }.make_indifferent_accessible! # можно вызвать метод так
#
# puts hash1['a'] #=> 1
# puts hash1[:b] #=> 2
# puts hash1[1] #=> 3
#
# hash2 = { d: 3, true => 'True' }
# puts hash2.make_indifferent_accessible!['d'] # можно и так, сразу обращаться по ключу
# puts hash2[true] #=> True

module IndifferentAccessible
  def [](key)
    # честно украдено из Интернета
    #unless key.nil?
    #  dig(key.to_s) || dig(key.to_sym) # undefined method 'to_sym' for 1:Integer (NoMethodError)
    # предлагает to_sym заменить на to_s
    #end

    begin
      if self.include? key.to_s
        super(key.to_s)
      elsif self.include? key.to_sym # если убрать отлов ошибок, то будет возмущать на to_sym (см. выше)
        super(key.to_sym)
        #else # при обработке ошибок else можно убрать
        #super(key)
      end
    rescue
      super(key)
    end
  end
end

class Hash
  prepend IndifferentAccessible
  def make_indifferent_accessible!
    self
  end
end
