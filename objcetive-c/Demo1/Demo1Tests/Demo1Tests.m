//
//  Demo1Tests.m
//  Demo1Tests
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DMObject1.h"

#import "DMObject2.h"

@interface Demo1Tests : XCTestCase
@property (nonatomic, retain) DMObject1 *obj1;
@property (nonatomic, retain) DMObject2 *obj2;
@end

@implementation Demo1Tests

- (void)setUp {
    DMObject1 *dObj1 = [DMObject1 new];
    self.obj1 = dObj1;
    self.obj2 = [[DMObject2 alloc] initWithObject:dObj1];
}

- (void)tearDown {
    [_obj1 release];
    [_obj2 release];
}

- (void)test1 {
    [self.obj2 testMethod];
    [self.obj2 updateProperty2];
    XCTAssertTrue([self.obj2.strPublic2 isEqualToString:@"string from object 2"]);
}

- (void)test2 {
    NSLog(@"start test2");
}

@end
