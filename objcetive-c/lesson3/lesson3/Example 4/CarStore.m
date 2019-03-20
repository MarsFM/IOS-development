//
//  CarStore.m
//  lesson3
//
//  Created by ilya on 09.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "CarStore.h"

@implementation CarStore

- (void)setInventory:(NSMutableArray *)newInventory {
    [newInventory retain];
    [_inventory release];
    _inventory = newInventory;
}

- (void)dealloc {
    [_inventory release];
    [super dealloc];
}

@end
