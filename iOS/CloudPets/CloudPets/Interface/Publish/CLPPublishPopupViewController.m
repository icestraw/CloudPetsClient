//
//  CLPPublishPopupViewController.m
//  CloudPets
//
//  Created by ice on 23/09/2017.
//  Copyright © 2017 icestraw. All rights reserved.
//

#import "CLPPublishPopupViewController.h"
#import "TZImagePickerController.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface CLPPublishPopupViewController ()<TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *pushButton;
@property (weak, nonatomic) IBOutlet UILabel *pushSuccessLabel;

@end

@implementation CLPPublishPopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pushButton.hidden = YES;
}

- (IBAction)actionPhotoButton:(UIButton *)sender {
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    imagePickerVc.allowTakePicture = NO;
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.naviBgColor = [UIColor whiteColor];
    imagePickerVc.naviTitleColor = [UIColor darkGrayColor];
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.

    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    self.pushButton.hidden = NO;
    CGFloat width = self.imageView.bounds.size.width / 3 - 5;
    for (int i = 0; i < photos.count; i ++) {
      
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((10 + width) * (i % 3), (10 + width) * (i / 3), width , width)];
        imageView.image = photos[i];
        [self.imageView addSubview:imageView];
        
    }
   
}
- (IBAction)actionLiveButton:(UIButton *)sender {
    
}
- (IBAction)actionVideoButton:(id)sender {
 
}
- (IBAction)actionPushButton:(UIButton *)sender {
    self.pushSuccessLabel.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.pushSuccessLabel.hidden = YES;
        [self dismiss:nil];
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    self.backgroundController.shouldBack = YES;
    [self dismissViewControllerAnimated:YES completion:^{
        [self.backgroundController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
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
