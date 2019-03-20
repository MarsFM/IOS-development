# Lesson1 (Xcode: breakpoints (exceptional, conditional), debugging console (changing variable values), code snippets)


# Lesson2 (Objective-C fundamentals: Classes, Protocols, Categories, Extension, Properties)


1. Classes: 

2. Protocols

3. Categories

4. Properties

### Понимать

- Value type, Reference type

- Stack, scope, Heap

### Полезности

```Objective-c
[[NameClass alloc] init] - Выделение памяти объекту, и инициализация
[receiver message];
objc_msgSend(receiver, selector);
& - получить адрес переменной
id<MyProtocolName> object = [[MyObject alloc] init];
id - Это любой объект
@required
@optional
conformsToProtocol
respondsToSelector

@synthesize - связ проперти с истанс переменной // Генерирует автоматически 
@dynamic
@synchronized

iVar property
init, dalloc
release, retain

use _property and not self.property
copy - копирование объектов

#import
@class - опережающим объявлением класса
```

### Что почитать

https://habr.com/ru/post/250955/
https://habr.com/ru/post/250977/



# Лекция 3, Memory management


### Понимать

alloc init, copy, mutable copy, new - Создание объекта и владение им +1

retain - владением объкта +1

release - отказ от владения -1

dealloc - удаление 0

autorelease - добавляет объект в pool, но я уже не буду владеть объектом
autoreleasepool

ROP - retainable object pointer

arc - не работает с Си указателями

scope - область памяти между { }

### Полезности

```Objective-c
-(void) setEngine: (Engine *) newEngine {
	[newEngine retain];
	[engine release]
	engine = newEngine
}

unsafe_unretained будет показывать на мусор, приведёт крэшу.

ЧТо прозойдёт если отправить autorelease pull отправить сообщение drain

[obj autorelease] - объект есть, но я не владею им

NSAutorealesePoll, drain

A(one) and B(two)
```

# Лекция 3, Foundation

```Objective-c
NSObject
NSInteger, NSUInteger, CGFloat, BOOL
nil, NULL, NSNull

NSString, NSMutableString, NSAttributeString, NSMutableAttributeString
NSNumber, NSNumberFormatter

NSDate
NSTimeInterval
NSDateFormatter
NSDateComponents
NSCalendar


NSURL, NSBundle
NSURLComponents
NSData
NSByteCountFormatter

NSUUID
NSEdgesInsets 
```















































