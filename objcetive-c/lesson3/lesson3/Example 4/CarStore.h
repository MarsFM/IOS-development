//
//  CarStore.h
//  lesson3
//
//  Created by ilya on 09.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarStore : NSObject

@property (nonatomic, retain) NSMutableArray *inventory;

- (void)setInventory:(NSMutableArray *)newInventory;

@end

NS_ASSUME_NONNULL_END
