//
//  MenuClassChildsModel.m
//  DailyMenu
//
//  Created by 菲旸 on 16/9/23.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "MenuClassChildsModel.h"

@implementation MenuClassChildsModel
- (id)init:(NSString *)ctgId
  withName:(NSString *)name
withParentId:(NSString*)parentId
{
    if (self= [super init]) {
        
        self.ctgId = ctgId;
        self.name = name;
        self.parentId = parentId;
    }
    return self;
}
@end
