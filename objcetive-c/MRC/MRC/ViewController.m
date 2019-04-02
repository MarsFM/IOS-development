//
//  ViewController.m
//  MRC
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "ViewController.h"
#import "MyObject3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyObject3 *obj3 = [MyObject3 new];
    [obj3 test];
}

- (void)dealloc {
    
    [super dealloc];
}

@end
