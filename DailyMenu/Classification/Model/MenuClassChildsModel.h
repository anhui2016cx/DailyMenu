//
//  MenuClassChildsModel.h
//  DailyMenu
//
//  Created by 菲旸 on 16/9/23.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuClassChildsModel : NSObject
@property (nonatomic,strong) NSString *ctgId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *parentId;

- (id)init:(NSString *)ctgId
  withName:(NSString *)name
withParentId:(NSString*)parentId;

@end
