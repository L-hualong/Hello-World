//
//  AppDelegate.m
//  test_oc1
//
//  Created by 刘华龙 on 2017/2/19.
//  Copyright © 2017年 刘华龙. All rights reserved.
//

#import "AppDelegate.h"
#import "LeadingPageController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    LeadingPageController *leadingController = [[LeadingPageController alloc]initWithPagesCount:5 SetupCellHandler:^(LeadingPageCell *cell, NSIndexPath *indexPath) {

        NSString* imageName = [NSString stringWithFormat:@"wangyiyun%ld",(long)indexPath.row];
        cell.imageView.image = [UIImage imageNamed:imageName];

        [cell.btn setTitle:@"立即体验" forState:(UIControlStateNormal)];
        [cell.btn setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];

    } FinishHandle:^(UIButton *btn) {
        NSLog(@"点击了按钮");
    }];

    leadingController.pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    leadingController.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = leadingController;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
