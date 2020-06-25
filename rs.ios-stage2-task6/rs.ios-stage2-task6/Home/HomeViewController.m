//
//  HomeViewController.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 24.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "HomeViewController.h"
#import "Color.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"RSSchool Task 6"];
    [self.navigationController.navigationBar setBarTintColor:[Color yellow]];
    [self.tableView setRowHeight:(self.view.bounds.size.height-75-self.tabBarController.tabBar.bounds.size.height)/3];
    [self.tableView setBounces:NO];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.userInteractionEnabled = NO;
    return cell;
}


@end
