//
//  AttachmentVC.m
//  test1
//
//  Created by Peyton on 2018/8/29.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "AttachmentVC.h"
#import "UIView+CornerRadius.h"
#import "UIView+Removable.h"

@interface AttachmentVC ()
//结衣
@property (nonatomic, strong)UIImageView *jieyiIV;
//dynamicAnimator
@property (nonatomic, strong)UIDynamicAnimator *dynamicAnimator;
@end

@implementation AttachmentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self jieyiIV];
    [self.jieyiIV setCornerRadius:25];
    UIView *v1 =  [[UIView alloc]initWithFrame:CGRectMake(197, 197, 6, 6)];
    v1.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
    
    self.dynamicAnimator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc]initWithItem:self.jieyiIV attachedToAnchor:CGPointMake(200, 200)];
    attachmentBehavior.length = 20;
    attachmentBehavior.damping = 0.1;
    attachmentBehavior.frequency = 2.3;
    [self.dynamicAnimator addBehavior:attachmentBehavior];
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc]initWithItems:@[self.jieyiIV] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.active = YES;
    pushBehavior.pushDirection = CGVectorMake(1, 0);
    pushBehavior.magnitude = 2;
    [self.dynamicAnimator addBehavior:pushBehavior];
    [self.jieyiIV makeRemovable];
}

//@property (nonatomic, strong)UIImageView *jieyiIV;
#pragma mark lazy
- (UIImageView *)jieyiIV {
    if (!_jieyiIV) {
        _jieyiIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        _jieyiIV.image = [UIImage imageNamed:@"结义"];
        [self.view addSubview:_jieyiIV];
    }
    return _jieyiIV;
}

@end
