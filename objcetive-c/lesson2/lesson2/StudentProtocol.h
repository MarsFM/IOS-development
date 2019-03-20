//
//  StudentProtocol.h
//  lesson2
//
//  Created by ilya on 06.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StudentProtocol <NSObject>

@property (nonatomic, weak) NSString *name;

@end

NS_ASSUME_NONNULL_END
