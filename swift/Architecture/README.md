# IOS Архитектура

Построение архитектуры  - это делегирование обязаностей классам и их декомпазирование.

Цели, которые решает декомпазирование.

- Тестируемость

- Поддержка кода

- Мастабирование проекта

- Понимание кода

Популярные архитектуры

- MVC

- MVP 

- MVVM

- VIPER

### Основные моменты в ArchitectureWithZero

 - ChatDataProvider - работает с данными, создаём протакол для отображения данных в ChatDataSource. Содержит в себе массив сообщений

 - ChatDataSource - Выносим логику UITableViewDataSource сюда, содержит ChatDataProvider и вызываем его методы

 - ChatInteractor - Более мелкая логика, вызываем в ChatController. Содержит ChatDataProvider

 - ChatController - Содержит ChatViewController, ChatDataProvider, ChatDataSource(чтобы подписаться под delegate), ChatInteractor
 
 - ChatViewController - Содержит ChatController

### Материалы

https://www.pvsm.ru/ios/117313 - Архитектурные паттерны в iOS

https://www.redmadrobot.ru/fyi/architecture_ios

https://habr.com/ru/company/badoo/blog/281162/

https://habr.com/ru/post/358412/