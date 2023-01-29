def correct_insert(new_value, std_type):
    if isinstance(new_value, std_type):
        return new_value
    else:
        raise ValueError(f"ожидается значение типа {std_type}")

class Book:
    """ Базовый класс книги. """

    def __init__(self, name: str, author: str):
        self.__name = name
        self.__author = author

    def __str__(self):
        return f"Книга {self.name}. Автор {self.author}"

    def __repr__(self):
        return f"{self.__class__.__name__}(name={self.__name!r}, author={self.__author!r})"
    def set_cant(self, new_name: str):
        pass
    def get_name(self):
        return self.__name
    def get_author(self):
        return self.__author
    name = property(get_name, set_cant)
    author = property(get_author, set_cant)

class PaperBook(Book):
    def __init__(self, name: str, author: str, pages: int):
        self._Book__name = name
        self._Book__author = author
        self.__pages = correct_insert(pages, int)

    def get_pages(self):
        return self.__pages

    def set_pages(self, new_size: int):
        if isinstance(new_size, int):
            self.__pages = new_size
        else:
            raise ValueError("Поврежденные книги не обрабатываем,"
                             "вводите целое число страниц")
    pages = property(get_pages, set_pages)


class AudioBook(Book):
    def __init__(self, name: str, author: str, duration: float):
        self._Book__name = name
        self._Book__author = author
        self.__duration = correct_insert(duration, float)
    def __str__(self):
        return f"Аудиокнига {self._Book__name}. Автор {self.self._Book__author}"

    def get_duration(self):
        return self.__duration

    def set_duration(self, new_size: float):
        if isinstance(new_size, float):
            self.__duration = new_size
        else:
            raise ValueError("длительность аудиокниги - значение типа float")

    duration = property(get_duration, set_duration)

b = PaperBook("ger","Daniel",2)
c = AudioBook("ger2","Daniel2",2.15)
b.author = "aaa"
c.name = "aaa"
print(b)
print(c.name)
