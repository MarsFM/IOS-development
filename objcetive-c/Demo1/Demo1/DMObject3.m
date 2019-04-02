//
//  DMObject3.m
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "DMObject3.h"


@implementation DMObject3

- (void)launchProtocolMethod:(id<DMObjectProtocol>) protocol {
    
    [protocol protocolMethodRequired];
    
    if ([protocol respondsToSelector:@selector(protocolMethodOptional)]) {
        [protocol protocolMethodOptional];
    }
}

- (void)newItem3 {
    
}

+ (void)test {
    
}

@end
