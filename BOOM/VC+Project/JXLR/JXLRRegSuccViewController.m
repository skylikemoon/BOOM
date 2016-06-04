//
//  JXLRRegSuccViewController.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/19.
//  Copyright (c) 2016年 sky. All rights reserved.
//  注册-->下一步-->注册成功

#import "JXLRRegSuccViewController.h"

@interface JXLRRegSuccViewController ()

@end

@implementation JXLRRegSuccViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    
    [self initView];
}

- (void)initView
{
    //绿色图片提示
    UIButton  *greenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    greenBtn.frame = CGRectMake(MSWIDTH/2-20, 64+25, 40, 40);
//    openBtn.backgroundColor = KRedColor;
    [greenBtn setBackgroundImage:[UIImage imageNamed:@"Green_sure"] forState:UIControlStateNormal];
    [self.view addSubview:greenBtn];
    
    UILabel *lbl0 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(greenBtn.frame), MSWIDTH, 40)];
    lbl0.textAlignment = NSTextAlignmentCenter;
    lbl0.font = [UIFont boldSystemFontOfSize:14];
    lbl0.text = @"恭喜您，注册成功！";
    [self.view addSubview:lbl0];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(lbl0.frame)+10, MSWIDTH-10, 180)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 8.0;
    [self.view addSubview:bgView];
    
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, MSWIDTH-20, 40)];
    lbl1.textAlignment = NSTextAlignmentCenter;
    lbl1.text = @"注册信息";
    lbl1.font = [UIFont boldSystemFontOfSize:16];
    [bgView addSubview:lbl1];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(20, 60, MSWIDTH-40, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [bgView addSubview:line];
    
    
    // 用户名
    UILabel *namelbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, MSWIDTH-40, 30)];
    namelbl.textAlignment = NSTextAlignmentLeft;
    namelbl.font = [UIFont systemFontOfSize:15];
    namelbl.text = @"用户名:**";
    [bgView addSubview:namelbl];
    
    // 登录密码
    UILabel *pwdlbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, MSWIDTH-40, 30)];
    pwdlbl.textAlignment = NSTextAlignmentLeft;
    pwdlbl.font = [UIFont systemFontOfSize:15];
    pwdlbl.text = @"登录密码:**";
    [bgView addSubview:pwdlbl];
    
    // 温馨提示：该账户信息是您登录来融金服的凭证，请妥善保管
    UILabel *tiplbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, MSWIDTH-40, 30)];
    tiplbl.textAlignment = NSTextAlignmentLeft;
    tiplbl.textColor = [UIColor redColor];
    tiplbl.font = [UIFont systemFontOfSize:10];
    tiplbl.text = @"温馨提示：该账户信息是您登录来融金服的凭证，请妥善保管";
    [bgView addSubview:tiplbl];

    
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(bgView.frame), MSWIDTH-40, 40*2)];
    lbl3.textAlignment = NSTextAlignmentLeft;
    lbl3.textColor = [UIColor blackColor];
    lbl3.font = [UIFont boldSystemFontOfSize:16];
    lbl1.backgroundColor = [UIColor clearColor];
    lbl3.numberOfLines = 0;
    lbl3.text = @"为了交易流程更加流畅，建议您马上开通资金托管账户！";
    [self.view addSubview:lbl3];
    
    //立即开通资金托管账户
    UIButton  *openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    openBtn.frame = CGRectMake(10, CGRectGetMaxY(lbl3.frame)+10, MSWIDTH-20, 45);
    openBtn.backgroundColor = KRedColor;
    openBtn.layer.cornerRadius = 3.0;
    openBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [openBtn setTitle:@"立即开通资金托管账户" forState:UIControlStateNormal];
    [openBtn addTarget:self action:@selector(openBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openBtn];
    
}

#pragma mark - 立即开通资金托管账户
- (void)openBtnClick
{
    
    JXLRRegSuccViewController *VC = [[JXLRRegSuccViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}



#pragma mark - 初始化导航条
- (void)initNavigationBar
{
    self.title = @"注册成功";
    
    self.view.backgroundColor = KbackgroundColor;
    
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:KBlackColor, NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:18.0], NSFontAttributeName, nil]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    // 导航条返回按钮
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
    backItem.tintColor = KBlackColor;
    [self.navigationItem setLeftBarButtonItem:backItem];
    
    
    
}



#pragma mark - 返回按钮
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - 退出页面，释放网络请求
-(void) viewWillDisappear:(BOOL)animated
{
    //    [super viewWillDisappear:animated];
    //
    //    if (_requestClient != nil) {
    //        [_requestClient cancel];
    //    }
}

@end

