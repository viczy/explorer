//
//  ChatsViewController.h
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChatsTableViewDataSource.h"

@class ChatsTableView;

@interface ChatsViewController : UIViewController<ChatsTableViewDataSource>

@property (nonatomic, strong) ChatsTableView *tableView;

@property (nonatomic, strong) NSMutableArray *listData;

@end
