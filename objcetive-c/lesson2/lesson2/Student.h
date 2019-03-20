//
//  Student.h
//  lesson2
//
//  Created by ilya on 06.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject <StudentProtocol>

@property (nonatomic, getter=isMarried) BOOL married;

- (NSString*) sayHello;
- (void) test;
- (void) registrationNewStudent: (NSString*) name;
- (NSString*) regStudentWithName: (NSString* ) name andAge: (int) age;
@end

NS_ASSUME_NONNULL_END
