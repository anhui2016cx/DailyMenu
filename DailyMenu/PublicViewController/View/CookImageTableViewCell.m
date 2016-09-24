//
//  CookImageTableViewCell.m
//  DailyMenu
//
//  Created by Bleach on 16/9/24.
//  Copyright © 2016年 xfy. All rights reserved.
//

#import "CookImageTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CookImageTableViewCell
{
    UIImageView *cookImage;
}
-(instancetype)initWithFrame:(CGRect)frame IndexPath:(NSIndexPath *)indexPath{
    if(self = [super initWithFrame:frame]){
        cookImage = [[UIImageView alloc] initWithFrame:frame];
        cookImage.layer.masksToBounds = YES;
        [self addSubview:cookImage];
    }
    return self;
}

+(CookImageTableViewCell *)cellForTableView:(UITableView *)tableView Identifier:(NSString *)identifeir Frame:(CGRect)frame IndexPath:(NSIndexPath *)indexPath{
    CookImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifeir];
    
    if(!cell){
        cell = [[CookImageTableViewCell alloc] initWithFrame:frame IndexPath:indexPath];
    }
    
    return cell;
}

-(void)setImgUrl:(NSString *)imgUrl{
    _imgUrl = imgUrl;
    
    [cookImage sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
}

@end
