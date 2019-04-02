//
//  DMObject5.m
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "DMObject5.h"

@interface DMObject5()

@property (nonatomic, retain) DMObject4 *obj4;

@end

@implementation DMObject5

- (id)initWithObj4:(DMObject4*)obj4 {
    self = [super init];
    if (self) {
        _obj4 = [obj4 retain];
        [self setup];
    }
    
    return self;
}

- (void)setup {
    [_obj4 addObserver:self forKeyPath:@"iString"
               options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
               context:nil];
}

- (void)testCall {
    [self.obj4 setValue:@"set value from obj5 = new" forKey:@"iString"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"iString"]) {
        NSLog(@"1->%@ 2->%@ 3->%@", keyPath, object, change);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    [_obj4 removeObserver:self forKeyPath:@"iString"];
    [_obj4 release];
    [super dealloc];
}

@end
