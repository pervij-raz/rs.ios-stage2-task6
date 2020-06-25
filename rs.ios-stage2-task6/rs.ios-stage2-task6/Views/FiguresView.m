//
//  FiguresView.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 25.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "FiguresView.h"
#import "Color.h"

@implementation FiguresView
-init{
    self = [super init];
    if (self) {
        _circle = [UIView new];
        _square = [UIView new];
        _triangle = [Triangle new];
        [self setupImages];
    }
    return self;
}

-(void)setupImages {
    [self setConstraintsToImage:self.circle];
    [self setConstraintsToImage:self.square];
    [self setConstraintsToImage:self.triangle];
    self.circle.layer.cornerRadius = 35;
    self.circle.clipsToBounds = YES;
    [self.circle setBackgroundColor:[Color red]];
    [self.square setBackgroundColor:[Color blue]];
    [self addArrangedSubview:self.circle];
    [self addArrangedSubview:self.square];
    [self addArrangedSubview:self.triangle];
    [self setAxis:UILayoutConstraintAxisHorizontal];
    [self setSpacing:20];
    [self setDistribution:UIStackViewDistributionFillEqually];
    [self setAlignment:UIStackViewAlignmentCenter];
    [self animateViews];
}

-(void)setConstraintsToImage: (UIView*)view{
    [[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:70] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:70] setActive:YES];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
}

-(void)animateViews {
    [self animateCircle];
    [self animateSquare];
    [self animateTriangle];
}

-(void)animateCircle {
    
}

-(void)animateSquare {
    CGPoint initialPoint = CGPointMake(self.square.center.x, self.square.center.y);
    
    [UIView animateWithDuration: 1
                          delay: 0
                        options: UIViewAnimationOptionTransitionNone
                     animations: ^{
        self.square.center = CGPointMake(self.square.center.x, self.square.center.y + self.square.bounds.size.width * 0.1);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
            self.square.center = CGPointMake(self.square.center.x, self.square.center.y - self.square.bounds.size.width * 0.2);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
                self.square.center = initialPoint;
            } completion:^(BOOL finished){
                [self animateSquare];
            }];
        }];
    }];
}

-(void)animateTriangle {
    
}

@end
