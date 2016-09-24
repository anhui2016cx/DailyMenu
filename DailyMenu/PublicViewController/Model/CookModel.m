//
//  CookModel.m
//  DailyMenu
//
//  Created by Bleach on 16/9/24.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "CookModel.h"

@implementation CookModel
-(instancetype)initWithIMG:(NSString *)img Ingredients:(NSArray *)ingredients Method:(NSArray *)method Sumary:(NSString *)sumary Title:(NSString *)title{
    if(self = [super init]){
        _img = img;
        _ingredients = ingredients;
        _method = method;
        _sumary = sumary;
        _title = title;
    }
    return self;
}
@end
