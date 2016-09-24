//
//  MenuClassModel.m
//  DailyMenu
//
//  Created by 菲旸 on 16/9/22.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "MenuClassModel.h"
#import "MenuClassChildsModel.h"
@implementation MenuClassModel
- (id)init:(NSString *)ctgId
  withName:(NSString *)name
withParentId:(NSString *)parentId
withChildsMenu:(NSMutableArray *)childsArray
{
    if (self= [super init]) {
        
        self.ctgId = ctgId;
        self.name = name;
        self.parentId = parentId;
        self.childsArray = childsArray;
    }
    return self;
}

- (void)setChildsArray:(NSMutableArray *)childsArray
{
    NSMutableArray *temArray = [NSMutableArray array];
    
    for (NSDictionary *s in childsArray) {
        
        NSDictionary *infoDic = [s objectForKey:@"categoryInfo"];
        
        MenuClassChildsModel *model = [[MenuClassChildsModel alloc] init:[infoDic objectForKey:@"ctgId"] withName:[infoDic objectForKey:@"name"] withParentId:[infoDic objectForKey:@"parentId"]];
        
        [temArray addObject:model];
        
    }
    _childsArray = temArray;
}


@end
