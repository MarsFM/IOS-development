//
//  MyObject1.m
//  MRC
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "MyObject3.h"

@implementation MyObject3

- (void)test {
    self.obj4.str = @"new value";
}

- (void)test2 {
    MyObject4 *obj4 = [[MyObject4 alloc] init];
    obj4.str = @"test";
    [obj4 release];
}

- (void)dealloc {
    [_obj4 release];
    [super dealloc];
}

@end
