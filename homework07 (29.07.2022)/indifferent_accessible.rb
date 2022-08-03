# Снова вернемся к задаче с хешом, которую мы делали,
# когда строковые и символьные ключи доступны по одинаковым ключам.
# Решить только надо теперь с использованием модуля,
# который будет дополнять текущий хеш дополнительным функционалом:

module IndifferentAccessible
  def [](key)
    return super(key) if include?(key)
    case key
    when Symbol then return super(key.to_s) if include?(key.to_s)
    when String then return super(key.to_sym) if include?(key.to_sym)
    end
  end
end

class Hash
  prepend IndifferentAccessible
  def make_indifferent_accessible!
    self
  end
end
