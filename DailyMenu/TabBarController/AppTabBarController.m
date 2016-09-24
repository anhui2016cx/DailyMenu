//
//  AppTabBarController.m
//  menu
//
//  Created by 菲旸 on 16/9/5.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "AppTabBarController.h"
#import "PersonalCenterViewController.h"
#import "DynamicViewController.h"
#import "ClassificationViewController.h"
#import "HomeViewController.h"

@interface AppTabBarController ()

@end

@implementation AppTabBarController

- (id)init
{
    if (self = [super init]) {
        //创建视图控制器(1.首页  2.菜谱分类 3.动态 4.个人中心)
        
        //1.首页
        HomeViewController *homeVc = [[HomeViewController alloc] init];
        UINavigationController *homeNv = [[UINavigationController alloc] initWithRootViewController:homeVc];
        homeNv.tabBarItem.title = @"首页";

        //2.菜谱分类
        ClassificationViewController *classVc = [[ClassificationViewController alloc] init];
        UINavigationController *classNv = [[UINavigationController alloc] initWithRootViewController:classVc];
        classNv.tabBarItem.title = @"分类";
        
        //3.动态
        DynamicViewController *dyVc = [[DynamicViewController alloc] init];
        UINavigationController *dyNv = [[UINavigationController alloc] initWithRootViewController:dyVc];
        dyNv.tabBarItem.title = @"动态";
        
        //4.个人中心
        PersonalCenterViewController *perVc = [[PersonalCenterViewController alloc] init];
        UINavigationController *perNv = [[UINavigationController alloc] initWithRootViewController:perVc];
        perNv.tabBarItem.title = @"个人中心";
        
        NSArray *vcArray = [NSArray arrayWithObjects:homeNv,classNv,dyNv,perNv,nil];
        
        self.viewControllers = vcArray;
        
        self.selectedIndex = 0;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
