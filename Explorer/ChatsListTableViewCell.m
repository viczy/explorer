//
//  ChatsListCell.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/7/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "ChatsListTableViewCell.h"

#import <QuartzCore/QuartzCore.h>

#import "EPChat.h"

@interface ChatsListTableViewCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

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

    // self.selectionStyle = UITableViewCellSelectionStyleGray;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
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
    self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 32, 32)];
    self.avatarImageView.image = [UIImage imageNamed:@"Icon.png"];
    
    //设置圆角边框
    self.avatarImageView.layer.cornerRadius = 6;
    self.avatarImageView.layer.masksToBounds = YES;
    
    //设置边框及边框颜色
    self.avatarImageView.layer.borderWidth = .5f;
    self.avatarImageView.layer.borderColor = [[UIColor grayColor] CGColor];
    
    [self addSubview:self.avatarImageView];
}

- (void)addContentController
{
    // Title height
    CGSize titleSize = [self.chat.username sizeWithFont:[UIFont systemFontOfSize:15]
                                        constrainedToSize:CGSizeMake(cellWidth, 10000)
                                            lineBreakMode:UILineBreakModeWordWrap];
    cellHeight = 5 + titleSize.height;

    // Title username
    self.usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 8, 200, 18)];
    [self.usernameLabel setFont:[UIFont fontWithName:@"Helvetica-BoldOblique" size:16]];
    [self.usernameLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [self.usernameLabel setTextColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    [self.usernameLabel setBackgroundColor:[UIColor clearColor]];
    [self.usernameLabel setText:self.chat.username];
    [self.usernameLabel setTextAlignment:UITextAlignmentLeft];
    [self addSubview:self.usernameLabel];

    // Title time
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 10, 70, 14)];
    [self.dateLabel setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [self.dateLabel setTextColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5]];
    [self.dateLabel setBackgroundColor:[UIColor clearColor]];
    [self.dateLabel setText:self.chat.date];
    [self.dateLabel setTextAlignment:UITextAlignmentRight];
    [self addSubview:self.dateLabel];

    // Notice content height
    CGSize contentSize = [self.chat.content sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(cellWidth, 10000) lineBreakMode:UILineBreakModeWordWrap];
    cellHeight += contentSize.height + 9;

    // Content label
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 33, 220, 20)];
    [self.contentLabel setText:self.chat.content];
    [self.contentLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [self.contentLabel setLineBreakMode:UILineBreakModeWordWrap];
    [self.contentLabel setNumberOfLines:0];
    [self.contentLabel setTextAlignment:UITextAlignmentLeft];
    [self.contentLabel setTextColor:[UIColor grayColor]];
    [self.contentLabel setBackgroundColor:[UIColor clearColor]];
    self.contentLabel.numberOfLines = 1;
    self.contentLabel.lineBreakMode = UILineBreakModeTailTruncation;
    [self addSubview:self.contentLabel];
    
    self.arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 36, 10, 14)];
    self.arrowImageView.image = [UIImage imageNamed:@"cell_arrow"];
    [self addSubview:self.arrowImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)willTransitionToState:(UITableViewCellStateMask)state
{
    [super willTransitionToState:state];
    // animation is disable at here.
    // http://stackoverflow.com/questions/4255440/animate-textlabel-in-uitableviewcell-using-willtransitiontostate
    [UIView setAnimationsEnabled:YES];
    
    switch (state) {
        case UITableViewCellStateShowingDeleteConfirmationMask: {
            NSLog(@"Delete%u", state);
            [UIView animateWithDuration:.25f
                             animations:^{
                                 self.dateLabel.frame = CGRectMake(self.dateLabel.frame.origin.x - 50, self.dateLabel.frame.origin.y, self.dateLabel.frame.size.width, self.dateLabel.frame.size.height);
                                 self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y, self.contentLabel.frame.size.width - 50, self.contentLabel.frame.size.height);
                                 self.arrowImageView.frame = CGRectMake(self.arrowImageView.frame.origin.x - 50, self.arrowImageView.frame.origin.y, self.arrowImageView.frame.size.width, self.arrowImageView.frame.size.height);
                             } completion:^(BOOL finished) {
                                  NSLog(@"Done!");
                             }];
            break;
        }
        case UITableViewCellStateDefaultMask: {
            NSLog(@"Default%u", state);
            [UIView animateWithDuration:.25f
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 self.dateLabel.frame = CGRectMake(self.dateLabel.frame.origin.x + 50, self.dateLabel.frame.origin.y, self.dateLabel.frame.size.width, self.dateLabel.frame.size.height);
                                 self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y, self.contentLabel.frame.size.width + 50, self.contentLabel.frame.size.height);
                                 self.arrowImageView.frame = CGRectMake(self.arrowImageView.frame.origin.x + 50, self.arrowImageView.frame.origin.y, self.arrowImageView.frame.size.width, self.arrowImageView.frame.size.height);
                             } completion:^(BOOL finished) {
                                 //
                             }];
            break;
        }
        default:
            break;
    }
}

@end