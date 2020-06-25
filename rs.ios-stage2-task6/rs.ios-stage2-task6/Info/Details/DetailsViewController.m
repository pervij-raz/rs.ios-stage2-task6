//
//  DetailsViewController.m
//  rs.ios-stage2-task6
//
//  Created by Volha Bychok on 25.06.2020.
//  Copyright © 2020 Ольга Бычок. All rights reserved.
//

#import "DetailsViewController.h"
#import "Color.h"
#import "NSMutableAttributedString+Color.h"

@interface DetailsViewController ()
@property (strong, nonatomic) UIImageView *fileImageView;
@property (strong, nonatomic) UILabel *creationLabel;
@property (strong, nonatomic) UILabel *modificationLabel;
@property (strong, nonatomic) UILabel *typeLabel;
@property (strong, nonatomic) UIButton *shareButton;

@end

@implementation DetailsViewController

-(id)initWithAsset:(PHAsset *)asset {
    self = [super init];
    if (self) {
        _asset = asset;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tabBarController.tabBar setHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.tabBarController.tabBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
    [self.view setBackgroundColor:[Color white]];
    [self.creationLabel setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    [self.modificationLabel setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    [self.typeLabel setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]];
    NSArray<PHAssetResource *> *resources = [PHAssetResource assetResourcesForAsset:self.asset];
    NSString *fileName = [resources.firstObject originalFilename];
    [self setTitle:fileName];
    [self setup];
}

-(void)layout {
    self.fileImageView = [UIImageView new];
    self.creationLabel = [UILabel new];
    self.modificationLabel = [UILabel new];
    self.typeLabel = [UILabel new];
    self.shareButton = [UIButton new];
    NSArray *uiComponents = [[NSArray alloc] initWithObjects:self.fileImageView, self.shareButton, nil];
    for (int i=0; i<uiComponents.count; i++) {
        [self.view addSubview:uiComponents[i]];
    }
    
    [self.shareButton setBackgroundColor:[Color yellow]];
    [self.shareButton setTitleColor:[Color black] forState:UIControlStateNormal];
    [self.shareButton.titleLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    [self.shareButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[NSLayoutConstraint constraintWithItem:self.shareButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:55] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.shareButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:-30] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.shareButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.66 constant:0] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.shareButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
    self.shareButton.layer.cornerRadius = 30;
    self.shareButton.clipsToBounds = YES;
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.creationLabel, self.modificationLabel, self.typeLabel]];
    [stackView setAlignment:UIStackViewAlignmentLeading];
    [stackView setAxis:UILayoutConstraintAxisVertical];
    [stackView setSpacing:20];
    [stackView setDistribution:UIStackViewDistributionFillEqually];
    [self.view addSubview:stackView];
    [stackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.fileImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[NSLayoutConstraint constraintWithItem:self.fileImageView attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTopMargin multiplier:1 constant:20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.fileImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:10] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.fileImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-10] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.fileImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0] setActive:YES];
    
    [[NSLayoutConstraint constraintWithItem:stackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.fileImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:20] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:stackView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:10] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:stackView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-10] setActive:YES];
}

-(void)setup{
    switch (self.asset.mediaType) {
        case PHAssetMediaTypeAudio:
            [self.fileImageView setImage:[UIImage imageNamed:@"music"]];
            [self setTextToTypeLabel: @"Audio"];
            break;
            
        case PHAssetMediaTypeVideo:
            [self setImage];
            [self setTextToTypeLabel: @"Video"];
            break;
            
        case PHAssetMediaTypeImage:
            [self setImage];
            [self setTextToTypeLabel: @"Image"];
            break;
            
        default:
            [self.fileImageView setImage:[UIImage imageNamed:@"forbidden"]];
            break;
    }
    NSMutableAttributedString *creationText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Creation date: %@", self.asset.creationDate]];
    [creationText setColorForText:@"Creation date:" withColor:[Color gray]];
    [creationText setColorForText:[NSString stringWithFormat:@"%@", self.asset.creationDate] withColor:[Color black]];
    [self.creationLabel setAttributedText:creationText];
    NSMutableAttributedString *modificationText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Modification date: %@", self.asset.modificationDate]];
    [modificationText setColorForText:@"Modification date:" withColor:[Color gray]];
    [modificationText setColorForText:[NSString stringWithFormat:@"%@", self.asset.creationDate] withColor:[Color black]];
    [self.modificationLabel setAttributedText:modificationText];
}

-(void)setImage {
    PHImageManager *manager = [PHImageManager defaultManager];
    [manager requestImageForAsset:self.asset
                       targetSize:PHImageManagerMaximumSize
                      contentMode:PHImageContentModeDefault
                          options:nil
                    resultHandler:^void(UIImage *image, NSDictionary *info) {
        [self.fileImageView setImage:image];
    }];
}

-(void)setTextToTypeLabel:(NSString*)type {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Type: %@", type]];
    [text setColorForText:@"Type:" withColor:[Color gray]];
    [text setColorForText:[NSString stringWithFormat:@"%@", type] withColor:[Color black]];
    [self.typeLabel setAttributedText:text];
}



@end
