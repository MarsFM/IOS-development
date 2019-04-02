# CORE DATA

## Stack

1. NSManagedObjectModel - это схема база дынных

2. NSPersistentStoreStore - Постоянное хранилище(Считывет и записывает данные)

3. NSPersistentStoreCoordinator - мост между NSManagedObjectModel и NSPersistentStoreStore

4. NSManagedObjectContext - контекст это некий черновик в памяти

	- Контекст управляет жизненым циклом объектов

	- Управляемый объект не может существовать без связаного контекста, let managedContext = employee.managedObjectContext 

	- Контексты очень териториальны

	- Может быть несколько контекстов

	- Не потокобезопасный

5. NSpersistentContainer

## Понимать

NSManagedObject
NSFetchRequest
ViewContext
Validation in Core Data


## LINKS

https://fluffy.es/persist-data/

