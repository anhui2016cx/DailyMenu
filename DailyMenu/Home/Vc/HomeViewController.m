//
//  HomeViewController.m
//  menu
//
//  Created by 菲旸 on 16/9/5.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "HomeViewController.h"
#import "CookDetailViewController.h"


@interface HomeViewController ()
{
    MobManager *mobManager;
}
@end

@implementation HomeViewController

-(instancetype)init{
    if([super init]){
        mobManager = [[MobManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *cookButtuon = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    cookButtuon.backgroundColor = [UIColor greenColor];
    cookButtuon.center = self.view.center;
    [cookButtuon addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cookButtuon];

    // Do any additional setup after loading the view.
}

- (void)click:(UIButton *)sender{
    CookDetailViewController *cookVC = [[CookDetailViewController alloc] init];
    cookVC.mid = @"00100010070000017731";
    [self.navigationController pushViewController:cookVC animated:YES];
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
