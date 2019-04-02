//
//  DMObjectProtocol.h
//  Demo1
//
//  Created by ilya on 27.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DMObjectProtocol <NSObject>
@required
- (void)protocolMethodRequired;

@optional
- (void)protocolMethodOptional;
@end
