//
//  AppManager.h
//  menu
//
//  Created by 菲旸 on 16/9/6.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AppNavigationController;

@interface AppManager : NSObject
/**
 *  获取单例
 */
+ (id)getInstance;

/**
 *  获取当前视图根控制器
 */
- (AppNavigationController *)getRootController;

/**
 * 弹出注册界面
 */
- (void)showRegisterController;
/**
 *  弹出登录界面
 */
- (void)showLoginController;
@end
