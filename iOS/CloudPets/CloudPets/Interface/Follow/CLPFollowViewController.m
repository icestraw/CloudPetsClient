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
        _dataArray =@[@{@"type":@1,@"head":@"head_image1",@"nickname":@"Reiko",@"display":@"petvideo1"},@{@"type":@2,@"head":@"head_image2",@"nickname":@"魁爷~~",@"display":@[@"mao1",@"mao2",@"mao3",@"mao4",@"mao5"]},@{@"type":@2,@"head":@"head_image3",@"nickname":@"浩浩",@"display":@[@"pidan4",@"pidan2",@"pidan3",@"pidan1"]},@{@"type":@1,@"head":@"head_image4",@"nickname":@"ice",@"display":@"petvideo2"},@{@"type":@1,@"head":@"head_image5",@"nickname":@"申大爷永远是你大爷",@"display":@"petvideo3"},@{@"type":@1,@"head":@"head_image6",@"nickname":@"月",@"display":@"petvideo4"},@{@"type":@2,@"head":@"head_image7",@"nickname":@"曦神",@"display":@[@"huang1",@"huang2",@"huang3"]}];
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
        [videoCell.videoImage.layer insertSublayer:videoCell.playButton.layer atIndex:3];
        
        [videoCell.playButton addTarget:self action:@selector(actionPlayButton:) forControlEvents:UIControlEventTouchUpInside];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionSelectedVideo:)];
        [videoCell.videoImage addGestureRecognizer:tap];
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

- (void)actionSelectedVideo:(UIGestureRecognizer *)tap{
    CLPFollowVideoTableViewCell *cell = (CLPFollowVideoTableViewCell *)tap.view.superview.superview;
    cell.playButton.hidden = NO;
    [self.player pause];
}

- (void)actionPlayButton:(UIButton *)button{
    button.hidden = YES;
    [self.player play];
}

-(void)dealloc{
    [self removeObserverFromPlayerItem:self.player.currentItem];
    [self removeNotification];
}




/**
 *  初始化播放器
 *
 *  @return 播放器对象
 */
-(AVPlayer *)player{
    if (!_player) {
        AVPlayerItem *playerItem=[self getPlayItem:0];
        _player=[AVPlayer playerWithPlayerItem:playerItem];
        [self addObserverToPlayerItem:playerItem];
    }
    return _player;
}

/**
 *  根据视频索引取得AVPlayerItem对象
 *
 *  @param videoIndex 视频顺序索引
 *
 *  @return AVPlayerItem对象
 */
-(AVPlayerItem *)getPlayItem:(NSString *)videoName{
    NSString *urlStr= [[NSBundle mainBundle]pathForResource:videoName ofType:@"mp4"];
    urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    AVPlayerItem *playerItem=[AVPlayerItem playerItemWithURL:url];
    return playerItem;
}
#pragma mark - 通知
/**
 *  添加播放器通知
 */
-(void)addNotification{
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}

-(void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  播放完成通知
 *
 *  @param notification 通知对象
 */
-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
}


/**
 *  给AVPlayerItem添加监控
 *
 *  @param playerItem AVPlayerItem对象
 */
-(void)addObserverToPlayerItem:(AVPlayerItem *)playerItem{
    //监控状态属性，注意AVPlayer也有一个status属性，通过监控它的status也可以获得播放状态
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //监控网络加载情况属性
    [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)removeObserverFromPlayerItem:(AVPlayerItem *)playerItem{
    [playerItem removeObserver:self forKeyPath:@"status"];
    [playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}
/**
 *  通过KVO监控播放器状态
 *
 *  @param keyPath 监控属性
 *  @param object  监视器
 *  @param change  状态改变
 *  @param context 上下文
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    AVPlayerItem *playerItem=object;
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status= [[change objectForKey:@"new"] intValue];
        if(status==AVPlayerStatusReadyToPlay){
         }
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSArray *array=playerItem.loadedTimeRanges;
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];//本次缓冲时间范围
        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds + durationSeconds;//缓冲总长度
        //
    }
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
