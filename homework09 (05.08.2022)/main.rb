# Требуется сортировать фигуры по их площади. Из фигур есть:
# Square (площадь - “квадрат” сторон),
# Rectangle (площадь - ширина * длина),
# Triangle (основание * высоту / 2),
# Circle (pi * (R^2)), и произвольная
# CustomShape (площадь просто задается).
require_relative 'custom_shape'
require_relative 'rectangle'
require_relative 'square'
require_relative 'triangle'
require_relative 'circle'

shapes = [Square.new(3), Rectangle.new(3, 4), Triangle.new(5, 2), Circle.new(4), CustomShape.new(25)]
puts shapes.sort