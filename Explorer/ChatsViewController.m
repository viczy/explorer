//
//  ChatsViewController.m
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "ChatsViewController.h"

#import "ChatsTableView.h"

#import "EPChat.h"

@interface ChatsViewController ()

@end

@implementation ChatsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tableView = [[ChatsTableView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:self.tableView];
    }
    return self;
}


- (void)buildDemoData
{
    EPChat *chat1 = [[EPChat alloc] init];
    chat1.content = @"Wow";
    chat1.username = @"Lanvige";
    chat1.type = BubbleTypeMine;
    
    
    self.listData = [[NSMutableArray alloc] initWithObjects:chat1, nil];
    self.tableView.chatsDataSource = self;
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}



#pragma mark - UIBubbleTableViewDataSource implementation

- (NSInteger)rowsForBubbleTable:(ChatsTableView *)tableView
{
    return [self.listData count];
}

- (EPChat *)bubbleTableView:(ChatsTableView *)tableView dataForRow:(NSInteger)row
{
    return [self.listData objectAtIndex:row];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
