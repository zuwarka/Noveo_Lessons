**Задание №1 - Обращение к хэшу по ключу-строке**

Для этого мы дополнили существующий базовый класс Hash функцией with_indifferent_access, которая возвращает новый хэш класса-наследника HashWithIndifferentAccess. HashWithIndifferentAccess - это класс-наследник Hash с перегруженным оператором квадратных скобок для доступа к ключам.

Перегрузка сделана следующим образом: 
1. На вход подается ключ, который мы проверяем на принадлежность к классу Символов. Если true, то преобразуем его в строку, иначе оставляем как есть.
2. Далее смотрим сам хэш. Если ключ равен промежуточному ключу-строку, то просто возвращаем значение по ключу, иначе ничего не делаем.

**Задание №2 - Собственный класс Вектор**

Ничего необычного нет. Прописали класс Вектор, добавили нужные методы. Интерес представляет метод add. 

Реализован add следующим образром:
1. Проверяем размер двух векторов. Если они разные,Ю то возвращаем nil, иначе переходим дальше.
2. Проходимся по вектору, на каждом шаге прибавляем к нему значение того же элемента по тому же индексу.
3. Возвращаем новый вектор, с которым просуммировали другой вектор

Почти также реализованы и прочие методы, поэтому упоминть их не стоит.
