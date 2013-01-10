//
//  SocialListTableViewCell.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/10/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "SocialListTableViewCell.h"

#import "EPNotice.h"
#import "RegexKitLite.h"
#import "TTTAttributedLabel.h"

@interface SocialListTableViewCell () <TTTAttributedLabelDelegate, UIActionSheetDelegate>
@property (nonatomic, strong) TTTAttributedLabel *contentLabel;
@end

@implementation SocialListTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier notice:(EPNotice *)notice
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        cellWidth = 240.000;
        
        // View font init.
        titleFont = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        contentFont = [UIFont fontWithName:@"Helvetica" size:14];
        
        // Notice Info
        self.notice = [[EPNotice alloc] init];
        self.notice.username = @"Lanvige";
        self.notice.date = @"2013-1-5";
        self.notice.content = @"I added the TTT attributed label to my project. I want to have 2 different font colors to display the 'likes'. However my project keeps crashing. A sample string to be formatted would be";
        
        [self addAvatarView];
        [self addTitleView];
        [self addContentView];
        [self addStatusView];
        [self setCellFrame];
        // [self setBackground];
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    return self;
}


- (NSString *)transformString:(NSString *)originalStr
{
    NSString *text = originalStr;
    NSString *regex_emoji = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\]";
    NSArray *array_emoji = [text componentsMatchedByRegex:regex_emoji];

    NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"emotionImage.plist"];
    NSDictionary *m_EmojiDic = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    //    NSString *path = [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] bundlePath]];

    if ([array_emoji count]) {
        for (NSString *str in array_emoji) {
            NSRange range = [text rangeOfString:str];
            NSString *i_transCharacter = [m_EmojiDic objectForKey:str];
            if (i_transCharacter) {
                NSString *imageHtml = [NSString stringWithFormat:@"<img src='%@' width='16' height='16'>",i_transCharacter];
                text = [text stringByReplacingCharactersInRange:NSMakeRange(range.location, [str length]) withString:imageHtml];
            }
        }
    }
    //返回转义后的字符串
    return text;
}


- (void)addAvatarView
{
    // Avatar image
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 5, 41, 41)];
    avatarImageView.image = [UIImage imageNamed:@"Icon.png"];
    [self addSubview:avatarImageView];
}

- (void)addTitleView
{
    // Title label
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 200, 16)];
    [usernameLabel setFont:titleFont];
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
}


- (void)addContentView
{
    // Notice content height
    // 是否可以用label.size来计算高度？
    CGSize contentSize = [self.notice.content sizeWithFont:contentFont
                                         constrainedToSize:CGSizeMake(cellWidth, 10000)
                                             lineBreakMode:UILineBreakModeWordWrap];
    cellHeight = 30 + contentSize.height;
    
    // Content label
    self.contentLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(60, 30, 240, 90)];

    self.contentLabel.delegate = self;
    self.contentLabel.font = contentFont;
    self.contentLabel.textColor = [UIColor darkGrayColor];
    self.contentLabel.lineBreakMode = UILineBreakModeWordWrap;
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.lineHeightMultiple = 1;
    self.contentLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentTop;

    
    [self.contentLabel setText:self.notice.content afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {

        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"TTT attributed" options:NSCaseInsensitiveSearch];
        //NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"合适的且认识" options:NSCaseInsensitiveSearch];

        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            //[mutableAttributedString addAttribute:@"TTTStrikeOutAttribute" value:[NSNumber numberWithBool:YES] range:strikeRange];
            CFRelease(font);
        }

        return mutableAttributedString;
    }];



    NSRange range = [self.contentLabel.text rangeOfString:@"my"];
    [self.contentLabel addLinkToURL:[NSURL URLWithString:@"http://github.com/mattt/"] withRange:range]; // Embedding a custom link in
    
//    [self.contentLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.contentLabel];
}

- (void)addStatusView
{
    // Notice comment number
    UILabel *noticeStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, cellHeight, 86, 14)];
    NSString *rtStr = [NSString stringWithFormat:@"转发: %@  评论: %@", @"32", @"20"];
    [noticeStatusLabel setText:rtStr];
    [noticeStatusLabel setFont:[UIFont fontWithName:@"Helvetica" size:8]];
    [noticeStatusLabel setTextColor:[UIColor grayColor]];
    [noticeStatusLabel setTextAlignment:UITextAlignmentRight];
    [noticeStatusLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:noticeStatusLabel];
    
    //
    cellHeight = cellHeight + noticeStatusLabel.frame.size.height + 5;
}

- (void)setBackground
{
    // Cell backgrand.
    UIImage *bgImage = [[UIImage imageNamed:@"Icon.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    [bgView setFrame:CGRectMake(0, 0, 320, cellHeight)];
    [self addSubview:bgView];
}

// 计算Cell的高度
- (void)setCellFrame
{
    CGRect cellFrame = CGRectMake(0, 0, cellWidth, cellHeight);
    [self setFrame:cellFrame];
}

// ????
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


@end
