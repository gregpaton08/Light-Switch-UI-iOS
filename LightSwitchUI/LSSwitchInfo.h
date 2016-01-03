//
//  LSSwitchInfo.h
//  LightSwitchUI
//
//  Created by Greg Paton on 12/17/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSSwitchInfo : NSObject <NSCoding>

@property NSInteger switchId;       // System ID of the switch
//@property NSInteger switchIndex;    // Position of the switch as determined by the user
@property NSString *roomLabel;
@property NSString *deviceLabel;
@property BOOL status;

@end
