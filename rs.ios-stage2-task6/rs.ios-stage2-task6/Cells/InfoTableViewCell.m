//
//  InfoTableViewCell.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 24.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "InfoTableViewCell.h"
#import "Color.h"

@interface InfoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *fileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fileTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;


@end

@implementation InfoTableViewCell

-(void)setupWith:(PHAsset *)asset {
    switch (asset.mediaType) {
        case PHAssetMediaTypeAudio:
            [self.fileTypeImageView setImage:[UIImage imageNamed:@"audio"]];
            [self.fileImageView setImage:[UIImage imageNamed:@"music"]];
            [self.sizeLabel setText: [NSString stringWithFormat:@"%f", asset.duration]];
            break;
            
        case PHAssetMediaTypeVideo:
            [self.fileTypeImageView setImage:[UIImage imageNamed:@"video"]];
            [self setImageFor:asset];
            [self.sizeLabel setText: [NSString stringWithFormat:@"%f, %lu x %lu", asset.duration, (unsigned long)asset.pixelHeight, (unsigned long)asset.pixelWidth]];
            break;
            
        case PHAssetMediaTypeImage:
            [self.fileTypeImageView setImage:[UIImage imageNamed:@"image"]];
            [self setImageFor:asset];
            [self.sizeLabel setText: [NSString stringWithFormat:@"%lu x %lu", (unsigned long)asset.pixelHeight, (unsigned long)asset.pixelWidth]];
            break;
            
        default:
            [self.fileTypeImageView setImage:[UIImage imageNamed:@"other"]];
            [self.fileImageView setImage:[UIImage imageNamed:@"forbidden"]];
            break;
    }
    NSArray<PHAssetResource *> *resources = [PHAssetResource assetResourcesForAsset:asset];
    NSString *fileName = [resources.firstObject originalFilename];
    [self.nameLabel setText:fileName];
}

-(void)setImageFor:(PHAsset *)asset {
    PHImageManager *manager = [PHImageManager defaultManager];
    [manager requestImageForAsset:asset
                       targetSize:PHImageManagerMaximumSize
                      contentMode:PHImageContentModeDefault
                          options:nil
                    resultHandler:^void(UIImage *image, NSDictionary *info) {
        [self.fileImageView setImage:image];
    }];
}

-(void)awakeFromNib {
    [super awakeFromNib];
    UIView *background = [UIView new];
    [background setBackgroundColor:[Color yellowHighlighted]];
    [self setSelectedBackgroundView:background];
}

@end
