//
//  EPChat.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/7/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "EPModelBase.h"

@interface EPChat : EPModelBase

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *content;

@end
