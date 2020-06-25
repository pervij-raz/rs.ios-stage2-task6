//
//  IphoneView.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 25.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "IphoneView.h"

@implementation IphoneView

-init{
    self = [super init];
    if (self) {
        [self setupContent];
    }
    return self;
}

-(void)setupContent{
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    UILabel *nameLabel = [UILabel new];
    [nameLabel setText:UIDevice.currentDevice.name];
    UILabel *deviceLabel = [UILabel new];
    [deviceLabel setText:UIDevice.currentDevice.systemName];
    UILabel *iosLabel = [UILabel new];
    [iosLabel setText:UIDevice.currentDevice.systemVersion];
    [self addSubview:image];
    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[nameLabel, deviceLabel, iosLabel]];
    [stack setAxis:UILayoutConstraintAxisVertical];
    [stack setSpacing:10];
    [stack setDistribution:UIStackViewDistributionFillEqually];
    [stack setAlignment:UIStackViewAlignmentLeading];
    [self addSubview:stack];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:image attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:image attribute:NSLayoutAttributeHeight multiplier:1 constant:0] setActive:YES];
    
    [stack setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:image attribute:NSLayoutAttributeTrailing multiplier:1 constant:20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20] setActive:YES];
}

@end
