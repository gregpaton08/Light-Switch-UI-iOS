//
//  LSSwitchInfo.m
//  LightSwitchUI
//
//  Created by Greg Paton on 12/17/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import "LSSwitchInfo.h"

@implementation LSSwitchInfo

- (id)init {
    self = [super init];
    if (self) {
        [self setRoomLabel:@""];
        [self setDeviceLabel:@""];
        [self setStatus:NO];
    }
    return self;
}

@end
