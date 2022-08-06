//
//  LMStickerView.m
//  LMStickerView
//
//  Created by ming on 2022/8/6.
//

#import "LMStickerView.h"

@implementation LMStickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self.contentView = [[UIImageView alloc] init];
    self.contentView.contentMode = UIViewContentModeScaleAspectFit;
    self.contentView.layer.masksToBounds = YES;
    
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

#pragma mark -Setter
- (void)setContentImage:(UIImage *)contentImage
{
    _contentImage = contentImage;
    UIImageView * imageView = (UIImageView *)self.contentView;
    imageView.image = contentImage;
    [self resetFramesWithImage:contentImage];
}

- (void)resetFramesWithImage:(UIImage *)image
{
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    CGPoint center = self.center;
    CGFloat newWidth = self.limitWidth;
    CGFloat newHeight = newWidth * imageHeight / imageWidth;
    self.frame = [self resetFrameWithOrigin:CGRectMake(0, 0, newWidth - self.controlSize.width, newHeight - self.controlSize.height)];
    self.center = center; //保持中心位置不变
    [self setUpSubviewsFrames];
    self.contentFrame = self.frame;
}

@end
