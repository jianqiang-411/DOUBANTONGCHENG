//
//  LYXAppDelegate.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-4.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "LYXAppDelegate.h"
#import "ContentVC.h"
#import "SouSuoVC.h"
#import "LYXViewController.h"
#import "PPRevealSideViewController.h"
#import "MenuVC.h"
#import "PViewController.h"
#import <ShareSDK/ShareSDK.h>
@implementation LYXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	ContentVC *vc = [[ContentVC alloc] initWithCollectionViewLayout:layout];
    
    vc.title = @"精选活动";
    vc.tabBarItem.image = [UIImage imageNamed:@"icon_tab_hot"];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc];
    [nav1.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    SouSuoVC *sousuoVC = [[SouSuoVC alloc]init];
    
    sousuoVC.title = @"同城搜索";
    sousuoVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_category"];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:sousuoVC];
    [nav2.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    self.viewController = [[LYXViewController alloc]
                           initWithNibName:@"LYXViewController" bundle:nil];
    self.viewController.title =@"我的活动";
    self.viewController.tabBarItem.image = [UIImage imageNamed:@"icon_tab_my"];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    [nav3.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    tabVC.viewControllers = @[nav1,nav2,nav3];
    [tabVC.tabBar setBackgroundImage:[UIImage imageNamed:@"bg_tab"]];
    [tabVC.tabBar setSelectedImageTintColor:[UIColor redColor]];
    //[tabVC.tabBar setShadowImage:[UIImage imageNamed:@"icon_tab_arrow"]];
    [tabVC.tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"icon_tab_arrow"]];
    self.window.rootViewController = tabVC;
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
