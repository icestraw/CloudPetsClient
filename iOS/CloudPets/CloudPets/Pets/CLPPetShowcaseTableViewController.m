//
//  CLPPetShowcaseTableViewController.m
//  CloudPets
//
//  Created by ice on 19/09/2017.
//  Copyright © 2017 icestraw. All rights reserved.
//

#import "CLPPetShowcaseTableViewController.h"

typedef enum : NSUInteger {
    CLPPetShowcaseTableViewSectionVideo,
    CLPPetShowcaseTableViewSectionController,
    CLPPetShowcaseTableViewSectionAlbum,
    CLPPetShowcaseTableViewSectionComment,
    CLPPetShowcaseTableViewSectionPlaceholder,
} CLPPetShowcaseTableViewSection;

@interface CLPPetShowcaseTableViewController ()

@end

@implementation CLPPetShowcaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"呆呆的展厅";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return CLPPetShowcaseTableViewSectionPlaceholder;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    CLPPetShowcaseTableViewSection s = section;
    switch (s) {
        case CLPPetShowcaseTableViewSectionVideo:
        case CLPPetShowcaseTableViewSectionController:
        case CLPPetShowcaseTableViewSectionAlbum:
            return 1;
        case CLPPetShowcaseTableViewSectionComment:
            return 10;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CLPPetShowcaseTableViewSection s = indexPath.section;
    switch (s) {
        case CLPPetShowcaseTableViewSectionVideo:
            return 250;
        case CLPPetShowcaseTableViewSectionController:
            return 100;
        case CLPPetShowcaseTableViewSectionAlbum:
            return 150;
        case CLPPetShowcaseTableViewSectionComment:
            return 50;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    // Configure the cell...
    CLPPetShowcaseTableViewSection s = indexPath.section;
    switch (s) {
        case CLPPetShowcaseTableViewSectionVideo:
            cell = [tableView dequeueReusableCellWithIdentifier:@"video" forIndexPath:indexPath];
            break;
        case CLPPetShowcaseTableViewSectionController:
            cell = [tableView dequeueReusableCellWithIdentifier:@"controller" forIndexPath:indexPath];
            break;
        case CLPPetShowcaseTableViewSectionAlbum:
            cell = [tableView dequeueReusableCellWithIdentifier:@"album" forIndexPath:indexPath];
            break;
        case CLPPetShowcaseTableViewSectionComment:
            cell = [tableView dequeueReusableCellWithIdentifier:@"comment" forIndexPath:indexPath];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
