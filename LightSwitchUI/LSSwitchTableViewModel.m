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
        [self loadDisplayedSwitches];
    }
    return self;
}

- (void)loadAvailableSwitches {
    // Load all the switches from the network
}

- (void)loadDisplayedSwitches {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:[self keyForUserDefaults]];
    if (data) {
        NSArray *switches = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [self setDisplayedSwitches:[NSMutableArray arrayWithArray:switches]];
    }
    else {
        [self setDisplayedSwitches:[[NSMutableArray alloc] init]];
    }
}

- (void)saveDisplayedSwitches {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[self displayedSwitches]];
    [defaults setObject:data forKey:[self keyForUserDefaults]];
    [defaults synchronize];
}

- (void)insertObjectAtIndex:(NSUInteger)atIndex toIndex:(NSUInteger)toIndex {
    if (atIndex == toIndex) {
        return;
    }
    
    // Retrieve and insert object into new location
    LSSwitchInfo *switchInfo = [[self displayedSwitches] objectAtIndex:atIndex];
    [[self displayedSwitches] removeObjectAtIndex:atIndex];
    [[self displayedSwitches] insertObject:switchInfo atIndex:toIndex];
}

@end
