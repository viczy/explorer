//
//  SettingsViewController.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
}

@property (nonatomic, strong) NSArray *section1Data;
@property (nonatomic, strong) NSArray *section2Data;

@property (nonatomic, strong) NSArray *titleArray;

@end
