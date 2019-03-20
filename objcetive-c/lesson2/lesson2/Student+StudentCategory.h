//
//  Student+StudentCategory.h
//  lesson2
//
//  Created by ilya on 06.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (StudentCategory)

- (NSString*) loadStudentWithName:(NSString*) name;

@end

NS_ASSUME_NONNULL_END
