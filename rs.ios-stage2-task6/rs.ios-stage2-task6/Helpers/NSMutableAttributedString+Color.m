//
//  NSMutableAttributedString+Color.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 25.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "NSMutableAttributedString+Color.h"
#import <UIKit/UIKit.h>
#import "Color.h"

@implementation NSMutableAttributedString (Color)
-(void)setColorForText:(NSString*) textToFind withColor:(UIColor*) color
{
    NSRange range = [self.mutableString rangeOfString:textToFind options:NSCaseInsensitiveSearch];

    if (range.location != NSNotFound) {
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}

@end
