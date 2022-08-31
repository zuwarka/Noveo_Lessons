# Используя 'active_record' гем, без создания самого рейлс приложения,
# реализовать 4 модели с соответствующими таблицами:
# - User. Атрибуты: username (уникальный и не может быть пустым);
# - Podcast. Атрибуты: name (уникальный и не может быть пустым),
# type (жанр подкаста, можно придумать несколько доступных жанров,
# плюсом будет использовать для них enum в модели);
# - Newspaper. Атрибуты: name (уникальный и не может быть пустым),
# type (тематика газеты, то есть тоже придумать несколько типов, используя enum метод в модели);
# - Subscription. Связующая таблица между пользователями и газетами/подскастами.
# Определяющая подписки пользователей. Особенность реалиции заключается в том,
# что с таблицами podcasts, newspapers должна быть связана полиморфной связью.
# На уровне модели будет иметь два belongs_to:
# belongs_to :user, belongs_to :subscribable, polymorphic: true
# Use postgreSQL


