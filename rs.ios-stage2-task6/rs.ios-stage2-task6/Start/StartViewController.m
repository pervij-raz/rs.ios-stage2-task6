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

@interface StartViewController ()
@property (strong, nonatomic) UILabel * label;
@property (strong, nonatomic) UIStackView * stackView;
@property (strong, nonatomic) UIButton * button;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[Color white]];
    [self setupContent];
    [self.button addTarget:self action:@selector(buttonDidTap) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self animateViews];
}

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
    UIView *circle = [self createView];
    UIView *square = [self createView];
    UIView *triangle = [Triangle new];
    [self setConstraintsToImage:triangle];
    circle.layer.cornerRadius = 35;
    circle.clipsToBounds = YES;
    [circle setBackgroundColor:[Color red]];
    [square setBackgroundColor:[Color blue]];
    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:@[circle, square, triangle]];
    [self.stackView setAxis:UILayoutConstraintAxisHorizontal];
    [self.stackView setSpacing:20];
    [self.stackView setDistribution:UIStackViewDistributionFillEqually];
    [self.stackView setAlignment:UIStackViewAlignmentCenter];
    [self.view addSubview:self.stackView];
    [self.stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0] setActive:YES];
}

-(UIView*)createView {
    UIView *view = [UIView new];
    [self setConstraintsToImage: view];
    return view;
}

-(void)setConstraintsToImage: (UIView*)view{
    [[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:70] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:70] setActive:YES];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
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

-(void)animateViews {
    CGPoint initialPoint = CGPointMake(self.stackView.arrangedSubviews[1].center.x, self.stackView.arrangedSubviews[1].center.y);
    
    [UIView animateWithDuration: 1
                          delay: 0
                        options: UIViewAnimationOptionTransitionNone
                     animations: ^{
        self.stackView.arrangedSubviews[1].center = CGPointMake(self.stackView.arrangedSubviews[1].center.x, self.stackView.arrangedSubviews[1].center.y + self.stackView.arrangedSubviews[1].bounds.size.width * 0.1);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
            self.stackView.arrangedSubviews[1].center = CGPointMake(self.stackView.arrangedSubviews[1].center.x, self.stackView.arrangedSubviews[1].center.y - self.stackView.arrangedSubviews[1].bounds.size.width * 0.2);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
                self.stackView.arrangedSubviews[1].center = initialPoint;
            } completion:^(BOOL finished){
                [self animateViews];
            }];
        }];
    }];
    
    //    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionRepeat animations:^{
    //        self.stackView.arrangedSubviews.lastObject.transform = CGAffineTransformRotate(self.stackView.arrangedSubviews.lastObject.transform, M_PI);
    //    } completion:^(BOOL finished){
    //        [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionRepeat animations:^{
    //            self.stackView.arrangedSubviews.lastObject.transform = CGAffineTransformRotate(self.stackView.arrangedSubviews.lastObject.transform, -M_PI);} completion: ^(BOOL finished){}];}];
}

-(void)buttonDidTap {
    UITabBarController *tabBarVC = [UITabBarController new];
    UINavigationController *infoVC = [[UINavigationController alloc] initWithRootViewController:[InfoViewController new]];
    UINavigationController *galleryVC = [[UINavigationController alloc] initWithRootViewController:[GalleryViewController new]];
    UINavigationController *homeVC = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    tabBarVC.viewControllers = @[infoVC, galleryVC, homeVC];
    [tabBarVC setSelectedIndex:1];
    [infoVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"info_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:@"info_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [galleryVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"gallery_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:@"gallery_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    [homeVC setTabBarItem:[[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"home_unselected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:@"home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = tabBarVC;
    [appDelegate.window makeKeyAndVisible];
}

@end
