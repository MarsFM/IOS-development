//
//  ViewController.m
//  Lesson7(NotificationCenter)
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [Person new];
    [self.person subscribeForNotifications];
    NSNotification *notification = [[NSNotification alloc] initWithName:@"TestNotification"
                                                                 object:self
                                                               userInfo:nil];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}


@end
