//
//  SettingsViewController.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    // Change the bar's style.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = NSLocalizedString(@"settings", @"");

    // Set up the NSArray
    self.section1Data = @[@"Item 1", @"Item 2", @"Item 3", @"Item 12"];
    self.section2Data = @[@"Item 11", @"Item 12", @"Item 13", @"Item 14"];

    self.titleArray = @[@"Account", @"Advanced"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:
            return [self.section1Data count];
        case 1:
            return [self.section2Data count];

        default:
            return 0;
    }
}


// 每个section的title
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:
            return [self.titleArray objectAtIndex:section];
        case 1:
            return [self.titleArray objectAtIndex:section];

        default:
            return @"Unknown";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Step 1: Check to see if we can reuse a cell from a row that has just rolled off the screen
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    // Step 2: If there are no cells to reuse, create a new one
    if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    // Add a detail view accessory
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;


    switch(indexPath.section)
    {
        case 0:
            [[cell textLabel] setText:[self.section1Data objectAtIndex:indexPath.row]];
            break;
        case 1:
            [[cell textLabel] setText:[self.section2Data objectAtIndex:indexPath.row]];
            break;

        default:
            [[cell textLabel] setText:@"Unknown"];

    }
    
    //設字體、顏色、背景色什麼的
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
//    cell.textLabel.textColor = [UIColor colorWithRed:54.0/255.0 green:161.0/255.0 blue:219.0/255.0 alpha:1];
    cell.detailTextLabel.textColor = [UIColor colorWithRed:135.0/255.0 green:135.0/255.0 blue:135.0/255.0 alpha:1];

    //設定textLabel的最大允許行數，超過的話會在尾未以...表示
    cell.textLabel.numberOfLines = 2;

    // Step 4: Return the cell
    return cell;
}

@end
