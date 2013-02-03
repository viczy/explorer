//
//  ChatsTableView.m
//  Explorer
//
//  Created by Lanvige Jiang on 2/2/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "ChatsTableView.h"

#import "EPChat.h"

#import "ChatsHeaderTableViewCell.h"
#import "ChatsTableViewCell.h"

@implementation ChatsTableView

- (void)initializator
{
    self.backgroundColor = [UIColor clearColor];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    assert(self.style == UITableViewStylePlain);
    
    self.backgroundColor = [UIColor whiteColor];

    self.delegate = self;
    self.dataSource = self;

    // UIBubbleTableView default properties

    self.snapInterval = 120;
    self.typingBubble = NSBubbleTypingTypeNobody;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        // Initialization code
        [self initializator];
    }

    return self;
}

/*
   // Only override drawRect: if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   - (void)drawRect:(CGRect)rect
   {
    // Drawing code
   }
 */

#pragma mark - Override

- (void)reloadData
{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;

    // Cleaning up
    self.bubbleSection = nil;

    // Loading new data
    int count = 0;
    self.bubbleSection = [[NSMutableArray alloc] init];

    NSLog(@"%d", [self.chatsDataSource rowsForChatsTableView:self]);

    if (self.chatsDataSource && (count = [self.chatsDataSource rowsForChatsTableView:self]) > 0) {
        NSMutableArray *bubbleData = [[NSMutableArray alloc] initWithCapacity:count];

        for (int i = 0; i < count; i++) {
            NSObject *object = [self.chatsDataSource bubbleTableView:self dataForRow:i];
            assert([object isKindOfClass:[EPChat class]]);
            [bubbleData addObject:object];
        }

//        [bubbleData sortUsingComparator:^NSComparisonResult (id obj1, id obj2)
//         {
//             EPChat *chatData1 = (EPChat *) obj1;
//             EPChat *chatData2 = (EPChat *) obj2;
//
//             return [chatData1.date compare:chatData2.date];
//         }];

        NSDate *last = [NSDate dateWithTimeIntervalSince1970:0];
        NSMutableArray *currentSection = nil;

        for (int i = 0; i < count; i++) {
            EPChat *data = (EPChat *) [bubbleData objectAtIndex:i];

            if ([data.date timeIntervalSinceDate:last] > self.snapInterval) {
                currentSection = [[NSMutableArray alloc] init];
                [self.bubbleSection addObject:currentSection];
            }

            [currentSection addObject:data];
            last = data.date;
        }
    }

    [super reloadData];
}

#pragma mark -
#pragma mark UITableViewDelegate implementation

#pragma mark -
#pragma mark UITableViewDataSource implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int result = [self.bubbleSection count];

    if (self.typingBubble != NSBubbleTypingTypeNobody) {
        result++;
    }

    return result;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // This is for now typing bubble
    if (section >= [self.bubbleSection count]) {
        return 1;
    }
    
    return [[self.bubbleSection objectAtIndex:section] count] + 1;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 52;
    // Now typing
    if (indexPath.section >= [self.bubbleSection count]) {
        // return MAX([UIBubbleTypingTableViewCell height], self.showAvatars ? 52 : 0);
    }

    // Header
    if (indexPath.row == 0) {
        return [ChatsHeaderTableViewCell height];
    }

    EPChat *data = [[self.bubbleSection objectAtIndex:indexPath.section] objectAtIndex:indexPath.row - 1];
    // return MAX(data.insets.top + data.view.frame.size.height + data.insets.bottom, self.showAvatars ? 52 : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Now typing
    if (indexPath.section >= [self.bubbleSection count]) {
        static NSString *cellId = @"tblBubbleTypingCell";
        ChatsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];

        if (cell == nil) {
            // cell = [[UIBubbleTypingTableViewCell alloc] init];
        }

        // cell.type = self.typingBubble;

        return cell;
    }

    // Header with date and time
    if (indexPath.row == 0) {
        static NSString *cellId = @"tblBubbleHeaderCell";
        ChatsHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        EPChat *data = [[self.bubbleSection objectAtIndex:indexPath.section] objectAtIndex:0];

        if (cell == nil) {
            cell = [[ChatsHeaderTableViewCell alloc] init];
        }
        
        cell.date = data.date;

        return cell;
    }

    // Standard bubble
    static NSString *cellId = @"tblBubbleCell";
    ChatsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    EPChat *data = [[self.bubbleSection objectAtIndex:indexPath.section] objectAtIndex:indexPath.row - 1];

    if (cell == nil) {
        cell = [[ChatsTableViewCell alloc] init];
    }

    cell.data = data;

    return cell;
}



@end
