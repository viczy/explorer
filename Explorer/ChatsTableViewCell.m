//
//  ChatsTableViewCell.m
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "ChatsTableViewCell.h"

#import <QuartzCore/QuartzCore.h>

#import "EPChat.h"

@interface ChatsTableViewCell ()

@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UIImageView *bubbleImageView;
@property (nonatomic, strong) UIImageView *avatarImageView;

@end

@implementation ChatsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        // Initialization code
    }

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setDataInternal:(EPChat *)value
{
    self.chatData = value;
    [self setupInternalData];
}

- (void)setupInternalData
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    if (!self.bubbleImageView) {
        self.bubbleImageView = [[UIImageView alloc] init];
        [self addSubview:self.bubbleImageView];
    }

    NSBubbleType type = self.chatData.type;

//    CGFloat width = self.chatData.view.frame.size.width;
//    CGFloat height = self.chatData.view.frame.size.height;

    CGFloat width = 320;
    CGFloat height = 200;

    CGFloat x = (type == BubbleTypeSomeoneElse) ? 0 : self.frame.size.width - width - self.chatData.insets.left - self.chatData.insets.right;
    CGFloat y = 0;

    // Adjusting the x coordinate for avatar
    [self.avatarImageView removeFromSuperview];

    self.avatarImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"missingAvatar.png"]];

    self.avatarImageView.layer.cornerRadius = 9.0;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.2].CGColor;
    self.avatarImageView.layer.borderWidth = 1.0;

    CGFloat avatarX = (type == BubbleTypeSomeoneElse) ? 2 : self.frame.size.width - 52;
    CGFloat avatarY = self.frame.size.height - 50;

    self.avatarImageView.frame = CGRectMake(avatarX, avatarY, 50, 50);
    [self addSubview:self.avatarImageView];

    CGFloat delta = self.frame.size.height - (self.chatData.insets.top + self.chatData.insets.bottom);

    if (delta > 0) {
        y = delta;
    }

    if (type == BubbleTypeSomeoneElse) {
        x += 54;
    }

    if (type == BubbleTypeMine) {
        x -= 54;
    }

    [self.customView removeFromSuperview];
    self.customView.frame = CGRectMake(x + self.chatData.insets.left, y + self.chatData.insets.top, width, height);
    [self.contentView addSubview:self.customView];

    if (type == BubbleTypeSomeoneElse) {
        self.bubbleImageView.image = [[UIImage imageNamed:@"bubbleSomeone.png"] stretchableImageWithLeftCapWidth:21 topCapHeight:14];

    } else {
        self.bubbleImageView.image = [[UIImage imageNamed:@"bubbleMine.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:14];
    }

    self.bubbleImageView.frame = CGRectMake(x, y, width + self.chatData.insets.left + self.chatData.insets.right, height + self.chatData.insets.top + self.chatData.insets.bottom);
}

@end
