//
//  CookInfoModel.h
//  DailyMenu
//
//  Created by Bleach on 16/9/24.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CookModel;
@interface CookInfoModel : NSObject

@property (nonatomic, strong) NSMutableArray *ctgIds;
@property (nonatomic, strong) NSString *ctgTitles;
@property (nonatomic, strong) NSString *menuId;
@property (nonatomic, strong) CookModel *recipe;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *name;

-(instancetype)initWithCtgIds:(NSArray *)ctgIdArray CtgTitles:(NSString *)ctgTitles MenuId:(NSString *)menuId Name:(NSString *)name Recipe:(NSDictionary *)recipe Thumbnail:(NSString *)thumbnail;

@end
