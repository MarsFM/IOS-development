//
//  ViewController.m
//  Blocks
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "ViewController.h"

typedef void(^TestVoidBlock)(void);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block NSInteger index = 0;
    
    TestVoidBlock testVoidBlock;
    testVoidBlock = ^{
        NSLog(@"%ld", (long)++index);
    };
    
    testVoidBlock();
    testVoidBlock();
    testVoidBlock();
    testVoidBlock();
    [self voidMethod];
    
    NSString*(^testStringBlock)(NSString*) = ^(NSString *par){
        NSLog(@"%@", par);
        return par;
    };
    
    NSLog(@"%@", testStringBlock(@"hello"));
    
    [self blockMethod:testVoidBlock];
}

- (void)voidMethod {
    NSLog(@"voidMethod");
}

- (NSString*)stringMethod:(NSString*)par {
    NSString *str = @"aerhet";
    NSLog(@"stringMethod");
    return str;
}

-(void)blockMethod:(TestVoidBlock)TestVoidBlock {
    NSLog(@"blockMethod");
}

@end
