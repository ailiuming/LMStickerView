//
//  LMWidthGestureRecognizer.m
//  LMStickerView
//
//  Created by ming on 2022/8/6.
//

#import "LMWidthGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface LMWidthGestureRecognizer()

@property (nonatomic, strong) UIView * anchorView;

@end

@implementation LMWidthGestureRecognizer


- (instancetype)initWithTarget:(id)target action:(SEL)action anchorView:(UIView *)anchorView
{
    if (self = [super initWithTarget:target action:action]) {
        _anchorView = anchorView;
    }
    return self;
}


#pragma mark GestureHandle
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([[event touchesForGestureRecognizer:self] count] > 1) {
        self.state = UIGestureRecognizerStateFailed;
    }
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.state == UIGestureRecognizerStatePossible) {
        self.state = UIGestureRecognizerStateBegan;
    } else {
        self.state = UIGestureRecognizerStateChanged;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:_anchorView.superview];
    CGPoint previousPoint = [touch previousLocationInView:_anchorView.superview];
    [self setWidth:_anchorView.bounds.size.width + (currentPoint.x - previousPoint.x)];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.state == UIGestureRecognizerStateChanged) {
        self.state = UIGestureRecognizerStateEnded;
    } else {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.state = UIGestureRecognizerStateFailed;
}

- (void)reset
{
    _width = 1;
}


@end
