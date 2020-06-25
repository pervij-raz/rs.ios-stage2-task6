//
//  GalleryViewController.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 24.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "GalleryViewController.h"
#import "Color.h"

@interface GalleryViewController ()

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[Color white]];
    [self setTitle:@"Gallery"];
    [self.navigationController.navigationBar setBarTintColor:[Color yellow]];
}


@end
