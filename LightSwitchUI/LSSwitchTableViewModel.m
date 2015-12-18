//
//  LSSwitchTableViewModel.m
//  LightSwitchUI
//
//  Created by Greg Paton on 12/17/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import "LSSwitchTableViewModel.h"
#import "LSSwitchInfo.h"

@implementation LSSwitchTableViewModel

- (id)init {
    self = [super init];
    if (self) {
        [self setKeyForUserDefaults:@"LSSwitchesDisplaySwitches"];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *switches = [defaults objectForKey:[self keyForUserDefaults]];
        if (switches) {
            [self setDisplayedSwitches:[NSMutableArray arrayWithArray:switches]];
        }
        else {
            [self setDisplayedSwitches:[[NSMutableArray alloc] init]];
        }
    }
    return self;
}

- (void)loadAvailableSwitches {
    // Load all the switches from the network
}

- (void)saveDisplayedSwitches {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self displayedSwitches] forKey:[self keyForUserDefaults]];
    [defaults synchronize];
}

@end
