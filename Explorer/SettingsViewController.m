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
    
    [self initTestData];
    
    CGRect navBarFrame = self.navigationController.navigationBar.frame;
    CGRect tabBarFrame = self.tabBarController.tabBar.frame;
    
    CGRect r = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - navBarFrame.size.height - tabBarFrame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:r
                                                  style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor    ];
    self.tableView.backgroundView = nil;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initTestData
{
    // Set up the NSArray
    self.section1Data = @[@"Notification", @"Weibo"];
    self.section2Data = @[@"Rate us", @"Contace us", @"About"];
    
    self.titleArray = @[@"", @"Account", @"Advanced", @""];
}

#pragma mark - TableView Methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section)
    {
        case 0:
            return 1;
        case 1:
            return [self.section1Data count];
        case 2:
            return [self.section2Data count];
        case 3:
            return 1;
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
        case 2:
            return [self.titleArray objectAtIndex:section];
        case 3:
            return [self.titleArray objectAtIndex:section];
        default:
            return @"Unknown";
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // Step 1: Check to see if we can reuse a cell from a row that has just rolled off the screen
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Step 2: If there are no cells to reuse, create a new one
    if(cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    // Add a detail view accessory
    //    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    
    switch(indexPath.section)
    {
        case 0:
        {
            // Avatar image
            CGRect avatarRect = CGRectMake(10, 10, 30, 30);
            UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:avatarRect];
            avatarImageView.image = [UIImage imageNamed:@"Icon.png"];
            [cell.contentView addSubview:avatarImageView];
            
            // Username
            CGRect usernameRect = CGRectMake(50, 5, 120, 30);
            UILabel *label = [[UILabel alloc] initWithFrame:usernameRect];
            label.tag = 1;
            label.text = @"Lanvige";
            label.lineBreakMode = UILineBreakModeWordWrap;
            label.numberOfLines = 1;
            label.opaque = NO; // 选中Opaque表示视图后面的任何内容都不应该绘制
            label.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:label];
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case 1: {
            cell.textLabel.text = [self.section1Data objectAtIndex:indexPath.row];
            UIFont *myFont = [UIFont fontWithName:@"Arial" size:15];
            cell.textLabel.font = myFont;
            
            // http://stackoverflow.com/questions/4585840/how-to-create-a-uitableviewcell-with-a-uiswitch-and-get-the-data
            UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
            [switchview addTarget:self
                           action:@selector(updateSwitchAtIndexPath)
                 forControlEvents:UIControlEventTouchUpInside];
            cell.accessoryView = switchview;
            
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case 2: {
            cell.textLabel.text = [self.section2Data objectAtIndex:indexPath.row];
            UIFont *myFont = [UIFont fontWithName:@"Arial" size:15];
            cell.textLabel.font = myFont;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case 3: {
            cell.textLabel.text = @"Log out";
            cell.backgroundColor = [UIColor redColor];
            UIFont *myFont = [UIFont fontWithName:@"Helvetica-Bold" size:18];
            cell.textLabel.font = myFont;
            [cell.textLabel setTextAlignment:UITextAlignmentCenter];
            [cell.textLabel setTextColor:[UIColor whiteColor]];
            break;
        }
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    switch(indexPath.section)
    {
        case 0:
        {
            return 50.f;
        }
    }
    
    return  40.f;
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [self firstSectionTitle];
        case 1:
            // ...
        default:
            return nil;
    }
}

- (NSString *)firstSectionTitle {
    // generate first section title programmatically, e.g. "return [[NSDate date] description];"
    return @"generate first section";
}


- (void)updateSwitchAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    UISwitch *switchView = (UISwitch *)cell.accessoryView;
    
    if ([switchView isOn]) {
        [switchView setOn:NO animated:YES];
    } else {
        [switchView setOn:YES animated:YES];
    }
    
}

@end
