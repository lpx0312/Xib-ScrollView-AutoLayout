//
//  ViewController.m
//  Xib-Add-ScrollerView
//
//  Created by 李攀祥 on 16/2/18.
//  Copyright © 2016年 李攀祥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *threeViewTop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//更新约束
- (void)updateViewConstraints
{
    [super updateViewConstraints];
    //设置ContentSize为3个屏幕的宽度
    self.ViewHeight.constant= CGRectGetHeight([UIScreen mainScreen].bounds)*3;
    //第二个视图top距离SuperView的距离 也就是第一个视图的高度
    self.secondViewTop.constant=CGRectGetHeight([UIScreen mainScreen].bounds);
    //第三个视图top 距离SuperView的距离 也就是第二个视图的高度
    self.threeViewTop.constant=CGRectGetHeight([UIScreen mainScreen].bounds)*2;
    //第三个视图的高度= ContentSize.height(self.ViewHeight.constant)-(self.threeViewTop.constant)
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
