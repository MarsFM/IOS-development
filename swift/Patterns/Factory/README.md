# Factory(Фабрика)

Пример из [proswift.ru][1]

[1]: https://proswift.ru/shablony-programmirovaniya-na-swift-factory/

Когда использовать:

1. Мы не до конца уверены объект какого типа нам необходим.
2. Мы хотим чтобы не родительский объект решал какой тип создавать, а его наследники.

Итак, шаблон проектирования Фабрика, или Factory используется для замены конструктора класса, абстрагируя процесс генерации объекта так, чтобы тип экземпляра мог быть определен во время выполнения программы.