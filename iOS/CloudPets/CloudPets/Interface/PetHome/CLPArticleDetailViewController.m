//
//  CLPArticleDetailViewController.m
//  CloudPets
//
//  Created by 冯振玲 on 2017/9/24.
//  Copyright © 2017年 icestraw. All rights reserved.
//

#import "CLPArticleDetailViewController.h"

@interface CLPArticleDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation CLPArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = self.infoDic[@"title"];
    self.contentTextView.text = self.infoDic[@"content"];

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
