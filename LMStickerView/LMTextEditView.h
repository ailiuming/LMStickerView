//
//  LMTextEditView.h
//  LMStickerView
//
//  Created by ming on 2022/8/6.
//

#import "LMEditBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LMTextEditView : LMEditBaseView

/**
  内容文案
 */
@property (nonatomic, strong) NSString * contentText;

/**
  内容字体
 */
@property (nonatomic, strong) UIFont * contentFont;

/**
 字体颜色
 */
@property (nonatomic, strong) UIColor * contentColor;

/**
 文字对齐方式
 */
@property (nonatomic, assign) NSTextAlignment textAlignmet;

@end

NS_ASSUME_NONNULL_END
