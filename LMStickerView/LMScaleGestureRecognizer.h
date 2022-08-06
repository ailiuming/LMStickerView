//
//  LMScaleGestureRecognizer.h
//  LMStickerView
//
//  Created by ming on 2022/8/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMScaleGestureRecognizer : UIGestureRecognizer

/**
  比例
 */
@property (nonatomic, assign) CGFloat scale;



/**
  初始化
  @param target target
  @param action action
  @param anchorView 锚点视图
 */
- (instancetype)initWithTarget:(id)target action:(SEL)action anchorView:(UIView *)anchorView;

/**
  重置
 */
- (void)reset;

@end

NS_ASSUME_NONNULL_END
