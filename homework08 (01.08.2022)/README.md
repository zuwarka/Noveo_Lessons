# Задание №1 - Proc
Реализовать метод, который принимает один параметр с числом, а возвращает объект proc, который можно использовать для добавления переданного числа к другим числовым значениям.

Описание выполнения данного задания не требует пояснений.

# Задание №2 - try

В ruby есть safe navigation operator (&.), который позволяет избежать ошибки NoMethodError для nil-объекта: some_object&.even? (some_object = 1 => true; some_object = nil => nil).
Данный оператор удобен, когда есть вероятность, что объект будет nil, но дополнительно проверять это будет затратно и неудобно. Тем не менее, этот оператор не исключает ошибок в ситуации, когда метод не существует для объектов другого класса: false&.even? (NoMethodError). Целью данной задачи является реализация такого метода, который будет возвращать nil, если для объекта нельзя вызвать указанный метод. Метод должен находиться в модуле и получать параметром блок.

Реализация данного задания довольно проста и состоит из всего двух строк. В методе try мы вызываем yield self, тем самым выполняя блок, который передается в метод try. Иначе вызываем ошибку через rescue NoMethodError, возвращая nil.
