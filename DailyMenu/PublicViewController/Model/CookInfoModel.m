//
//  CookInfoModel.m
//  DailyMenu
//
//  Created by Bleach on 16/9/24.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "CookInfoModel.h"
#import "CookModel.h"

@implementation CookInfoModel

-(instancetype)initWithCtgIds:(NSArray *)ctgIdArray CtgTitles:(NSString *)ctgTitles MenuId:(NSString *)menuId Name:(NSString *)name Recipe:(NSDictionary *)recipe Thumbnail:(NSString *)thumbnail{
    if(self = [super init]){
        _ctgIds = [NSMutableArray arrayWithArray:ctgIdArray];
        _ctgTitles = ctgTitles;
        _menuId = menuId;
        _name = name;
        _recipe = [[CookModel alloc] initWithIMG:[recipe objectForKey:@"img"] Ingredients:[recipe objectForKey:@"ingredients"] Method:[recipe objectForKey:@"method"] Sumary:[recipe objectForKey:@"sumary"] Title:[recipe objectForKey:@"title"]];
        _thumbnail = thumbnail;
    }
    return self;
}
-(instancetype)init{
    if(self = [super init]){
        _ctgIds = [NSMutableArray array];
        _recipe = [[CookModel alloc] init];
    }
    return self;
}
@end
