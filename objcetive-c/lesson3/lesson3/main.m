//
//  main.m
//  lesson3
//
//  Created by ilya on 08.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RetainTracker.h"
#import "CarStore.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"-----------------EXAMPLE 3-------------------");
        NSMutableArray *inventory = [NSMutableArray new];
        [inventory addObject:@"Honda sivic"];
        NSLog(@"%@", inventory);
        NSLog(@"inventory %lu", [inventory retainCount]);
        
        CarStore *superstore = [CarStore new];
        NSLog(@"superstore %lu", [superstore retainCount]);
        [superstore setInventory:inventory];
        [inventory release];
        NSLog(@"inventory %lu", [superstore retainCount]);
        
        NSLog(@"%@", [superstore inventory]);
    }
    return 0;
}
