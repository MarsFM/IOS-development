//
//  Student.m
//  lesson2
//
//  Created by ilya on 06.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "Student.h"

@interface Student()

@property(nonatomic, weak) NSString *aString;

@end

@implementation Student

@synthesize name;

- (id)init
{
    self = [super init];
    if (self) {
        self.aString = @"New STRING";
        name = @"New Student";
        NSLog(@"%@", name);
    }
    return self;
}

- (void) test {
    NSLog(@"Hello");
}

- (NSString*)sayHello {
    return @"Hello student";
}

- (void)registrationNewStudent:(NSString *)name {
    NSLog(@"%@", name);
}

- (NSString *)regStudentWithName:(NSString *)name andAge:(int)age {
    return [NSString stringWithFormat:@"Name=%@, and age=%d", name, age];
}

@end
