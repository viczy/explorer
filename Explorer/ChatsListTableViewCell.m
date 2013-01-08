//
//  ChatsListCell.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/7/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "ChatsListTableViewCell.h"

#import "EPChat.h"

@implementation ChatsListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier chat:(EPChat *)chat
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        cellWidth = 240.000;
        cellHeight = 0.000;

        // Chat Info
        self.chat = [[EPChat alloc] init];
        self.chat.username = @"Lanvige";
        self.chat.date = @"2013-1-5 16:11";
        self.chat.content = @"或者和老公一起租住，果然老了果然老了果然老了";
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
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 32, 32)];
    avatarImageView.image = [UIImage imageNamed:@"Icon.png"];
    [self addSubview:avatarImageView];
}

- (void)addContentController
{
    // Title height
    CGSize titleSize = [self.chat.username sizeWithFont:[UIFont systemFontOfSize:15]
                                        constrainedToSize:CGSizeMake(cellWidth, 10000)
                                            lineBreakMode:UILineBreakModeWordWrap];
    cellHeight = 5 + titleSize.height;

    // Title username
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 8, 200, 18)];
    [usernameLabel setFont:[UIFont fontWithName:@"Helvetica-BoldOblique" size:16]];
    [usernameLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [usernameLabel setTextColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    [usernameLabel setBackgroundColor:[UIColor clearColor]];
    [usernameLabel setText:self.chat.username];
    [usernameLabel setTextAlignment:UITextAlignmentLeft];
    [self addSubview:usernameLabel];

    // Title time
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 10, 70, 14)];
    [dateLabel setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [dateLabel setTextColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5]];
    [dateLabel setBackgroundColor:[UIColor clearColor]];
    [dateLabel setText:self.chat.date];
    [dateLabel setTextAlignment:UITextAlignmentRight];
    [self addSubview:dateLabel];

    // Notice content height
    CGSize contentSize = [self.chat.content sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(cellWidth, 10000) lineBreakMode:UILineBreakModeWordWrap];
    cellHeight += contentSize.height + 9;

    // Content label
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 33, 240, 20)];
    [contentLabel setText:self.chat.content];
    [contentLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [contentLabel setLineBreakMode:UILineBreakModeWordWrap];
    [contentLabel setNumberOfLines:0];
    [contentLabel setTextAlignment:UITextAlignmentLeft];
    [contentLabel setTextColor:[UIColor grayColor]];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    contentLabel.numberOfLines = 1;
    contentLabel.lineBreakMode = UILineBreakModeTailTruncation;
    [self addSubview:contentLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end