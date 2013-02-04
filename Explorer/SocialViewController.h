//
//  SocialViewController.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SocialViewController : UIViewController <
                                        UITableViewDelegate,
                                        UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *listData;
@property (nonatomic, strong) UITableViewCell *tableViewCell;

@end
