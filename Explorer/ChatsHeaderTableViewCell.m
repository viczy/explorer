//
//  ChatsHeaderTableViewCell.m
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "ChatsHeaderTableViewCell.h"

@implementation ChatsHeaderTableViewCell

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

+ (CGFloat)height
{
    return 28.0;
}

- (void)setDate:(NSDate *)value
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *text = [dateFormatter stringFromDate:value];
    
    if (self.dateLabel)
    {
        self.dateLabel.text = text;
        return;
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [ChatsHeaderTableViewCell height])];
    self.dateLabel.text = text;
    self.dateLabel.font = [UIFont boldSystemFontOfSize:12];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    self.dateLabel.shadowOffset = CGSizeMake(0, 1);
    self.dateLabel.shadowColor = [UIColor whiteColor];
    self.dateLabel.textColor = [UIColor darkGrayColor];
    self.dateLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.dateLabel];
}

@end
