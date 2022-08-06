//
//  LMScaleGestureRecognizer.m
//  LMStickerView
//
//  Created by ming on 2022/8/6.
//

#import "LMScaleGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface LMScaleGestureRecognizer()

@property (nonatomic, strong) UIView * anchorView;

@end

@implementation LMScaleGestureRecognizer

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
    CGPoint anchorViewCenter = _anchorView.center;
    CGPoint currentPoint = [touch locationInView:_anchorView.superview];
    CGPoint previousPoint = [touch previousLocationInView:_anchorView.superview];
    
    CGFloat currentRadius = [self distanceBetweenFirstPoint:currentPoint secondPoint:anchorViewCenter];
    CGFloat previousRadius = [self distanceBetweenFirstPoint:previousPoint secondPoint:anchorViewCenter];
    CGFloat scale = currentRadius / previousRadius;
    
    [self setScale:scale];
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

- (CGFloat)distanceBetweenFirstPoint:(CGPoint)first
                         secondPoint:(CGPoint)second
{
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return sqrt(deltaX * deltaX + deltaY * deltaY);
}

- (void)reset
{
    _scale = 1;
}


@end
