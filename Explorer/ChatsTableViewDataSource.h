//
//  ChatsTableViewDataSource.h
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EPChat;
@class ChatsTableView;

@protocol ChatsTableViewDataSource <NSObject>

@optional

@required

- (NSInteger)rowsForBubbleTable:(ChatsTableView *)tableView;
- (EPChat *)bubbleTableView:(ChatsTableView *)tableView dataForRow:(NSInteger)row;

@end
