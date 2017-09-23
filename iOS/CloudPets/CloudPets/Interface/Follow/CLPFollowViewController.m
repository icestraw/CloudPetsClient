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
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface CLPFollowViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;

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
        _dataArray =@[@{@"type":@1,@"head":@"head_image1",@"nickname":@"Reiko"},@{@"type":@2,@"head":@"head_image2",@"nickname":@"魁爷~~"},@{@"type":@2,@"head":@"head_image3",@"nickname":@"浩浩"},@{@"type":@1,@"head":@"head_image4",@"nickname":@"ice"},@{@"type":@1,@"head":@"head_image5",@"nickname":@"申大爷永远是你大爷"},@{@"type":@2,@"head":@"head_image6",@"nickname":@"月"},@{@"type":@1,@"head":@"head_image7",@"nickname":@"曦神"}];
    }
    return _dataArray;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.dataArray[indexPath.row][@"type"] isEqualToNumber:@1]) {
        return 330;
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
        return videoCell;
    }else{
        if (imageCell == nil) {
            imageCell = [[CLPFollowImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CLPFollowImageTableViewCell"];
          

        }
        
        imageCell.headImageView.image = [UIImage imageNamed:headImage];
        imageCell.nickNameLabel.text = nickName;
        return imageCell;
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
