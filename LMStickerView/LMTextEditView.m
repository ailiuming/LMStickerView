//
//  LMTextEditView.m
//  LMStickerView
//
//  Created by ming on 2022/8/6.
//

#import "LMTextEditView.h"

@implementation LMTextEditView

- (instancetype)initWithFrame:(CGRect)frame
{
    self.contentView = [[UILabel alloc] init];
    self.contentView.backgroundColor = UIColor.clearColor;
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.numberOfLines = 0;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

#pragma mark - Setter
- (void)setContentText:(NSString *)contentText
{
    _contentText = contentText;
    
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.text = contentText;
}

- (void)setContentFont:(UIFont *)contentFont
{
    _contentFont = contentFont;
    
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.font = contentFont;
}

- (void)setContentColor:(UIColor *)contentColor
{
    _contentColor = contentColor;
    
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.textColor = contentColor;
}

- (void)setTextAlignmet:(NSTextAlignment)textAlignmet {
    _textAlignmet = textAlignmet;
    
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.textAlignment = textAlignmet;
}

@end
