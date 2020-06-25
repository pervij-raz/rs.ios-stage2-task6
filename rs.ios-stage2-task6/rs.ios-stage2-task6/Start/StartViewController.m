//
//  StartViewController.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 23.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "StartViewController.h"
#import <UIKit/UIKit.h>
#import "Color.h"
#import "Triangle.h"
#import "InfoViewController.h"
#import "GalleryViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"
#import "FiguresView.h"

@interface StartViewController ()
@property (strong, nonatomic) UILabel * label;
@property (strong, nonatomic) FiguresView * stackView;
@property (strong, nonatomic) UIButton * button;

@end

@implementation StartViewController

#pragma mark: - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[Color white]];
    [self setupContent];
    [self.button addTarget:self action:@selector(buttonDidTap) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.stackView animateViews];
}

#pragma mark: - Setup UI Components

-(void)setupContent {
    [self setupLabel];
    [self setupImages];
    [self setupButton];
}

-(void)setupLabel {
    self.label = [UILabel new];
    [self.label setFont:[UIFont systemFontOfSize:24.0 weight:UIFontWeightMedium]];
    [self.label setTextColor:[Color black]];
    [self.label setText:@"Are you ready?"];
    [self.view addSubview:self.label];
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1 constant:50] setActive:YES];
}

-(void)setupImages {
    self.stackView = [FiguresView new];
    [self.view addSubview:self.stackView];
    [self.stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0] setActive:YES];
}

-(void)setupButton {
    self.button = [UIButton new];
    [self.button setBackgroundColor:[Color yellow]];
    [self.button setTitleColor:[Color black] forState:UIControlStateNormal];
    [self.button.titleLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
    [self.button setTitle:@"START" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    [self.button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:55] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:-50] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.stackView attribute:NSLayoutAttributeLeading multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.stackView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0] setActive:YES];
    self.button.layer.cornerRadius = 30;
    self.button.clipsToBounds = YES;
}

#pragma mark: - Actions

-(void)buttonDidTap {
    UITabBarController *tabBarVC = [UITabBarController new];
    UINavigationController *infoVC = [[UINavigationController alloc] initWithRootViewController:[InfoViewController new]];
    UINavigationController *galleryVC = [[UINavigationController alloc] initWithRootViewController:[GalleryViewController new]];
    UINavigationController *homeVC = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    tabBarVC.viewControllers = @[infoVC, galleryVC, homeVC];
    [tabBarVC setSelectedIndex:1];
    [infoVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"info_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:@"info_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [galleryVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"gallery_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:@"gallery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [homeVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"home_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:@"home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = tabBarVC;
    [appDelegate.window makeKeyAndVisible];
}

@end
