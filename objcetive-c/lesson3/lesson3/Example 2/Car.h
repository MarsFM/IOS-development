//
//  Car.h
//  lesson3
//
//  Created by ilya on 09.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Engine.h"

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject

@property (nonatomic, retain) Engine *engine;

- (void)setEngine:(Engine *) newEngine;


@end

NS_ASSUME_NONNULL_END
