//
//  ChatsListCell.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/7/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EPChat;

@interface ChatsListTableViewCell : UITableViewCell
{
    CGFloat cellWidth;
    CGFloat cellHeight;
}

@property (nonatomic, strong) EPChat *chat;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
               chat:(EPChat *)chat;

@end
