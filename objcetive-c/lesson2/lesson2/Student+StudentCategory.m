//
//  Student+StudentCategory.m
//  lesson2
//
//  Created by ilya on 06.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "Student+StudentCategory.h"

@implementation Student (StudentCategory)

- (NSString *)loadStudentWithName:(NSString *)name {
    return [NSString stringWithFormat:@"%@, %@", name, self.name];
}

@end
