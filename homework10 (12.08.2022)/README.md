# Задание 1 - html_builder

1. Доделать класс HtmlBuilder. Чтобы, к примеру, он принимал такие блоки:
html_builder = HtmlBuilder.new do |html|
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

html_builder.html_doc!

А генерировал такой html:
<html>
  <body>
    <h1 class="h1-formatted margin-10">Hello!</h1>
    <p>This is paragraph<p>Paragraph inside paragraph</p></p>
    <div>New div element<p>Paragraph in div</p></div>
    <div class="empty-div"/>
  </body>
</html>

Такой вызов тоже должен работать:
HtmlBuilder.new.html_doc! #=> ''
