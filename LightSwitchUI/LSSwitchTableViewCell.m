//
//  LSSwitchTableViewCell.m
//  LightSwitchUI
//
//  Created by Greg Paton on 12/15/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import "LSSwitchTableViewCell.h"

@implementation LSSwitchTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self setCellSwitch:[[UISwitch alloc] init]];
    [self setAccessoryView:[self cellSwitch]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
//        [[self textLabel] setText:@"TESTING"];
//        
//        [self setCellSwitch:[[UISwitch alloc] init]];
//        
//        [self setAccessoryView:[self cellSwitch]];
    }
    
    return self;
}

- (void)setTag:(NSInteger)tag {
    [super setTag:tag];
    
    if ([self cellSwitch]) {
        [[self cellSwitch] setTag:tag];
    }
}

@end
