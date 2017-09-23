//
//  CLPTabBarController.m
//  CloudPets
//
//  Created by ice on 23/09/2017.
//  Copyright © 2017 icestraw. All rights reserved.
//

#import "CLPTabBarController.h"

@interface CLPTabBarController () <UITabBarControllerDelegate>

@property (nonatomic) NSInteger previousIndex;

@end

@implementation CLPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    self.previousIndex = self.selectedIndex;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([[self viewControllers] indexOfObject:viewController] == 2) {
        
        UIViewController *vc = [[UIStoryboard storyboardWithName:@"CLPPublish" bundle:nil] instantiateViewControllerWithIdentifier:@"CLPPublishPopupViewController"];
        [vc setModalPresentationStyle:UIModalPresentationOverCurrentContext];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:^{
            
        }];
        return NO;
    }
    return YES;
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
