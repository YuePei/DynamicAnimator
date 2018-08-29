//
//  SnapVC.m
//  test1
//
//  Created by Peyton on 2018/8/29.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "SnapVC.h"
#import "UIView+CornerRadius.h"

@interface SnapVC ()

@property (nonatomic, strong)UIDynamicAnimator *animator;

@property (nonatomic, strong)UIImageView *jieyiIV;

@end

@implementation SnapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self jieyiIV];
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(298, 198, 4, 4)];
    v1.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:self.jieyiIV snapToPoint:CGPointMake(300, 200)];
    snap.damping = 1;
    [self.animator addBehavior:snap];
}

#pragma mark lazy
- (UIImageView *)jieyiIV {
    if (!_jieyiIV) {
        _jieyiIV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 50, 50)];
        _jieyiIV.image = [UIImage imageNamed:@"结义"];
        [self.view addSubview:_jieyiIV];
        [self.jieyiIV setCornerRadius:25];
    }
    return _jieyiIV;
}

@end
