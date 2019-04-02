//
//  DMObject3.h
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMObjectProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMObject3 : NSObject
+ (void)test;
- (void)launchProtocolMethod:(id<DMObjectProtocol>) protocol;
- (void)newItem3;
@end

NS_ASSUME_NONNULL_END
