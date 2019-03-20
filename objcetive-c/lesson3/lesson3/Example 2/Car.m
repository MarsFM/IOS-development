//
//  Car.m
//  lesson3
//
//  Created by ilya on 09.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)setEngine:(Engine *)newEngine {
    [newEngine retain];
    [_engine release];
    _engine = newEngine;
}

@end
