//
//  CookDetailViewController.m
//  DailyMenu
//
//  Created by Bleach on 16/9/24.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "CookDetailViewController.h"
#import "CookInfoModel.h"
#import "UINavigationBar+Awesome.h"

@interface CookDetailViewController ()<MobManagerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    
    MobManager *mobManager;
    UITableView *cookTableView;
}
@property (nonatomic, strong) CookInfoModel *cookInfoModel;
@end

@implementation CookDetailViewController

-(CookInfoModel *)cookInfoModel{
    if(!_cookInfoModel){
        _cookInfoModel = [[CookInfoModel alloc] init];
    }
    return _cookInfoModel;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
    NSLog(@"1");
}
-(instancetype)init{
    if(self = [super init]){
        mobManager = [[MobManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cookTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    cookTableView.backgroundColor = [UIColor clearColor];
//    cookTableView.delegate = self;
//    cookTableView.dataSource = self;
    [self.view addSubview:cookTableView];
    // Do any additional setup after loading the view.
}

- (void)GetData{
    
    dispatch_async(dispatch_get_global_queue(0, 1), ^{
        mobManager.delegate = self;
        [mobManager getCookInfoMid:self.mid withIdentifer:0];
    });
    
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
#pragma mark MobManagerDelegate
-(void)getMobDataSuucess:(id)obj{
    self.cookInfoModel = (CookInfoModel *)obj;
}
-(void)getMobDataFailed:(NSString *)errorMsg{
    
}
@end
