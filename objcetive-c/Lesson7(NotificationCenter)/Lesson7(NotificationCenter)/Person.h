//
//  Person.h
//  Lesson7(NotificationCenter)
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)subscribeForNotifications;

- (void)subscribeKVO;

@end

NS_ASSUME_NONNULL_END
