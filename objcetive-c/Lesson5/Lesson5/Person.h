//
//  Person.h
//  Lesson5
//
//  Created by ilya on 18.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, weak) Person *mother;
@property (nonatomic, weak) Person *father;
@property (nonatomic, weak) NSString *firstName;
@property (nonatomic, weak) NSString *lastName;
@property (nonatomic,assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
