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
@implementation MobManager

- (void)getMenuClass
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
                       if (self.delegate && [self.delegate respondsToSelector:@selector(getMobDataSuucess:)]) {
                           [self.delegate getMobDataSuucess:dataArray];
                       }
                       
                   } else {
                       
                       if (self.delegate && [self.delegate respondsToSelector:@selector(getMobDataFailed:)]) {
                           [self.delegate getMobDataFailed:@"数据加载异常"];
                       }
                       
                   }
                   
               }];
}
@end
