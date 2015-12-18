//
//  LSSwitchesTableViewController.h
//  LightSwitchUI
//
//  Created by Greg Paton on 12/14/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSSwitchTableViewModel.h"

@interface LSSwitchesTableViewController : UITableViewController

@property (strong, nonatomic) LSSwitchTableViewModel *switchModel;

- (IBAction)buttonPressEdit:(id)sender;
- (IBAction)buttonPressAdd:(id)sender;

@end
