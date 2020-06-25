//
//  ButtonsView.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 25.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "ButtonsView.h"
#import "Color.h"

@implementation ButtonsView

-init{
    self = [super init];
    if (self) {
        [self setup];
        _openCVButton = [UIButton new];
        _exitButton = [UIButton new];
        [self arrangeSubviews];
    }
    return self;
}

-(void)setup{
    [self setAxis:UILayoutConstraintAxisVertical];
    [self setSpacing:20];
    [self setDistribution:UIStackViewDistributionFillEqually];
    [self setAlignment:UIStackViewAlignmentFill];
}

-(void)arrangeSubviews{
    NSArray *buttons = @[self.openCVButton, self.exitButton];
    for (int i=0; i<buttons.count; i++) {
        UIButton *button = buttons[i];
        [button.titleLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
        [self addArrangedSubview:button];
        button.layer.cornerRadius = 30;
        button.clipsToBounds = YES;
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:55] setActive:YES];
    }
    [self.openCVButton setBackgroundColor:[Color yellow]];
    [self.openCVButton setTitle:@"Open Git CV" forState:UIControlStateNormal];
    [self.openCVButton setTitleColor:[Color black] forState:UIControlStateNormal];
    
    [self.exitButton setBackgroundColor:[Color red]];
    [self.exitButton setTitle:@"Go to start!" forState:UIControlStateNormal];
    [self.exitButton setTitleColor:[Color white] forState:UIControlStateNormal];
}

@end
