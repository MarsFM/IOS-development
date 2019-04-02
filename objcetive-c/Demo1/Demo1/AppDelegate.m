//
//  AppDelegate.m
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "AppDelegate.h"
#import "DMObject1.h"
#import "DMObject1+Category.h"
#import "DMObject2.h"
#import "DMObject3.h"
#import "DMObject4.h"
#import "DMObject5.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    DMObject1 *obj1 = [[DMObject1 new] retain];
    DMObject2 *obj2 = [[DMObject2 alloc] initWithObject:obj1];
    DMObject3 *obj3 = [DMObject3 new];
    [obj3 launchProtocolMethod:obj1];
    [obj3 launchProtocolMethod:obj2];
    
    DMObject4 *obj4 = [[DMObject4 alloc] init];
    DMObject5 *obj5 = [[DMObject5 alloc] initWithObj4:obj4];
    NSLog(@"iString 1.1 -> %@", [obj4 valueForKey:@"iString"]);
    [obj5 testCall];
    NSLog(@"iString 1.2 -> %@", [obj4 valueForKey:@"iString"]);
    
    
//    NSLog(@"numbaer1,1 -> %@", [obj4 valueForKey:@"number"]);
//    obj4.number = @(12);
//    NSLog(@"numbaer1,2 -> %@", [obj4 valueForKey:@"number"]);
//    [obj4 setValue:@(100) forKey:@"number"];
//    NSLog(@"numbaer1,3 -> %@", [obj4 valueForKey:@"number"]);
//    NSLog(@"numbaer1,4 -> %@", [obj4 valueForKey:@"aNumber"]);
//    obj4.number = @(10);
//    NSLog(@"numbaer1,5 -> %@", [obj4 valueForKey:@"aNumber"]);
//    [obj4 setValue:@(20) forKey:@"aNumber"];
//    NSLog(@"numbaer1,6 -> %@", [obj4 valueForKey:@"aNumber"]);
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
