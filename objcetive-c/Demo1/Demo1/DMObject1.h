//
//  DMObject1.h
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMObjectProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMObject1 : NSObject<DMObjectProtocol>

@property (nonatomic, retain) NSString *stringPublic;

-(void) niewItem;

@end

NS_ASSUME_NONNULL_END
