//
//  ViewController.m
//  lesson6
//
//  Created by ilya on 23.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSArray
    NSArray *array1 = [[NSArray alloc] initWithObjects:@1, @"hello", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@1, @"Hello", nil];
    NSArray *array3 = @[@1, @"hello"];
    NSArray *array4 = [NSArray arrayWithArray:array1];
    NSUInteger count = array1.count;
    id object = [array1 objectAtIndex:0];
    id object1 = array1.lastObject;
    id object2 = array1.firstObject;
    id object3 = array1[1];
    NSUInteger index = [array1 indexOfObject:@1];
    NSUInteger index1 = [array1 indexOfObjectIdenticalTo:@"hello"];
    // NSMutableArray
    NSMutableArray *marray1 = [@[@1, @3, @4] mutableCopy];
    [marray1 addObject:@"What"];
    [marray1 addObjectsFromArray:array1];
    [marray1 insertObject:@"asd" atIndex:1];
    [marray1 replaceObjectAtIndex:1 withObject:@2];
    
    // NSPointerArray - weak
    NSString *str = @"Hello";
    NSPointerArray *pointer = [NSPointerArray weakObjectsPointerArray];
    [pointer addPointer:(__bridge void *)str];
    NSString *str2 = (__bridge NSString *)[pointer pointerAtIndex:0];
    [pointer removePointerAtIndex:0];
    
    // NSDictionary
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@1, @"key1", @2, @"key2", nil];
    [dictionary objectForKey:@"key1"];
    [dictionary objectForKey:@"key333"]; //_Nullable
    // NSMutableDictionary
    NSMutableDictionary *mdictionary = [@{
                                    @"key1": @1,
                                    @"key2": @2
                                    } mutableCopy];
    
    [mdictionary setObject:@3 forKey:@"key3"];
    
    // NSMaptable
    
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    for (NSUInteger i = 0; i < 10; i++) {
        NSString *key = [NSString stringWithFormat:@"Key %ld", i];
        TestObject *object = [[TestObject alloc] init];
        [mapTable setObject:object forKey:key];
    }
    
    NSUInteger keysCount = mapTable.keyEnumerator.allObjects.count;
    NSUInteger objectsCount = mapTable.objectEnumerator.allObjects.count;
    
    // NSSet
    NSSet *set = @[@1, @2, @3];
    set.count;
    NSArray *objects = set.allObjects;
    id objectSet = set.anyObject;
    
    // NSMutableSet
    
    // NSCountedSet
    
    // shallow copy and deep copy
    // copyItems
    
    // Collection enumerations
    //NSEnumerator
    
    NSMutableArray *arr = [@[@1,@2,@3] mutableCopy];
}

@end
