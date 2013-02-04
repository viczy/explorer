//
//  NoticeViewController.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NoticeTableViewCell.h"

@interface NoticeViewController : UIViewController <
                                        UITableViewDelegate,
                                        UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *listData;
@property (nonatomic, strong) UITableViewCell *tableViewCell;

@end
