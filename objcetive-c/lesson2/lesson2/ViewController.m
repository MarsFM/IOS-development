//
//  ViewController.m
//  lesson2
//
//  Created by ilya on 06.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Student *student = [Student new];
    [student test];
    NSLog(@"%@", [student sayHello]);
    [student registrationNewStudent:@"Ilya"];
    NSLog(@"%@", [student regStudentWithName:@"Ilya" andAge:29]);
    NSLog(@"%@", [student loadStudentWithName:@"ILYAAAA"]);
 
    id<StudentProtocol> st = [Student new];
    
    if ([st conformsToProtocol:@protocol(StudentProtocol)]) {
        NSLog(@"%@", st.name);
    }
    
    NSArray *arr = @[@1, @2, @3];
    
    for (NSNumber *el in arr) {
        NSLog(@"%@", el);
    }
    
    NSLog(@"%@", [arr objectAtIndex:1]);
    NSLog(@"%@", arr[1]);
    
    NSDictionary* dict = @{
                           @"name": @"Ilya",
                           @"age": @29,
                           };
    
    NSLog(@"%@", dict[@"name"]);
    
    for (NSString *key in [dict allKeys]) {
        id obj = dict[key];
        NSLog(@"%@", obj);
    }
    
}

@end
