//
//  DMObject1.m
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "DMObject1.h"

@interface DMObject1()
@property(nonatomic, retain) NSString *stringProtected;
@end

@implementation DMObject1

- (void)niewItem { }

- (void)protocolMethodRequired {
    NSLog(@"DMObject1 required");
}

- (void)protocolMethodOptional {
    NSLog(@"DMObject1 optional");
}

@end
