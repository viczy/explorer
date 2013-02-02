//
//  ChatsTableView.h
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChatsTableViewDataSource.h"

typedef enum _NSBubbleTypingType
{
    NSBubbleTypingTypeNobody = 0,
    NSBubbleTypingTypeMe = 1,
    NSBubbleTypingTypeSomebody = 2
} NSBubbleTypingType;

@interface ChatsTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) IBOutlet id<ChatsTableViewDataSource> chatsDataSource;
@property (nonatomic) NSTimeInterval snapInterval;
@property (nonatomic) NSBubbleTypingType typingBubble;
@property (nonatomic, retain) NSMutableArray *bubbleSection;

@end