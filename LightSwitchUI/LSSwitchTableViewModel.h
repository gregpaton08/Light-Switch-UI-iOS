//
//  LSSwitchTableViewModel.h
//  LightSwitchUI
//
//  Created by Greg Paton on 12/17/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSSwitchTableViewModel : NSObject

@property NSMutableArray *availableSwitches;
@property NSMutableArray *displayedSwitches;
@property NSString *keyForUserDefaults;

- (void)loadAvailableSwitches;
- (void)saveDisplayedSwitches;
- (void)insertObjectAtIndex:(NSUInteger)atIndex toIndex:(NSUInteger)toIndex;
- (void)removeObjectAtIndex:(NSUInteger)index;

@end
