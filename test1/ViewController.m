//
//  ViewController.m
//  test1
//
//  Created by Peyton on 2018/8/28.
//  Copyright © 2018年 Peyton. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CornerRadius.h"
#import "UIView+Removable.h"
#import "AttachmentVC.h"
#import "GravityVC.h"
#import "CollisionVC.h"
#import "PushVC.h"
#import "SnapVC.h"
#import "AllVC.h"

#define SWidth [UIScreen mainScreen].bounds.size.width
#define SHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
//tv
@property (nonatomic, strong)UITableView *tableView;
//数组
@property (nonatomic, strong)NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[GravityVC new] animated:YES];
    }else if (indexPath.row == 1) {
        [self.navigationController pushViewController:[AttachmentVC new] animated:YES];
    }else if (indexPath.row == 2) {
        [self.navigationController pushViewController:[CollisionVC new] animated:YES];
    }else if (indexPath.row == 3) {
        [self.navigationController pushViewController:[PushVC new] animated:YES];
    }else if (indexPath.row == 4) {
        [self.navigationController pushViewController:[SnapVC new] animated:YES];
    }else {
        [self.navigationController pushViewController:[AllVC new] animated:YES];
    }
}

#pragma mark lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SWidth, SHeight) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"重力 UIGravityBehavior", @"吸附 UIAttachmentBehavior", @"碰撞 UICollisionBehavior", @"推力 UIPushBehavior", @"甩行为 UISnapBehavior", @"综合案例"];
    }
    return _dataArray;
}
@end
