//
//  CookModel.h
//  DailyMenu
//
//  Created by Bleach on 16/9/24.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CookModel : NSObject

@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSArray *ingredients;
@property (nonatomic, strong) NSArray *method;
@property (nonatomic, strong) NSString *sumary;
@property (nonatomic, strong) NSString *title;

-(instancetype)initWithIMG:(NSString *)img Ingredients:(NSArray *)ingredients Method:(NSArray *)method Sumary:(NSString *)sumary Title:(NSString *)title;

@end
