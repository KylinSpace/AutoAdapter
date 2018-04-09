//
//  ViewController.m
//  AutoAdapter
//
//  Created by Kylin on 2018/4/9.
//  Copyright © 2018年 matchman. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "NSNumber+GC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *title = [UILabel new];
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:20];
    title.text = @"未添加前";

    // 以下是两个view 横向 布局时 没有使用分类时
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:blueView];
    [self.view addSubview:redView];
    [self.view addSubview:title];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(5);
        make.width.equalTo(@(180));
        make.height.equalTo(@(90));
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-5);
        make.width.top.height.equalTo(redView);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(redView.mas_top).offset(GCH(-5));
        make.centerX.equalTo(self.view);
    }];
    
    #pragma mark -  使用分类时
    [self setupWithNSNumberGC];
}

- (void)setupWithNSNumberGC{
    
    UILabel *title = [UILabel new];
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:GCW(20)];
    title.text = @"添加自动适配分类后";
    UIView *redView1 = [UIView new];
    redView1.backgroundColor = [UIColor redColor];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:blueView];
    [self.view addSubview:redView1];
    [self.view addSubview:title];
    
    
    [redView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(GCH(300));
        make.left.equalTo(self.view).offset(GCW(5));
        make.width.equalTo(@(GCW(180)));
        make.height.equalTo(@(GCH(90)));
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(GCW(-5));
        make.width.top.height.equalTo(redView1);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(redView1.mas_top).offset(GCH(-5));
        make.centerX.equalTo(self.view);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
