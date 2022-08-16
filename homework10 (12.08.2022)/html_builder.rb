class HtmlBuilder
  def initialize(&block)
    @result = ""
    @space = 2
    block.call(self) if block_given?
  end

  def html_doc!
    @result != "" ? @result = "<html>\n#{@result}</html>" : @result
  end

  def body(&block)
    @result += " " * @space + "<body>" + "\n"
    block.call(self)
    @result += " " * @space + "</body>" + "\n"
  end

  private

  def method_missing(method_name, *args, class_name: nil, &block)
    @result += "  " * @space + "<#{method_name}"

    unless class_name.nil?
      @result += " class=\"#{class_name}\""
    end

    if args.empty? and !block_given?
      @result += "/>"
    else
      @result += ">#{args.first}"
    end

    if block_given?
      @space -= 2
      block.call(self)
      @space += 2
    end

    if !args.empty? or block_given?
      @result += "</#{method_name}>"
    end
    @result += "\n"
  end
end

html_builder_one = HtmlBuilder.new do |html|
  html.h1('Hello!')
  html.p('This is paragraph')
  html.div('New div element')
end

html_builder_two = HtmlBuilder.new do |html|
  html.body do |body|
    body.h1('Hello!', class_name: 'h1-formatted margin-10')
    body.p('This is paragraph') do |p|
      p.p('Paragraph inside paragraph')
    end

    body.div('New div element') do |div|
      div.p('Paragraph in div')
    end

    body.div(class_name: 'empty-div')
  end
end

puts html_builder_one.html_doc!
puts "--------"
puts html_builder_two.html_doc!
puts HtmlBuilder.new.html_doc!

# <html>
#   <body>
#     <h1 class="h1-formatted margin-10">Hello!</h1>
#     <p>This is paragraph<p>Paragraph inside paragraph</p></p>
#     <div>New div element<p>Paragraph in div</p></div>
#     <div class="empty-div"/>
#   </body>
# </html>
