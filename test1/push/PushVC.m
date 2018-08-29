//
//  PushVC.m
//  test1
//
//  Created by Peyton on 2018/8/29.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "PushVC.h"
#import "UIView+CornerRadius.h"

@interface PushVC ()

@property (nonatomic, strong)UIDynamicAnimator *animator;

@property (nonatomic, strong)UIImageView *jieyiIV;

@end

@implementation PushVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self jieyiIV];
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIPushBehavior *push = [[UIPushBehavior alloc]initWithItems:@[self.jieyiIV] mode:UIPushBehaviorModeInstantaneous];
    push.pushDirection = CGVectorMake(1, 0.5);
    [self.animator addBehavior:push];
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
