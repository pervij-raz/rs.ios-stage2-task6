//
//  HomeViewController.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 25.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "HomeViewController.h"
#import "Color.h"
#import "IphoneView.h"
#import "ButtonsView.h"
#import "FiguresView.h"
#import "StartViewController.h"
#import "AppDelegate.h"

@interface HomeViewController ()
@property (strong, nonatomic) UIStackView *stackView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[Color white]];
    [self.navigationItem setTitle:@"RSSchool Task 6"];
    [self.navigationController.navigationBar setBarTintColor:[Color yellow]];
    [self setupSubviews];
}

-(void)setupSubviews {
    self.stackView = [UIStackView new];
    [self setupPhone];
    [self setupImages];
    [self setupButtons];
    [self setupStack];
}

-(void)createSeparatorFor:(UIView*)view{
    UIView *separator = [UIView new];
    [view addSubview:separator];
    [separator setBackgroundColor:[Color gray]];
    separator.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:separator attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:1] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:separator attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:separator attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1 constant:20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:separator attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1 constant:0] setActive:YES];
}

-(void)setupPhone{
    UIView *view = [UIView new];
    IphoneView *iphoneView = [IphoneView new];
    [view addSubview:iphoneView];
    [self.stackView addArrangedSubview:view];
    iphoneView.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:iphoneView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:iphoneView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:iphoneView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0] setActive:YES];
    [self createSeparatorFor:view];
}

-(void)setupImages{
    UIView *view = [UIView new];
    FiguresView *figuresView = [FiguresView new];
    [view addSubview:figuresView];
    [self.stackView addArrangedSubview:view];
    figuresView.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:figuresView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:figuresView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0] setActive:YES];
    [self createSeparatorFor:view];
}

-(void)setupButtons{
    UIView *view = [UIView new];
    ButtonsView *buttonsView = [ButtonsView new];
    [view addSubview:buttonsView];
    [self.stackView addArrangedSubview:view];
    buttonsView.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:buttonsView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:buttonsView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:buttonsView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1 constant:20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:buttonsView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20] setActive:YES];
    [buttonsView.openCVButton addTarget:self action:@selector(openCV) forControlEvents:UIControlEventTouchUpInside];
    [buttonsView.exitButton addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setupStack{
    [self.stackView setAxis:UILayoutConstraintAxisVertical];
    [self.stackView setSpacing:0];
    [self.stackView setDistribution:UIStackViewDistributionFillEqually];
    [self.stackView setAlignment:UIStackViewAlignmentFill];
    [self.view addSubview:self.stackView];
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeadingMargin multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailingMargin multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:0] setActive:YES];
}

-(void)openCV{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://pervij-raz.github.io/rsschool-cv/cv"] options:@{} completionHandler:nil];
}

-(void)exit{
    StartViewController *vc = [StartViewController new];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = vc;
    [appDelegate.window makeKeyAndVisible];
}


@end
