# -- Нужно реализовать класс VersionManager. Конструктор опционально должен принимать строку - версию.
# -- Допустимые варианты строки: “{major}” (“1”), “{major}.{minor}” (“1.1”), “{major}.{minor}.{patch}” (“1.1.1”).
# -- В варианте типа "1.1.1.1.1" оставить только первые три значения версии.
# -- Если часть версии - не целое число (напр. "а.4.е"), то генерировать ошибку.
# -- Если версия не указана, то значение по умолчанию - “0.0.1”.

class String
  def is_integer?
    [                          # In descending order of likeliness:
      /^[-+]?[0-9]([0-9]*)?$/, # decimal
      /^0[0-7]+$/,             # octal
      /^0x[0-9A-Fa-f]+$/,      # hexadecimal
      /^0b[01]+$/              # binary
    ].each do |match_pattern|
      return true if self =~ match_pattern
    end
    return false
  end
end

class VersionManager
  def initialize(m_version = "0.0.1")
    @prev_version = m_version
    check_integer
    @major = m_version.split(/[.]/)[0].to_i
    @minor = m_version.split(/[.]/)[1].to_i
    @patch = m_version.split(/[.]/)[2].to_i
  end

  def major!
    @major += 1
    @minor = 0
    @patch = 0
  end

  def minor!
    @minor += 1
    @patch = 0
  end

  def patch!
    @patch += 1
  end

  def rollback!
    if @prev_version == nil
      raise 'Can not rollback to previous version'
    end
    @major = @prev_version.split(/[.]/)[0].to_i
    @minor = @prev_version.split(/[.]/)[1].to_i
    @patch = @prev_version.split(/[.]/)[2].to_i
  end

  def release
    "#{@major}.#{@minor}.#{@patch}"
  end

  private
  def check_integer
    unless @prev_version.split(/[.]/)[0].is_integer? &&
      @prev_version.split(/[.]/)[1].is_integer? &&
      @prev_version.split(/[.]/)[2].is_integer?
      raise 'Invalid version'
    end
  end
end
