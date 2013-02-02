//
//  EPChat.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/7/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "EPModelBase.h"

typedef enum _NSBubbleType
{
    BubbleTypeMine = 0,
    BubbleTypeSomeoneElse = 1
} NSBubbleType;

@interface EPChat : EPModelBase

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign, readonly) UIEdgeInsets insets;
@property (nonatomic, assign) NSBubbleType type;

@end
