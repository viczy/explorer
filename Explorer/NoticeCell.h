//
//  NoticeCell.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/7/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EPNotice;

@interface NoticeCell : UITableViewCell
{
    CGFloat cellWidth;
    CGFloat cellHeight;
    
//    EPNotice *notice;
}

@property (nonatomic, strong) EPNotice *notice;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier notice:(EPNotice *)notice;

@end
