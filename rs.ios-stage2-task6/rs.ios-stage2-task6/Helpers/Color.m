//
//  Color.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 23.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "Color.h"

@implementation Color

+(UIColor*)black {
    return [UIColor colorWithRed: 0.06 green: 0.06 blue: 0.06 alpha: 1.00];
}

+(UIColor*)white {
    return [UIColor colorWithRed: 1.00 green: 1.00 blue: 1.00 alpha: 1.00];
}

+(UIColor*)blue {
    return [UIColor colorWithRed: 0.16 green: 0.76 blue: 0.82 alpha: 1.00];
}

+(UIColor*)gray {
    return [UIColor colorWithRed: 0.44 green: 0.44 blue: 0.44 alpha: 1.00];
}

+(UIColor*)green {
    return [UIColor colorWithRed: 0.20 green: 0.76 blue: 0.63 alpha: 1.00];
}

+(UIColor*)red {
    return [UIColor colorWithRed: 0.93 green: 0.41 blue: 0.42 alpha: 1.00];
}

+(UIColor*)yellow {
    return [UIColor colorWithRed: 0.98 green: 0.80 blue: 0.47 alpha: 1.00];
}

+(UIColor*)yellowHighlighted {
    return [UIColor colorWithRed: 0.99 green: 0.96 blue: 0.89 alpha: 1.00];
}

@end
