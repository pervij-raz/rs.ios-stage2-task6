//
//  NSMutableAttributedString+Color.h
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 25.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Color.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Color)
-(void)setColorForText:(NSString*) textToFind withColor:(UIColor*) color;
@end

NS_ASSUME_NONNULL_END
