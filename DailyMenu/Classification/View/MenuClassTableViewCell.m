//
//  MenuClassTableViewCell.m
//  DailyMenu
//
//  Created by 菲旸 on 16/9/23.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "MenuClassTableViewCell.h"
#import "MenuClassModel.h"
@interface MenuClassTableViewCell()
{
    UILabel *titleLbl;
    UIView *leftView;
}
@end
@implementation MenuClassTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawCell:(MenuClassModel *)model withCurrentCell:(BOOL)current
{

    if (!titleLbl) {
        titleLbl = [[UILabel alloc] init];
        [self addSubview:titleLbl];
    }
    float titleFont = 12.0;
    float t_x = 10.0;
    float maxw = _cell_w - t_x * 2;
    float leftView_w = 5.0f;

    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:titleFont]};
    CGSize titleSize = [model.name boundingRectWithSize:CGSizeMake(maxw, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    titleLbl.frame = CGRectMake(leftView_w + (_cell_w - leftView_w) / 2.0 - titleSize.width / 2.0, _cell_height / 2.0 - titleSize.height / 2.0, titleSize.width, titleSize.height);
    titleLbl.text = model.name;
    titleLbl.font = [UIFont systemFontOfSize:titleFont];
    titleLbl.numberOfLines = 0;
    titleLbl.lineBreakMode = NSLineBreakByCharWrapping;
    titleLbl.textAlignment = NSTextAlignmentCenter;
    
    if (!leftView) {
        leftView = [[UIView alloc] init];
        [self addSubview:leftView];
    }
    leftView.frame = CGRectMake(0, 0, leftView_w, _cell_height);
    
    if (current) {
        self.backgroundColor = [UIColor whiteColor];
        titleLbl.textColor = [UIColor orangeColor];
        leftView.backgroundColor = [UIColor orangeColor];
        
    } else {
        self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
        titleLbl.textColor = [UIColor blackColor];
        leftView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    }
}
@end
