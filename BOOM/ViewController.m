//
//  ViewController.m
//  BOOM
//
//  Created by eims1 on 16/4/29.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import "ViewController.h"
#import "OneXIbViewController.h"
#import "JXLRViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    NSArray *title = @[@"Xib",@"江西来融",@"公用类集合测试"];//push 页面
    for (int i = 0; i<title.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(100+20)*(i%3), 64+(50+10)*(                                                                 i/3), 100, 50);
        [btn setTitle:title[i] forState:UIControlStateNormal];
        btn.backgroundColor = OrangeColor;
        btn.tag = i+10;
        btn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [btn addTarget:self action:@selector(pushClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
}

- (void)pushClick:(UIButton *)button
{
    
    
    if (button.tag == 10) {
        //        OneXIbViewController *vc = [[OneXIbViewController alloc] initWithNibName:@"OneXIbViewController" bundle:nil];
        OneXIbViewController *vc = [[OneXIbViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag == 11) {
        JXLRViewController *vc = [[JXLRViewController alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag == 12) {
        TestViewController *vc = [[TestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag == 13) {
//        SKYtwoTableViewController *vc = [[SKYtwoTableViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag == 14) {
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
