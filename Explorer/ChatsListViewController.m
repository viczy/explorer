//
//  ChatsViewController.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

// http://stackoverflow.com/questions/1071112/uiviews-frame-bounds-center-origin-when-to-use-what

#import "ChatsListViewController.h"

#import "ChatsListTableViewCell.h"
#import "ChatsViewController.h"


@interface ChatsListViewController ()

@end

@implementation ChatsListViewController

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
    self.navigationItem.title = NSLocalizedString(@"chats", @"");

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                              target:self
                                              action:@selector(addSharing:)];

    // 初始化表中数组
    self.chatsList = [NSMutableArray arrayWithArray:@[@"Sleepy"]];

    CGRect navBarFrame = self.navigationController.navigationBar.frame;
    CGRect tabBarFrame = self.tabBarController.tabBar.frame;
    
    CGRect r = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - navBarFrame.size.height - tabBarFrame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:r
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView
sectionForSectionIndexTitle:(NSString *)title
               atIndex:(NSInteger)index
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回一个NsInterger作为行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.chatsList count];
}

// 每个cell显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentifier = [NSString stringWithFormat:@"cell_%d", indexPath.row];
    ChatsListTableViewCell *cell = (ChatsListTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];

    if (cell == nil) {
        cell = [[ChatsListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier chat:nil];
    }

    return cell;
}

// 动态设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

# pragma mark -
# pragma mark Table delegate

- (NSIndexPath *)tableView:(UITableView *)tableView
    willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

//// 设置每行缩进级别
//- (NSInteger)tableView:(UITableView *)tableView
//    indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    ChatsViewController *chatsViewController = [[ChatsViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:chatsViewController animated:YES];
}


#pragma mark -
#pragma mark Table editing

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // remove the data in list.
        [self.chatsList removeObjectAtIndex:indexPath.row];
        // Remove the cell in tableview with animation.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [tableView reloadData];
    }   
}

@end
