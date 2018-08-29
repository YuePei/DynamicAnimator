//
//  GravityVC.m
//  test1
//
//  Created by Peyton on 2018/8/29.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "GravityVC.h"
#import "UIView+CornerRadius.h"


@interface GravityVC ()

@property (nonatomic, strong)UIDynamicAnimator *animator;

@property (nonatomic, strong)UIImageView *jieyiIV;

@end

@implementation GravityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self jieyiIV];
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    UIGravityBehavior *be = [[UIGravityBehavior alloc]initWithItems:@[self.jieyiIV]];
    [self.animator addBehavior:be];
    
}

#pragma mark lazy
- (UIImageView *)jieyiIV {
    if (!_jieyiIV) {
        _jieyiIV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
        _jieyiIV.image = [UIImage imageNamed:@"结义"];
        [self.view addSubview:_jieyiIV];
        [self.jieyiIV setCornerRadius:25];
    }
    return _jieyiIV;
}

@end
