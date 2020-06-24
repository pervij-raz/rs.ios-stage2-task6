//
//  InfoTableViewCell.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 24.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "InfoTableViewCell.h"

@interface InfoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *fileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fileTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;


@end

@implementation InfoTableViewCell

-(void)setupWith:(PHAsset *)asset {
//    PHImageManager *manager = [PHImageManager defaultManager];
//    [manager requestImageForAsset:asset
//                           targetSize:PHImageManagerMaximumSize
//                          contentMode:PHImageContentModeDefault
//                              options:@[PHImageRequestOptions]
//                        resultHandler:^void(UIImage *image, NSDictionary *info) {
//                            ima = image;
//
//                            [images addObject:ima];
//                        }];
//
//
//    [self.fileImageView setImage:[UIImage im]
}

@end
