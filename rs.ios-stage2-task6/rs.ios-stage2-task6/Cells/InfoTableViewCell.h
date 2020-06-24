//
//  InfoTableViewCell.h
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 24.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoTableViewCell : UITableViewCell
-(void)setupWith:(PHAsset*)asset;
@end

NS_ASSUME_NONNULL_END
