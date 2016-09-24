//
//  MobManager.m
//  menu
//
//  Created by 菲旸 on 16/9/21.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "MobManager.h"
#import <MobAPI/MobAPI.h>

#import "MenuClassModel.h"
#import "CookInfoModel.h"
@interface MobManager()
{
    int page;
    BOOL more;
}
@end
@implementation MobManager
- (id)init
{
    if (self = [super init]) {
        page = 1;
        more = YES;
    }
    return self;
}
- (void)getMenuClass:(int)identifer
{
    [MobAPI sendRequest:[MOBACookRequest categoryRequest]
               onResult:^(MOBAResponse *response) {
                   
                   NSString *result = [NSString stringWithFormat:@"%@",[response.responder objectForKey:@"msg"]];
                   
                   if (result && [result isEqualToString:@"success"]) {
                       //解析返回数据封装成模型
                       NSDictionary *classDic = [response.responder objectForKey:@"result"];
                       
                       NSArray *classArray = [classDic objectForKey:@"childs"];
                       
                       NSMutableArray *dataArray = [NSMutableArray array];
                       
                       for (NSDictionary *s in classArray) {
                           
                        NSDictionary *childsDic = [s objectForKey:@"categoryInfo"];
                        MenuClassModel *model = [[MenuClassModel alloc] init:[childsDic objectForKey:@"ctgId"] withName:[childsDic objectForKey:@"name"] withParentId:[childsDic objectForKey:@"parentId"] withChildsMenu:[s objectForKey:@"childs"]];
                           [dataArray addObject:model];
                           
                       }
                       //返回数据
                       if (self.delegate && [self.delegate respondsToSelector:@selector(getMobDataSuucess: withIdentifer:)]) {
                           [self.delegate getMobDataSuucess:dataArray withIdentifer:identifer];
                       }
                       
                   } else {
                       
                       if (self.delegate && [self.delegate respondsToSelector:@selector(getMobDataFailed: withIdentifer:)]) {
                           [self.delegate getMobDataFailed:@"数据加载异常" withIdentifer:identifer];
                       }
                       
                   }
                   
               }];
}

- (void)getCookInfoMid:(NSString *)mid withIdentifer:(int)identifer{
    [MobAPI sendRequest:[MOBACookRequest infoDetailRequestById:mid]
               onResult:^(MOBAResponse *response) {
        
                   NSString *result = [NSString stringWithFormat:@"%@",[response.responder objectForKey:@"msg"]];
                   
                   if(result && [result isEqualToString:@"success"]){
                       
                       NSDictionary *classDic = [response.responder objectForKey:@"result"];
                       
                       CookInfoModel *cookInfoModel = [[CookInfoModel alloc] initWithCtgIds:[classDic objectForKey:@"ctgIds"] CtgTitles:[classDic objectForKey:@"ctgTitles"] MenuId:[classDic objectForKey:@"menuId"] Name:[classDic objectForKey:@"name"] Recipe:[classDic objectForKey:@"recipe"] Thumbnail:[classDic objectForKey:@"thumbnail"]];
                       
                       if(self.delegate &&[self.delegate respondsToSelector:@selector(getMobDataSuucess: withIdentifer:)]){
                           [self.delegate getMobDataSuucess:cookInfoModel withIdentifer:identifer];
                       }
                       
                   } else {
                       
                       if(self.delegate &&[self.delegate respondsToSelector:@selector(getMobDataFailed: withIdentifer:)]){
                           [self.delegate getMobDataFailed:@"数据加载异常" withIdentifer:identifer];
                       }
                       
                   }
                   
                   
    }];
}

- (void)getMenuClassList:(NSString *)listId withIdentifer:(int)identifer
{
    
    static int pageSize = 20;
    [MobAPI sendRequest:[MOBACookRequest searchMenuRequestByCid:listId
                                                           name:nil
                                                           page:page
                                                           size:pageSize] onResult:^(MOBAResponse *response) {
        
        if (response.responder) {
            
            NSArray *listArray = [response.responder objectForKey:@"list"];
            if (listArray.count < pageSize) {//说明没有下一页了
                more = NO;
                page = 1;
            } else {
                more = YES;
                page ++;
            }
            //解析数据
            NSMutableArray *dataArray = [[NSMutableArray alloc] init];
            for (NSDictionary *classDic in listArray) {
                
              CookInfoModel *cookInfoModel = [[CookInfoModel alloc] initWithCtgIds:[classDic objectForKey:@"ctgIds"] CtgTitles:[classDic objectForKey:@"ctgTitles"] MenuId:[classDic objectForKey:@"menuId"] Name:[classDic objectForKey:@"name"] Recipe:[classDic objectForKey:@"recipe"] Thumbnail:[classDic objectForKey:@"thumbnail"]];
                
                [dataArray addObject:cookInfoModel];
            }
            
            //返回数据
            if (self.delegate && [self.delegate respondsToSelector:@selector(getMobDataSuucess: withIdentifer:)]) {
                [self.delegate getMobDataSuucess:dataArray withIdentifer:identifer];
            }

        } else {
            
            if(self.delegate &&[self.delegate respondsToSelector:@selector(getMobDataFailed: withIdentifer:)]){
                [self.delegate getMobDataFailed:@"数据加载异常" withIdentifer:identifer];
            }
        
        }
        
     
    }];
    
    
}
@end
