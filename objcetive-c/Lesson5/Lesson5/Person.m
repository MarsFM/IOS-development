//
//  Person.m
//  Lesson5
//
//  Created by ilya on 18.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)description {
    return [NSString stringWithFormat:@"%@ %@ %ld, mom: %@ %@, dad: %@ %@",
            self.firstName, self.lastName, self.age, self.mother.firstName, self.mother.lastName, self.father.firstName, self.father.lastName];
}

@end
