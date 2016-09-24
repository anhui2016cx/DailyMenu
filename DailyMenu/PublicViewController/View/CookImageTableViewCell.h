//
//  CookImageTableViewCell.h
//  DailyMenu
//
//  Created by Bleach on 16/9/24.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookImageTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *imgUrl;

+(CookImageTableViewCell *)cellForTableView:(UITableView *)tableView Identifier:(NSString *)identifeir Frame:(CGRect)frame IndexPath:(NSIndexPath *)indexPath;

@end
