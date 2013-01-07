//
//  mainAppDelegate.m
//  Explorer
//
//  Created by Lanvige Jiang on 1/6/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "AppDelegate.h"

#import "NoticeViewController.h"
#import "ChatsViewController.h"
#import "SocialViewController.h"
#import "SettingsViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.


    NoticeViewController *noticeViewController = [[NoticeViewController alloc] initWithNibName:nil
                                                                                        bundle:nil];
    noticeViewController.tabBarItem.title = NSLocalizedString(@"notice", @"");
    noticeViewController.tabBarItem.image = [UIImage imageNamed:@"notice_tabbar.png"];
    noticeViewController.tabBarItem.badgeValue = @"2";

    ChatsViewController *chatsViewController = [[ChatsViewController alloc] initWithNibName:nil
                                                                                     bundle:nil];
    chatsViewController.tabBarItem.title = NSLocalizedString(@"chats", @"");
    chatsViewController.tabBarItem.image = [UIImage imageNamed:@"chats_tabbar.png"];

    SocialViewController *socialViewController = [[SocialViewController alloc] initWithNibName:@"SocialView"
                                                                                        bundle:nil];
    socialViewController.tabBarItem.title = NSLocalizedString(@"social", @"");
    socialViewController.tabBarItem.image = [UIImage imageNamed:@"social_tabbar.png"];

    SettingsViewController *settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsView"
                                                                                              bundle:nil];
    settingsViewController.tabBarItem.title = NSLocalizedString(@"settings", @"");
    settingsViewController.tabBarItem.image = [UIImage imageNamed:@"settings_tabbar.png"];

    // Init a new nav controller as container to include setting view.
    UINavigationController *noticeNavigationController = [[UINavigationController alloc] initWithRootViewController:noticeViewController];
    UINavigationController *chatsNavigationController = [[UINavigationController alloc] initWithRootViewController:chatsViewController];
    UINavigationController *socialNavigationController = [[UINavigationController alloc] initWithRootViewController:socialViewController];
    UINavigationController *settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    

    self.rootTabViewController = [[UITabBarController alloc] init];

    self.rootTabViewController.delegate = self;
    self.rootTabViewController.viewControllers = @[noticeNavigationController, chatsNavigationController, socialNavigationController, settingsNavigationController];
    
    self.window.rootViewController = self.rootTabViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
