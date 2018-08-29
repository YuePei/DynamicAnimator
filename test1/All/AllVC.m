
//
//  AllVC.m
//  test1
//
//  Created by Peyton on 2018/8/29.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "AllVC.h"
#import "UIView+CornerRadius.h"

#define SWidth [UIScreen mainScreen].bounds.size.width
#define SHeight [UIScreen mainScreen].bounds.size.height

@interface AllVC ()<UICollisionBehaviorDelegate>
//dynamicView
@property (nonatomic, strong)UIView *dynamicView;
//animator
@property (nonatomic, strong)UIDynamicAnimator *animator;
//v1
@property (nonatomic, strong)UIView *v1;
//v2
@property (nonatomic, strong)UIView *v2;
//v3
@property (nonatomic, strong)UIView *v3;
//v4
@property (nonatomic, strong)UIView *v4;
//v4Center
@property (nonatomic, assign)CGPoint v4Center;
//发球
@property (nonatomic, strong)UIButton *serveBall;
//score
@property (nonatomic, assign)NSInteger score;
//scoreLbale
@property (nonatomic, strong)UILabel *scoreLabel;

@end

@implementation AllVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dynamicView];
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    [self v1];
    [self v2];
    [self v3];
    [self v4];
    [self serveBall];
    [self scoreLabel];
    self.score = 0;
    self.v4Center = self.v4.center;
    [self animatorReady];
    
}

- (void)serveTheBall {
    int o = arc4random() % 314;
    float angle = o / 100.0;
    NSLog(@"%f",angle);
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc]initWithItems:@[self.dynamicView] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.angle = angle;
    pushBehavior.magnitude = 9;
    [self.animator addBehavior:pushBehavior];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint p = [[touches anyObject] locationInView:self.view];
    float y = self.v4Center.y;
    CGPoint v4Center = CGPointMake(p.x, y);
    self.v4.center = v4Center;
    [self.animator updateItemUsingCurrentState:self.v4];
}
- (void)animatorReady {
    //重力
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc]initWithItems:@[self.dynamicView]];
    gravityBehavior.magnitude = 1;
    [self.animator addBehavior:gravityBehavior];
    //碰撞
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc]initWithItems:@[self.dynamicView, self.v1, self.v2, self.v3, self.v4]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    [collisionBehavior addBoundaryWithIdentifier:@"collision1" fromPoint:CGPointMake(0, SHeight) toPoint:CGPointMake(SWidth, SHeight)];
    [self.animator addBehavior:collisionBehavior];
    collisionBehavior.collisionDelegate = self;
    //弹性
    UIDynamicItemBehavior *behavior = [[UIDynamicItemBehavior alloc]initWithItems:@[self.dynamicView]];
    behavior.elasticity = 0.75;
    [self.animator addBehavior:behavior];
    
    //v1和v2不允许移动
    UIDynamicItemBehavior *behavior2 = [[UIDynamicItemBehavior alloc]initWithItems:@[self.v1, self.v2, self.v4]];
    behavior2.density = 10000000000;
    behavior2.allowsRotation = NO;
    [self.animator addBehavior:behavior2];
    //v3可以移动
    UIDynamicItemBehavior *behavior3 = [[UIDynamicItemBehavior alloc]initWithItems:@[self.v3]];
    behavior3.allowsRotation = YES;
    [self.animator addBehavior:behavior3];
    
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier atPoint:(CGPoint)p {
    NSLog(@"碰撞开始");
    
    self.dynamicView.backgroundColor = [self randomColor];
}
- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier {
    NSLog(@"碰撞结束");
}
//两个物体相撞
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p {
    if (item1 == self.dynamicView && item2 == self.v4) {
        UIPushBehavior *push = [[UIPushBehavior alloc]initWithItems:@[self.dynamicView] mode:UIPushBehaviorModeInstantaneous];
        push.angle = 0;
        push.magnitude = 0.2;
        [self.animator addBehavior:push];
        self.score += 5;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld",self.score];
    }
}

- (UIColor *)randomColor {
    CGFloat r = arc4random() % 255;
    CGFloat g = arc4random() % 255;
    CGFloat b = arc4random() % 255;
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1];
}

#pragma mark lazy
- (UIView *)dynamicView {
    if (!_dynamicView) {
        _dynamicView = [[UIView alloc]initWithFrame:CGRectMake(50, 75, 50, 50)];
        [self.view addSubview:_dynamicView];
        _dynamicView.backgroundColor = [UIColor brownColor];
        //设置圆角
        [_dynamicView setCornerRadius:CGRectGetWidth(_dynamicView.bounds) / 2.0];
    }
    return _dynamicView;
}

- (UIView *)v1 {
    if (!_v1) {
        _v1 = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 140, 15)];
        [self.view addSubview:_v1];
        _v1.backgroundColor = [self randomColor];
        [_v1 setCornerRadius:8];
    }
    return _v1;
}

- (UIView *)v2 {
    if (!_v2) {
        _v2 = [[UIView alloc]initWithFrame:CGRectMake(150, 250, 140, 15)];
        [self.view addSubview:_v2];
        _v2.backgroundColor = [self randomColor];
        [_v2 setCornerRadius:8];
    }
    return _v2;
}

- (UIView *)v3 {
    if (!_v3) {
        _v3 = [[UIView alloc]initWithFrame:CGRectMake(80, 400, 140, 15)];
        [self.view addSubview:_v3];
        _v3.backgroundColor = [self randomColor];
        [_v3 setCornerRadius:8];
    }
    return _v3;
}

- (UIView *)v4 {
    if (!_v4) {
        _v4 = [[UIView alloc]initWithFrame:CGRectMake(80, SHeight - 51, 140, 50)];
        [self.view addSubview:_v4];
        _v4.backgroundColor = [self randomColor];
        [_v4 setCornerRadius:20];
    }
    return _v4;
}

- (UIButton *)serveBall {
    if (!_serveBall) {
        _serveBall = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:_serveBall];
        [_serveBall setFrame:CGRectMake(SWidth - 90, 500, 80, 30)];
        [_serveBall setTitle:@"发球" forState:UIControlStateNormal];
        [_serveBall setCornerRadius:10];
        [_serveBall setBackgroundColor:[self randomColor]];
        [_serveBall addTarget:self action:@selector(serveTheBall) forControlEvents:UIControlEventTouchUpInside];
    }
    return _serveBall;
}

- (UILabel *)scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(SWidth - 200, 20, 180, 40)];
        [self.view addSubview:_scoreLabel];
        _scoreLabel.text = [NSString stringWithFormat:@"Score:%ld",self.score];
        _scoreLabel.textAlignment = NSTextAlignmentRight;
    }
    return _scoreLabel;
}

@end
