# Создать модуль с набором полезных методов для строк.
# Например, чтобы модуль содержал метод capitalize_each_word:
#
# вариант использования
#
#str1 = 'string one'
#str2 = 'string two'
#
# Your code here
#
#str1.capitalize_each_word => "String One"
#str2.capitalize_each_word => NoMethodError

module StringEditor
  def capitalize_each_word
     self.split(' ').map(&:capitalize).join(' ')
  end
end
