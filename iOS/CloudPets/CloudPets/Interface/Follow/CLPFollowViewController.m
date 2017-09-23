//
//  CLPFollowViewController.m
//  CloudPets
//
//  Created by 冯振玲 on 2017/9/23.
//  Copyright © 2017年 icestraw. All rights reserved.
//

#import "CLPFollowViewController.h"
#import "CLPFollowImageTableViewCell.h"
#import "CLPFollowVideoTableViewCell.h"
#import <AVFoundation/AVFoundation.h>

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface CLPFollowViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong)NSIndexPath *indexPath;
@property (nonatomic, strong)AVPlayer *player;
@property (nonatomic, strong)AVPlayerItem *playerItem;
@property (nonatomic, strong)UIProgressView *progress;
@end

@implementation CLPFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.title = @"关注";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"CLPFollowVideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"CLPFollowVideoTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CLPFollowImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"CLPFollowImageTableViewCell"];
    

    
    [self.view addSubview:self.tableView];
    
    
    
    
    
    
}
-(NSArray *)dataArray{
    if(!_dataArray){
        _dataArray =@[@{@"type":@1,@"head":@"head_image1",@"nickname":@"Reiko",@"display":@"mao_video1.gif"},@{@"type":@2,@"head":@"head_image2",@"nickname":@"魁爷~~",@"display":@[@"mao1",@"mao2",@"mao3",@"mao4",@"mao5"]},@{@"type":@2,@"head":@"head_image3",@"nickname":@"浩浩",@"display":@[@"pidan4",@"pidan2",@"pidan3",@"pidan1"]},@{@"type":@1,@"head":@"head_image4",@"nickname":@"ice",@"display":@"mao_video2"},@{@"type":@1,@"head":@"head_image5",@"nickname":@"申大爷永远是你大爷",@"display":@"mao_video3.gif"},@{@"type":@1,@"head":@"head_image6",@"nickname":@"月",@"display":@"mao_video4.gif"},@{@"type":@2,@"head":@"head_image7",@"nickname":@"曦神",@"display":@[@"huang1",@"huang2",@"huang3"]}];
    }
    return _dataArray;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.dataArray[indexPath.row][@"type"] isEqualToNumber:@1]) {
        return 350;
    }else{
        return 430;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *item = self.dataArray[indexPath.row];
     CLPFollowVideoTableViewCell *videoCell = [tableView dequeueReusableCellWithIdentifier:@"CLPFollowVideoTableViewCell"];

     CLPFollowImageTableViewCell *imageCell = [tableView dequeueReusableCellWithIdentifier:@"CLPFollowImageTableViewCell"];
     NSString *headImage = item[@"head"];
     NSString *nickName = item[@"nickname"];


 
    if ([item[@"type"] isEqualToNumber:@1]) {
        if (videoCell == nil) {
            videoCell = [[CLPFollowVideoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CLPFollowVideoTableViewCell"];
        
        }
        videoCell.headImageView.image = [UIImage imageNamed:headImage];
        videoCell.nickNameLabel.text = nickName;
        videoCell.timeLabel.text = @"17:12";
        videoCell.contentLabel.text = @"My cat is very naughty";
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        playerLayer.frame = videoCell.videoImage.bounds;
        playerLayer.videoGravity=AVLayerVideoGravityResizeAspectFill;//视频填充模式
        [videoCell.videoImage.layer addSublayer:playerLayer];
        [self.player play];
        
        
        
        return videoCell;
    }else{
        if (imageCell == nil) {
            imageCell = [[CLPFollowImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CLPFollowImageTableViewCell"];
          

        }
        
        imageCell.headImageView.image = [UIImage imageNamed:headImage];
        imageCell.nickNameLabel.text = nickName;
        NSArray *display = item[@"display"];
        imageCell.petImageView.image =  [UIImage imageNamed:display[0]];
        for (int i = 0; i <display.count ; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 * i + (80 * i), 10, 80, 80)];
            imageView.layer.cornerRadius = 5;
            imageView.layer.masksToBounds = YES;
            imageView.userInteractionEnabled = YES;
            imageView.tag = i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionSelectedImage:)];
            [imageView addGestureRecognizer:tap];
            [imageCell.petImageScrollView addSubview:imageView];
            imageCell.petImageScrollView.contentSize = CGSizeMake(90 * (i + 1), 100);
            imageView.image = [UIImage imageNamed:display[i]];
            imageCell.timeLabel.text = @"11:34";
            imageCell.contentLabel.text = @"so cute!";
            
            
        }
        return imageCell;
    }
 
    
}
- (void)actionSelectedImage:(UIGestureRecognizer *)tap{
    UIImageView *imageView = (UIImageView *)tap.view;
    CLPFollowImageTableViewCell *cell = (CLPFollowImageTableViewCell *)imageView.superview.superview.superview;
    cell.petImageView.image = imageView.image;
    
    

    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
