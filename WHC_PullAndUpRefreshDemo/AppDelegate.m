//
//  AppDelegate.m
//  WHC_PullAndUpRefreshDemo
//
//  Created by 吴海超 on 15/7/24.
//  Copyright (c) 2015年 吴海超. All rights reserved.
//

/*
 *  qq:712641411
 *  iOSqq群:302157745
 *  gitHub:https://github.com/netyouli
 *  csdn:http://blog.csdn.net/windwhc/article/category/3117381
 */

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIScrollView+WHC_PullRefresh.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController  * tv = [[UITabBarController alloc]init];
    
    ViewController * v1 = [ViewController new];
    v1.refreshStyle = AllStyle;
    UINavigationController  * nv1 = [[UINavigationController alloc]initWithRootViewController:v1];
    nv1.tabBarItem.title = @"上下拉刷新";
    nv1.tabBarItem.image = [UIImage imageNamed:@"whc"];
    nv1.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 8, 8, 8);
    
    ViewController * v2 = [ViewController new];
    v2.refreshStyle = HeaderStyle;
    UINavigationController  * nv2 = [[UINavigationController alloc]initWithRootViewController:v2];
    nv2.tabBarItem.title = @"下拉刷新";
    nv2.tabBarItem.image = [UIImage imageNamed:@"whc"];
    nv2.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 8, 8, 8);
    
    ViewController * v3 = [ViewController new];
    v3.refreshStyle = FooterStyle;
    UINavigationController  * nv3 = [[UINavigationController alloc]initWithRootViewController:v3];
    nv3.tabBarItem.title = @"上拉刷新";
    nv3.tabBarItem.image = [UIImage imageNamed:@"whc"];
    nv3.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 8, 8, 8);
    
    tv.viewControllers = @[nv1,nv2,nv3];
    _window.rootViewController = tv;
    [_window makeKeyAndVisible];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:38.0  / 255.0
                                                                green:110.0 / 255.0
                                                                 blue:239.0  / 255.0
                                                                alpha:1.0];
    [UINavigationBar appearance].translucent = YES;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
