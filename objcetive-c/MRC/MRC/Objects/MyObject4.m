//
//  MyObject2.m
//  MRC
//
//  Created by ilya on 28.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "MyObject4.h"

@implementation MyObject4

-(void)dealloc {
    [_str release];
    [super dealloc];
}

@end
