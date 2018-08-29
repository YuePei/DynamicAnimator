//
//  UIView+CornerRadius.h
//  UIDynamic
//
//  Created by Peyton on 2018/8/27.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerRadius)
/*设置圆角
 @param radius 圆角半径
 */
- (void)setCornerRadius:(float)radius;

/*设置圆角和阴影 但是这里的阴影不能随控件移动, 因为这是给控件设置了一个背景阴影, 而不是随控件生成的阴影
 @param radius          圆角半径
 @param shadowRadius    阴影圆角半径
 @param shadowColor     阴影颜色
 @param shadowOpacity   阴影透明度  注意不能为0
 @param shadowOffset    阴影偏移量
 */
- (void)setCornerRadius:(float)radius andShadowRadius:(float )shadowRadius shadowColor:(UIColor *)shadowColor shadowOpacity:(float)shadowOpacity shadowOffset:(CGSize)shadowOffset;


@end
