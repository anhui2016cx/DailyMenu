//
//  ClassificationViewController.m
//  menu
//
//  Created by 菲旸 on 16/9/5.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "ClassificationViewController.h"

#import "MenuClassTableViewCell.h"

#import "MobManager.h"
#import "MenuClassModel.h"
#import "MenuClassChildsModel.h"
@interface ClassificationViewController ()<UITableViewDelegate,UITableViewDataSource,MobManagerDelegate>
{
    int currentClassIndex;//当前选择分类
    
    MobManager *mobManager;
    
    UITableView *classTableView;
    UIScrollView *menuChildsView;
}
@property (nonatomic,strong) NSArray *classArray;
@end
@implementation ClassificationViewController
- (id)init
{
    if (self = [super init]) {
        
        currentClassIndex = 0;
        
        mobManager = [[MobManager alloc] init];

    }
    return self;
}

- (NSArray *)classArray
{
    if (!_classArray) {
        
        _classArray = [[NSArray alloc] init];
        
    }
    return _classArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"TabBarBackGroundImage.png"] forBarMetrics:UIBarMetricsDefault];
    //添加搜索条
    float menuSearchBar_height = 40.0f;
    UISearchBar *menuSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), CGRectGetWidth(self.view.frame), menuSearchBar_height)];
    menuSearchBar.placeholder = @"菜谱";
    [self.view addSubview:menuSearchBar];
    
    //添加分类菜单列表
    classTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(menuSearchBar.frame), CGRectGetWidth(self.view.frame) / 5.0, CGRectGetHeight(self.view.frame) - CGRectGetMaxY(menuSearchBar.frame) - CGRectGetHeight(self.tabBarController.tabBar.frame))];
    classTableView.delegate = self;
    classTableView.dataSource = self;
    [self.view addSubview:classTableView];
    [self getData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)getData
{
    //先判断本地有无缓存，如果有缓存则先加载本地文件
    
    
    //开启线程拉取数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        mobManager.delegate = self;
        [mobManager getMenuClass];
    });

}
- (void)initChildsView
{
    if (menuChildsView) {
        [menuChildsView removeFromSuperview];
        menuChildsView = nil;
    }
    
    //添加分类子菜单视图
    menuChildsView = [[UIScrollView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(classTableView.frame), CGRectGetMinY(classTableView.frame), CGRectGetWidth(self.view.frame) - CGRectGetWidth(classTableView.frame), CGRectGetHeight(classTableView.frame))];
    menuChildsView.scrollEnabled = YES;
    menuChildsView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:menuChildsView];
    
    //根据当前选择的分类 显示子分类内容
    MenuClassModel *model = [self.classArray objectAtIndex:currentClassIndex];
    int index_h = 1;//横向
    int index_v = 1;//竖向
    UIButton *lastButton = nil;
    int childsIndex = 0;
    for (MenuClassChildsModel *s in model.childsArray) {
        UIButton *childsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        childsButton.layer.cornerRadius = 5.0;
        childsButton.layer.masksToBounds = YES;
        childsButton.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
        childsButton.tag = childsIndex;
        float topMargin = 10.0;
        float margin = 10.0;
        float font = 14.0;
        float button_margin = 10.0;
        CGSize titleSize = [s.name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}];
        
        float x = margin;
        //判断是否需要换行
        if (lastButton) {
            if (CGRectGetMaxX(lastButton.frame) + margin + titleSize.width + button_margin >= CGRectGetWidth(menuChildsView.frame)) {
                index_h = 1;
                index_v ++;
                lastButton = nil;
            }
            x = margin + CGRectGetMaxX(lastButton.frame);
        }
        childsButton.frame = CGRectMake(x, index_v * topMargin + (titleSize.height + button_margin) * (index_v - 1), titleSize.width + button_margin, titleSize.height + button_margin);
        [childsButton setTitle:s.name forState:UIControlStateNormal];
        [childsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        childsButton.titleLabel.font = [UIFont systemFontOfSize:font];
        childsButton.titleLabel.textColor = [UIColor blackColor];
        lastButton = childsButton;
        [childsButton addTarget:self action:@selector(selectChildsMenu:) forControlEvents:UIControlEventTouchUpInside];
        [menuChildsView addSubview:childsButton];
        childsButton.tag = childsIndex;
        childsIndex ++;
    }
    
    
    
}

- (void)selectChildsMenu:(UIButton *)button
{
    NSLog(@"%ld",(long)button.tag);
}
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetHeight(classTableView.frame) / self.classArray.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    currentClassIndex = (int)indexPath.row;
    [tableView reloadData];
    [self initChildsView];
}
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.classArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"classCell";
    MenuClassTableViewCell *classCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (classCell == nil) {
        classCell = [[MenuClassTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    classCell.selectionStyle = UITableViewCellSelectionStyleNone;
    MenuClassModel *model = [self.classArray objectAtIndex:indexPath.row];
    
    BOOL currentCell = NO;
    if (indexPath.row == currentClassIndex) {
        currentCell = YES;
    }
    classCell.cell_w = CGRectGetWidth(classTableView.frame);
    classCell.cell_height = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    [classCell drawCell:model withCurrentCell:currentCell];
    return classCell;
}

#pragma mark MobManagerDelegate
- (void)getMobDataSuucess:(id)obj
{
    if ([obj isKindOfClass:[NSMutableArray class]]) {
        self.classArray = obj;
        dispatch_async(dispatch_get_main_queue(), ^{
            [classTableView reloadData];
            [self initChildsView];
        });
    }
}
- (void)getMobDataFailed:(NSString *)errorMsg
{
    
}



@end
