//
//  CLPFollowImageTableViewCell.h
//  CloudPets
//
//  Created by 冯振玲 on 2017/9/23.
//  Copyright © 2017年 icestraw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLPFollowImageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *petImageView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *petImageScrollView;


@end
