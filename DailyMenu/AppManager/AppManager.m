//
//  AppManager.m
//  menu
//
//  Created by 菲旸 on 16/9/6.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "AppManager.h"
#import "AppDelegate.h"
#import "AppNavigationController.h"

static AppManager *appManager = nil;
@implementation AppManager

+ (id)getInstance
{
    if (!appManager) {
        
        appManager = [[AppManager alloc] init];
        
        
        
    }
    return appManager;
}

- (id)init
{
    if (self = [super init]) {
        
        
    }
    return self;
}

- (UINavigationController *)getRootController
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    if ([appDelegate.window.rootViewController isKindOfClass:AppNavigationController.class]) {
        return (UINavigationController *)appDelegate.window.rootViewController;
    } else if ([appDelegate.window.rootViewController isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabVc = (UITabBarController *)appDelegate.window.rootViewController;
        return (UINavigationController *)[tabVc selectedViewController];
    }
    return nil;
}

- (void)showRegisterController
{
    
}
- (void)showLoginController
{
    
}
@end
