//
//  NoticeViewController.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NoticeCell.h"

@interface NoticeViewController : UIViewController <UITableViewDelegate,
                                                UITableViewDataSource>
{
//    NSMutableArray *notices;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *notices;

@end
