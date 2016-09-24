//
//  MenuClassTableViewCell.h
//  DailyMenu
//
//  Created by 菲旸 on 16/9/23.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuClassModel;
@interface MenuClassTableViewCell : UITableViewCell
@property (nonatomic,assign) float cell_w;
@property (nonatomic,assign) float cell_height;
- (void)drawCell:(MenuClassModel *)model withCurrentCell:(BOOL)current;
@end
