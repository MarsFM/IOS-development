//
//  TestObject.m
//  lesson6
//
//  Created by ilya on 23.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

- (id)init
{
    self = [super init];
    if (self) {
        self.string = @"hello";
    }
    return self;
}

@end
