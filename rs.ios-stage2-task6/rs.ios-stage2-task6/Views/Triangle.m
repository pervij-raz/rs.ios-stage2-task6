//
//  Triangle.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 23.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "Triangle.h"
#import "Color.h"

@implementation Triangle

- (void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:(CGPoint){35, 0}];
    [path addLineToPoint:(CGPoint){70, 70}];
    [path addLineToPoint:(CGPoint){0, 70}];
    [path closePath];
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.bounds;
    mask.path = path.CGPath;
    [mask setFillColor:[[Color green] CGColor]];
    [self.layer addSublayer:mask];
}

@end
