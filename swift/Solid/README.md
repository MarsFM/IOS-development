# SOLID

S - Single responsibility principle - Принцип единственной обязанности

O - Open Closed Principle - Принцип открытости/закрытости

L - Liskov substitution principle - Принцип подстановки Барбары Лисков

I - Interface segregation principle - Принцип разделения интерфейса

D - Dependency inversion principle - Принцип инверсии зависимостей

## Принципы

SOLID принципы советуют, как проектировать модули, т.е. кирпичикам, из которых строится приложение. Цель принципов — проектировать модули, которые:


способствуют изменениям
легко понимаемы
повторно используемы

## Подробнее

S - На каждый класс должны быть наложена одна единственная обязаность.

O - Класс должен быть закрыть для изменения, и открыт для расширения. Тесно связан с L и D принципами

L - Суть его в том что подклассы не могут замещать поведения базовых классов. Подтипы должны дополнять базовые типы.

I - Суть его в том что много специализированных интерфейсов лучше, чем один универсальный.

D - Суть его в том что зависимости внутри системы строятся на основе абстракций.

Модули верхних уровней не должны зависеть от модулей нижних уровней. 
Оба типа модулей должны зависеть от абстракций.
Абстракции не должны зависеть от деталей. Детали должны зависеть от абстракций.


### Материал

[Источник][1]

[1]: https://www.youtube.com/playlist?list=PL8P16_ArcbfXlQP7E1SaP4hK2daobRyOE

[Статья ХАБР][2]

[2]: https://habr.com/ru/post/348286/