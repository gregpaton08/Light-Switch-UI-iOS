//
//  LSSwitchTableViewCell.h
//  LightSwitchUI
//
//  Created by Greg Paton on 12/15/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSSwitchTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UISwitch *cellSwitch;

- (void)updateColor;
- (void)cellSwitchChanged:(id)sender;

@end
