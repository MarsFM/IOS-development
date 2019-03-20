//
//  RetainTracker.m
//  lesson3
//
//  Created by ilya on 09.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "RetainTracker.h"

@implementation RetainTracker

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"init: счётчик равен %lu.", (unsigned long)[self retainCount]);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Вызван dealloc. Прощайте!");
    [super dealloc];
}

@end
