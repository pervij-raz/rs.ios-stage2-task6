//
//  FiguresView.h
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 25.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Triangle.h"

NS_ASSUME_NONNULL_BEGIN

@interface FiguresView : UIStackView
@property (strong, nonatomic) UIView * circle;
@property (strong, nonatomic) UIView * square;
@property (strong, nonatomic) Triangle * triangle;
@end

NS_ASSUME_NONNULL_END
