//
//  ViewController.m
//  lesson3
//
//  Created by ilya on 08.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "ViewController.h"
#import "RetainTracker.h"
#import "Car.h"
#import "Engine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"---------------------------Example 1---------------------------");
    
    RetainTracker *tracker = [RetainTracker new];
    
    [tracker retain];
    NSLog (@"%lu", (unsigned long)[tracker retainCount]);
    
    [tracker retain]; // count: 3
    NSLog (@"%lu", (unsigned long)[tracker retainCount]);
    [tracker release]; // count: 2
    NSLog (@"%lu", (unsigned long)[tracker retainCount]);
    [tracker release]; // count: 1
    NSLog (@"%lu", [tracker retainCount]);
    [tracker retain]; // count 2
    NSLog (@"%lu", [tracker retainCount]);
    [tracker release]; // count 1
    NSLog (@"%lu", [tracker retainCount]);
    [tracker release]; // count: 0, вызов dealloc
    
    
    NSLog(@"---------------------------Example 2---------------------------");
    
    Car *car1 = [Car new];
    Engine *engine1 = [Engine new];
    NSLog(@"engine1 - %lu", [engine1 retainCount]);
    [car1 setEngine:engine1];
    NSLog(@"engine1 - %lu", [engine1 retainCount]);
    [engine1 release];
    NSLog(@"engine1 - %lu", [engine1 retainCount]);
    
    Engine *engine2 = [Engine new];
    NSLog(@"engine2 - %lu", [engine1 retainCount]);
    [car1 setEngine:engine2];
    [engine2 release];
    NSLog(@"engine2 - %lu", [engine2 retainCount]);
}

@end
