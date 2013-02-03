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
        self.tableView.chatsDataSource = self;
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
    chat1.date = [NSDate dateWithTimeIntervalSinceNow:-300];


    EPChat *chat2 = [[EPChat alloc] init];
    chat2.content = @"";
    chat2.username = @"Norman";
    chat2.type = BubbleTypeSomeoneElse;
    chat2.date = [NSDate dateWithTimeIntervalSinceNow:-320];
    
    self.listData = [[NSMutableArray alloc] initWithObjects:chat1, chat2, nil];


    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self buildDemoData];
}



#pragma mark -
#pragma mark UIBubbleTableViewDataSource implementation

- (NSInteger)rowsForChatsTableView:(ChatsTableView *)tableView
{
    return [self.listData count];
}

- (EPChat *)bubbleTableView:(ChatsTableView *)tableView dataForRow:(NSInteger)row
{
    return [self.listData objectAtIndex:row];
}


#pragma mark -
#pragma mark

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark -
#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
