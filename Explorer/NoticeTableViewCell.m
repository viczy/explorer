//
//  NoticeCell.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/7/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "NoticeTableViewCell.h"

#import "EPNotice.h"

@implementation NoticeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier notice:(EPNotice *)notice
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        cellWidth = 240.000;
        cellHeight = 0.000;
        
        // Notice Info
        
        self.notice = [[EPNotice alloc] init];
        self.notice.username = @"Lanvige";
        self.notice.date = @"2013-1-5";
        self.notice.content = @"今儿@上岸晒太阳的小摩 说要帮忙找人合租房子，想了一下，基本没有合适的且认识的女生可以介绍，，这个年龄段的认识的基本都结婚了或者有了自己的房子或者和老公一起租住，想想自己果然老了";
        
        //
        [self addController];
        [self addContentController];
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    return self;
}

- (void)addController
{
    // Cell backgrand.
    UIImage *bgImage = [[UIImage imageNamed:@"Icon.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    [bgView setFrame:CGRectMake(0, 0, 320, cellHeight)];
    //[self addSubview:backView];
    
    // Avatar image
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 5, 41, 41)];
    avatarImageView.image = [UIImage imageNamed:@"Icon.png"];
    [self addSubview:avatarImageView];
}

- (void)addContentController
{
    // Title height
    CGSize titleSize = [self.notice.username sizeWithFont:[UIFont systemFontOfSize:15]
                                        constrainedToSize:CGSizeMake(cellWidth, 10000)
                                            lineBreakMode:UILineBreakModeWordWrap];
    cellHeight = 5 + titleSize.height;
    
    // Title username
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 200, 16)];
    [usernameLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [usernameLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [usernameLabel setTextColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    [usernameLabel setBackgroundColor:[UIColor clearColor]];
    [usernameLabel setText:self.notice.username];
    [usernameLabel setTextAlignment:UITextAlignmentLeft];
    [self addSubview:usernameLabel];
    
    // Title time
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 6, 70, 14)];
    [dateLabel setFont:[UIFont fontWithName:@"Helvetica" size:9]];
    [dateLabel setTextColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5]];
    [dateLabel setBackgroundColor:[UIColor clearColor]];
    [dateLabel setText:self.notice.date];
    [dateLabel setTextAlignment:UITextAlignmentRight];
    [self addSubview:dateLabel];
    
    // Notice content height
    CGSize contentSize = [self.notice.content sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(cellWidth, 10000) lineBreakMode:UILineBreakModeWordWrap];
    cellHeight += contentSize.height + 9;
    
    // Content label
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 240, contentSize.height)];
    [contentLabel setText:self.notice.content];
    [contentLabel setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [contentLabel setLineBreakMode:UILineBreakModeWordWrap];
    [contentLabel setNumberOfLines:0];
    [contentLabel setTextAlignment:UITextAlignmentLeft];
    //UIColor *org = [UIColor colorWithRed:249.0/255 green:251.0/255 blue:253.0/255 alpha:0];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:contentLabel];
    
    // Notice comment number
    UILabel *noticeStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, cellHeight + 1, 86, 14)];
    NSString *rtStr = [NSString stringWithFormat:@"转发: %@  评论: %@", @"32", @"20"];
    [noticeStatusLabel setText:rtStr];
    [noticeStatusLabel setFont:[UIFont fontWithName:@"Helvetica" size:8]];
    [noticeStatusLabel setTextColor:[UIColor grayColor]];
    [noticeStatusLabel setTextAlignment:UITextAlignmentRight];
    [noticeStatusLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:noticeStatusLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
