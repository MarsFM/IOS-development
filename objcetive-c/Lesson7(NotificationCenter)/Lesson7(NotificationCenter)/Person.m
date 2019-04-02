//
//  Person.m
//  Lesson7(NotificationCenter)
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)subscribeKVO {
    
}

- (void)subscribeForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationreceived)
                                                 name:@"TestNotification"
                                               object:nil];
    
}

- (void) notificationreceived {
    NSLog(@"Notification received");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
