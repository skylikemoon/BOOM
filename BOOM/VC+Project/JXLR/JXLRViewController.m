//
//  JXLRViewController.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/19.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import "JXLRViewController.h"
#import "JXLRLoginViewController.h"
#import "JXLRRegisterViewController.h"
#import "JXLRFindPwdViewController.h"
#import "ImgAndLblButton.h"

@interface JXLRViewController ()

@end

@implementation JXLRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *title = @[@"登录",@"注册"];//push 页面
    for (int i = 0; i<title.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(100+20)*(i%3), 64+(50+10)*(                                                                 i/3), 100, 50);
        [btn setTitle:title[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor brownColor];
        btn.tag = i+10;
        [btn addTarget:self action:@selector(pushClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }

    ImgAndLblButton *btn = [[ImgAndLblButton alloc] initWithFrame:CGRectMake(20, 200, 100, 100)];
    [btn setCenterImgBtn:@"login_lock_selected" CenterTitleLabel:@"中基银河"];
    [btn addTarget:self action:@selector(pushClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 111;
    [self.view addSubview:btn];
    
}

- (void)pushClick:(UIButton *)button
{
    if (button.tag == 10) {
        JXLRLoginViewController *vc = [[JXLRLoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag == 11) {
        JXLRRegisterViewController *vc = [[JXLRRegisterViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        DLOG(@"test");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
