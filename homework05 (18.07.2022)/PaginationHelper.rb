# Нужно реализовать класс PaginationHelper, который позволит пагинировать массив.
# Класс получает в конструктор сам массив и число элементов для дробления массива.
#
# Пример работы:
# helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
#
# helper.page_count() # 2
# helper.item_count() # 6
# helper.page_item_count(0)  # 4, т.к нумерация страниц с 0
# helper.page_item_count(1) # 2, последняя страница содержит 2 элемента
# helper.page_item_count(2) # -1
#
# # page_index принимает индекс элемента и возвращает страницу, на которой этот элемент находится
#
# helper.page_index(5) # 1
# helper.page_index(2) # 0
# helper.page_index(20) # -1
# helper.page_index(-10) # -1

class PaginationHelper
  attr_accessor :m_array, :item_on_page

  def initialize(m_array, item_on_page)
    @m_array = m_array
    @item_on_page = item_on_page
  end

  def page_count
    puts "There are #{(@m_array.length.to_f / @item_on_page.to_f).ceil} pages"
  end

  def item_count
    puts "There are #{@m_array.length} items"
  end

  def page_count_for_class
    return (@m_array.length.to_f / @item_on_page.to_f).ceil
  end

  def page_item_count(page_number)
    if (page_number < page_count_for_class) && (page_number >= 0)
      if page_number == page_count_for_class - 1
        puts "There are #{@m_array.length - ((@m_array.length / item_on_page).floor * item_on_page)} on the page"
      else
        puts "There are #{@item_on_page} on the page"
      end
    else
      puts "No such page number, -1"
    end
  end

  def page_index(item_index)
    index = @m_array.length - item_index
    if index <= 0
      puts "No such index, -1"
    else
      puts "This element for that index stays on the #{(item_index / item_on_page).to_i} page"
    end
  end

  def to_s
    "#{@m_array}"
  end
end
