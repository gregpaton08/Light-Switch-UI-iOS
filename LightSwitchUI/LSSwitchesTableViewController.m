//
//  LSSwitchesTableViewController.m
//  LightSwitchUI
//
//  Created by Greg Paton on 12/14/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import "LSSwitchesTableViewController.h"
#import "LSSwitchTableViewCell.h"
#import "LSSwitchTableViewModel.h"
#import "LSSwitchInfo.h"
#import "AppDelegate.h"
#import "LSCommon.h"

@interface LSSwitchesTableViewController ()

@end

@implementation LSSwitchesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    AppDelegate *controller = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [self setSwitchModel:[controller switchModel]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self switchModel] displayedSwitches] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSSwitchTableViewCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (nil == cell) {
        cell = [[LSSwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSSwitchTableViewCellIdentifier"];
    }
    
    NSMutableArray *switches = [[self switchModel] displayedSwitches];
    LSSwitchInfo *switchInfo = [switches objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[switchInfo roomLabel]];
    [cell setTag:[indexPath row]];
    [[cell cellSwitch] addTarget:self action:@selector(cellSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    if ([[cell cellSwitch] isOn] != [switchInfo status]) {
        [[cell cellSwitch] setOn:[switchInfo status]];
    }
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut animations:^{
            [cell setHighlighted:YES animated:YES];
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionCurveEaseInOut animations:^
             {
                 if ([switchInfo status]) {
                     [cell setBackgroundColor:[UIColor whiteColor]];
                 }
                 else {
                     [cell setBackgroundColor:[UIColor backgroundGray]];
                 }
         } completion: NULL];
    }];
    
    return cell;
}

- (void)cellSwitchChanged:(id)sender {
    UISwitch* switchControl = sender;
    NSLog(@"Switch %zd is %@", [switchControl tag], [switchControl isOn] ? @"ON" : @"OFF");
    
    NSMutableArray *switches = [[self switchModel] displayedSwitches];
    LSSwitchInfo *switchInfo = [switches objectAtIndex:[switchControl tag]];
    [switchInfo setStatus:[switchControl isOn]];
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:0.1];
        dispatch_async( dispatch_get_main_queue(), ^{
            [[self tableView] reloadData];
        });
    });
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return [tableView isEditing];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSMutableArray *switches = [[self switchModel] displayedSwitches];
        [switches removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    // Update the model for switches that have been swapped
    
    // Swap objects at indexes
//    NSMutableArray *switches = [[self switchModel] displayedSwitches];
//    id temp = [switches objectAtIndex:[fromIndexPath row]];
//    [switches replaceObjectAtIndex:[fromIndexPath row] withObject:[switches objectAtIndex:[toIndexPath row]]];
//    [switches replaceObjectAtIndex:[toIndexPath row] withObject:temp];
    
    // Swap the tags so that the display order matches the model order
    [[self switchModel] insertObjectAtIndex:[fromIndexPath row] toIndex:[toIndexPath row]];
    dispatch_async( dispatch_get_main_queue(), ^{
        [[self tableView] reloadData];
    });
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView isEditing];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonPressEdit:(id)sender {
    UIBarButtonItem *button = (UIBarButtonItem*)sender;
    if (0 == [[self tableView] numberOfRowsInSection:0]) {
        return;
    }
    
    [[self tableView] setEditing:![[self tableView] isEditing] animated:YES];
    if ([[self tableView] isEditing]) {
        [button setTitle:@"Done"];
    }
    else {
        [button setTitle:@"Edit"];
    }
}

- (IBAction)buttonPressAdd:(id)sender {
    NSMutableArray *switches = [[self switchModel] displayedSwitches];
    LSSwitchInfo *switchInfo = [[LSSwitchInfo alloc] init];
    [switchInfo setRoomLabel:[NSString stringWithFormat:@"Testing %zu", [switches count]]];
    [switches addObject:switchInfo];
    [[self tableView] reloadData];
}

@end
