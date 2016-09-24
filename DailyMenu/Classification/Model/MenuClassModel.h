//
//  MenuClassModel.h
//  DailyMenu
//
//  Created by 菲旸 on 16/9/22.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuClassModel : NSObject

@property (nonatomic,strong) NSString *ctgId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *parentId;
@property (nonatomic,strong) NSMutableArray *childsArray;
/**
 *  初始化菜单分类模型
 *
 *  @param ctgId    分类id
 *  @param name     分类名
 *  @param parentId 父类名
 *
 *  @return 模型
 */
- (id)init:(NSString *)ctgId
  withName:(NSString *)name
withParentId:(NSString *)parentId
withChildsMenu:(NSMutableArray *)childsArray;

@end
