# Задание - Требуется сортировать фигуры по их площади. 

Из фигур есть:
Square (площадь - “квадрат” сторон),
Rectangle (площадь - ширина * длина),
Triangle (основание * высоту / 2),
Circle (pi * (R^2)), и произвольная
CustomShape (площадь просто задается).

Данная задача реализована достаточно просто. Мы описали родительский класс Figure, в котором перегрузили операторы сравнения, а также добавили метод вывода на консоль. Данный метод наследует всем прочим фигурам, позволяя нам объединять наследниклов (фигуры) в общие структуры данных и работать непосредственно с общими чертами (значение площади).
