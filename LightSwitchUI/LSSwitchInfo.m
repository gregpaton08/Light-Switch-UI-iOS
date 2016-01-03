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
        [self setSwitchId:-1];
        [self setRoomLabel:@""];
        [self setDeviceLabel:@""];
        [self setStatus:NO];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:[self switchId] forKey:@"switchId"];
    [aCoder encodeObject:[self roomLabel] forKey:@"roomLabel"];
    [aCoder encodeObject:[self deviceLabel] forKey:@"deviceLabel"];
    [aCoder encodeBool:[self status] forKey:@"status"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self setSwitchId:[aDecoder decodeIntegerForKey:@"switchId"]];
        [self setRoomLabel:[aDecoder decodeObjectForKey:@"roomLabel"]];
        [self setDeviceLabel:[aDecoder decodeObjectForKey:@"deviceLabeldeviceLabel"]];
        self.status = [aDecoder decodeBoolForKey:@"status"];
    }
    
    return self;
}

@end
