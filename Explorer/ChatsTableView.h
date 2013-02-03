//
//  ChatsTableView.h
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChatsTableViewDataSource.h"

typedef enum _NSBubbleTypingType {
    NSBubbleTypingTypeNobody = 0,
    NSBubbleTypingTypeMe = 1,
    NSBubbleTypingTypeSomebody = 2
} NSBubbleTypingType;

@interface ChatsTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<ChatsTableViewDataSource> chatsDataSource;
@property (nonatomic, assign) NSTimeInterval snapInterval;
@property (nonatomic, assign) NSBubbleTypingType typingBubble;
@property (nonatomic, strong) NSMutableArray *bubbleSection;

@end