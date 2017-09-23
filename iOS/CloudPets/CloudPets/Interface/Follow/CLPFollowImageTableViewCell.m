//
//  CLPFollowImageTableViewCell.m
//  CloudPets
//
//  Created by 冯振玲 on 2017/9/23.
//  Copyright © 2017年 icestraw. All rights reserved.
//

#import "CLPFollowImageTableViewCell.h"

@implementation CLPFollowImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;


    // Configure the view for the selected state
}

@end
