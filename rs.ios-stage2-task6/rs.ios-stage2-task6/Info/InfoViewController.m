//
//  InfoViewController.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 24.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "InfoViewController.h"
#import "Color.h"
#import "InfoTableViewCell.h"
#import <Photos/Photos.h>
#import "DetailsViewController.h"

@interface InfoViewController ()
@property (strong, nonatomic) PHFetchResult<PHAsset *> *assets;
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Info"];
    [self.navigationController.navigationBar setBarTintColor:[Color yellow]];
    [self.tableView registerNib:[UINib nibWithNibName:@"InfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"InfoTableViewCell"];
    [self.tableView setRowHeight:85];
    self.assets = [PHAsset fetchAssetsWithOptions:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.assets.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell" forIndexPath:indexPath];
    [cell setupWith:self.assets[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailsViewController *detailsVC = [[DetailsViewController alloc] initWithAsset:self.assets[indexPath.row]];
    [self.navigationController pushViewController:detailsVC animated:YES];
}

@end
