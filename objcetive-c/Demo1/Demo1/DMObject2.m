//
//  DMObject2.m
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "DMObject2.h"
#import "DMObject1+Category.h"
#import "DMObject3.h"

@interface DMObject2()
@property (nonatomic, retain) DMObject1 *obj1;
@end

@implementation DMObject2

- (id)initWithObject:(DMObject1 *)object {
    self = [super init];
    if (self) {
        _obj1 = object;
        [object release];
    }
    
    return self;
}

- (void)setStrPublic2:(NSString *)strPublic2 {
    [self willChangeValueForKey:@"strPublic2"];
    if (_strPublic2 != strPublic2) {
        [_strPublic2 release];
        _strPublic2 = [strPublic2 copy];
    }
    [self didChangeValueForKey:@"strPublic2"];
}

- (void)updateProperty2 {
    self.strPublic2 = self.obj1.stringPublic;
}

- (void)testMethod {
    SEL selUpdate = @selector(updateProperty);
    if ([self.obj1 respondsToSelector:selUpdate]) {
        [self.obj1 updateProperty];
    }
    
    DMObject3 *obj3 = [[DMObject3 new] autorelease];
    [self testAutorelease:obj3];
}

- (void)testAutorelease:(DMObject3*)obj3 {
//    [obj3 retain];
//    [obj3 newItem3];
//    [obj3 release];
    
    NSAutoreleasePool *pool = [NSAutoreleasePool autorelease];
    
    for (int i = 0; i <= 1000000; i++) {
        DMObject3 *obj3 = [[DMObject3 new] autorelease];
        [DMObject3 test];
        if (i == 1000) {
            [pool drain];
            break;
        }
    }
    
    @autoreleasepool {
        
    }
}

- (void)dealloc {
    [_obj1 release];
    [super dealloc];
}

- (void)protocolMethodRequired {
    NSLog(@"DMObject2 required");
}

@end
