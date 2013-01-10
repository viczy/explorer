//
//  SocialListTableViewCell.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/10/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EPNotice;

@interface SocialListTableViewCell : UITableViewCell

{
    CGFloat cellWidth;
    CGFloat cellHeight;
    
    UIFont *titleFont;
    UIFont *contentFont;
    
    //    EPNotice *notice;
}

@property (nonatomic, strong) EPNotice *notice;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier notice:(EPNotice *)notice;


@end
