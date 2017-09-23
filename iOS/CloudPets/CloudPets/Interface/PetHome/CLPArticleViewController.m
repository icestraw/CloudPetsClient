//
//  CLPArticleViewController.m
//  CloudPets
//
//  Created by 冯振玲 on 2017/9/24.
//  Copyright © 2017年 icestraw. All rights reserved.
//

#import "CLPArticleViewController.h"
#import "CLPArticleDetailViewController.h"

@interface CLPArticleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *petImageView;
@property (weak, nonatomic) IBOutlet UILabel *varietyLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *commondityLabel;

@property (weak, nonatomic) IBOutlet UILabel *toyLabel;
@property (weak, nonatomic) IBOutlet UILabel *cheatsLabel;
@property (weak, nonatomic) IBOutlet UILabel *hospitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopLabel;

@end

@implementation CLPArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.petImageView.image = [UIImage imageNamed:self.infoDic[@"peturl"]];
    self.varietyLabel.text = self.infoDic[@"variety"];
    self.colorLabel.text = self.infoDic[@"color"];
    self.commondityLabel.text = self.infoDic[@"commondity"];
    self.toyLabel.text = self.infoDic[@"Toy"];
    self.cheatsLabel.text = self.infoDic[@"cheats"];
    self.hospitalLabel.text = self.infoDic[@"hospital"];
    self.shopLabel.text = self.infoDic[@"shop"];
    
}
- (IBAction)actionPushButton:(UIButton *)sender {
    
//    [self performSegueWithIdentifier:@"articleDetail" sender:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    CLPArticleDetailViewController *articleVC = segue.destinationViewController;
    articleVC.infoDic = @{@"title":@"Cat introduction",@"content":@"Many people in the beginning when the intention of raising a cat, feeling stumbled, do not know where to start, check the Internet a lot of information, see a lot of people poor training, as normal, followed by blind support; or see To the total land of a month to invest thousands of dollars, was scared off. So this article for pure Meng new, listed in the cat need to prepare the cat supplies, the advantages of various supplies, shortcomings, probably spending, and some small points of attention.\n Most of the pictures from Taobao screenshots, may be accompanied by advertising language and the like, with reference to see on the line.\n Directory (content of interest directly to CRTL + F) \n Food section: \n  Cat food (about 250 yuan per month) \n Cat canned (about 780 yuan per month) \n Homemade cat rice (225 yuan or so) \n  Cat supplies section: \n Cat sand basin (ranging from 30 to 200 yuan) \n Cat litter (most cat litter a cat consumes one dollar a day) \n Cat scratch board (10 dollars per month) \n Cat crawling (400 yuan, and then do not recommend cheap)"};
    
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
