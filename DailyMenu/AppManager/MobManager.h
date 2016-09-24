//
//  MobManager.h
//  menu
//
//  Created by 菲旸 on 16/9/21.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MobManagerDelegate <NSObject>

/**
 *  获取信息成功
 *
 *  @param obj 服务器返回结果
 */
- (void)getMobDataSuucess:(id)obj;

/**
 *  获取信息失败
 *
 *  @param errorMsg 错误信息
 */
- (void)getMobDataFailed:(NSString *)errorMsg;
@end


@interface MobManager : NSObject

@property (nonatomic,assign) id<MobManagerDelegate> delegate;

/**
 *  获取菜单分类
 */
- (void)getMenuClass;
/**
 *  获取菜谱详细信息
 */
- (void)getCookInfoMid:(NSString *)mid;
@end
