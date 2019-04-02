//
//  DMObject2.h
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMObject1.h"
#import "DMObjectProtocol.h"
#import "DMObject3.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMObject2 : NSObject<DMObjectProtocol>

@property (nonatomic, copy) NSString *strPublic2;

- (id)initWithObject:(DMObject1 *)object;
- (void)testMethod;
- (void)updateProperty2;
- (void)testAutorelease:(DMObject3*)obj3;

@end

NS_ASSUME_NONNULL_END
