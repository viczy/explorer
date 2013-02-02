//
//  ChatsHeaderTableViewCell.h
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatsHeaderTableViewCell : UITableViewCell

@property (nonatomic, strong) NSDate *date;

+ (CGFloat)height;

@end
