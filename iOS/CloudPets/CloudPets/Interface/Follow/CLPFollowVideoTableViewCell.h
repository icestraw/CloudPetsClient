//
//  CLPFollowVideoTableViewCell.h
//  CloudPets
//
//  Created by 冯振玲 on 2017/9/23.
//  Copyright © 2017年 icestraw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLPFollowVideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *videoImage;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
