//
//  LSSwitchesTableViewController.m
//  LightSwitchUI
//
//  Created by Greg Paton on 12/14/15.
//  Copyright © 2015 Greg Paton. All rights reserved.
//

#import "LSSwitchesTableViewController.h"
#import "LSSwitchTableViewCell.h"

@interface LSSwitchesTableViewController ()

@end

@implementation LSSwitchesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self setSwitches:[[NSMutableArray alloc] initWithArray:@[@"TEST1", @"TEST2"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [[self switches] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSSwitchTableViewCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (nil == cell) {
        cell = [[LSSwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSSwitchTableViewCellIdentifier"];
    }
    
    [[cell textLabel] setText:@"TESTING"];
    [cell setTag:[indexPath row]];
    [[cell cellSwitch] addTarget:self action:@selector(cellSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    
    return cell;
}

- (void)cellSwitchChanged:(id)sender {
    UISwitch* switchControl = sender;
    NSLog(@"Switch %zd is %@", [switchControl tag], switchControl.on ? @"ON" : @"OFF");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[self switches] removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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

@end
