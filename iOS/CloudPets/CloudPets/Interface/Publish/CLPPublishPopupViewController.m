//
//  CLPPublishPopupViewController.m
//  CloudPets
//
//  Created by ice on 23/09/2017.
//  Copyright © 2017 icestraw. All rights reserved.
//

#import "CLPPublishPopupViewController.h"

@interface CLPPublishPopupViewController ()

@end

@implementation CLPPublishPopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
