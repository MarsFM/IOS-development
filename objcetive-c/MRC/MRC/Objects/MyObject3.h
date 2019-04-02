//
//  MyObject1.h
//  MRC
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyObject4.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyObject3 : NSObject

@property(nonatomic, retain) MyObject4 *obj4;

- (void)test;
- (void)test2;

@end

NS_ASSUME_NONNULL_END
