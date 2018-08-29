//
//  CollisionVC.m
//  test1
//
//  Created by Peyton on 2018/8/29.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "CollisionVC.h"
#import "UIView+CornerRadius.h"

@interface CollisionVC ()

@property (nonatomic, strong)UIDynamicAnimator *animator;

@property (nonatomic, strong)UIImageView *jieyiIV;

@end

@implementation CollisionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self jieyiIV];
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    UIGravityBehavior *be = [[UIGravityBehavior alloc]initWithItems:@[self.jieyiIV]];
    [self.animator addBehavior:be];
    
    //下面是撞击
    UICollisionBehavior *co = [[UICollisionBehavior alloc]initWithItems:@[self.jieyiIV]];
    //允许撞击边界
    co.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:co];
    
    //给撞击增加弹性
    UIDynamicItemBehavior *it = [[UIDynamicItemBehavior alloc]initWithItems:@[self.jieyiIV]];
    it.elasticity = 0.75;
    [self.animator addBehavior:it];
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
