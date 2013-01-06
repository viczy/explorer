//
//  mainAppDelegate.h
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,
                                UITabBarControllerDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootTabViewController;

@end
