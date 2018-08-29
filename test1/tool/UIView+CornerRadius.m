//
//  UIView+CornerRadius.m
//  UIDynamic
//
//  Created by Peyton on 2018/8/27.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

- (void)setCornerRadius:(float)radius {
    CAShapeLayer *layer = [CAShapeLayer layer];
    [layer setFrame:self.bounds];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:radius];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

- (void)setCornerRadius:(float)radius andShadowRadius:(float )shadowRadius shadowColor:(UIColor *)shadowColor shadowOpacity:(float)shadowOpacity shadowOffset:(CGSize)shadowOffset{
    //设置阴影
    CAShapeLayer *bottomLayer = [CAShapeLayer layer];
    [bottomLayer setFrame:self.frame];
    bottomLayer.shadowRadius = shadowRadius;
    bottomLayer.shadowColor = shadowColor.CGColor;
    bottomLayer.shadowOpacity = shadowOpacity;
    bottomLayer.shadowOffset = shadowOffset;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10];
    bottomLayer.shadowPath = bezierPath.CGPath;
    [self.superview.layer insertSublayer:bottomLayer below:self.layer];
    //设置圆角
    CAShapeLayer *layer = [CAShapeLayer layer];
    [layer setFrame:self.bounds];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:radius];
    layer.path = path.CGPath;
    self.layer.mask = layer;
}


@end
