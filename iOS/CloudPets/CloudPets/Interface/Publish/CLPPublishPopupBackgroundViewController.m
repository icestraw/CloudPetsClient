//
//  CLPPublishPopupBackgroundViewController.m
//  CloudPets
//
//  Created by ice on 23/09/2017.
//  Copyright © 2017 icestraw. All rights reserved.
//

#import "CLPPublishPopupBackgroundViewController.h"
#import "CLPPublishPopupViewController.h"

@interface CLPPublishPopupBackgroundViewController ()

@end

@implementation CLPPublishPopupBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!self.shouldBack) {
        [self performSegueWithIdentifier:@"popup" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"popup"]) {
        CLPPublishPopupViewController *vc = [segue destinationViewController];
        vc.backgroundController = self;
    }
}


@end
