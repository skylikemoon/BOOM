//
//  JXLRFindPwdViewController.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/19.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import "JXLRFindPwdViewController.h"
#import "CustomTextField.h"
#import "JXLRNewPwdViewController.h"

@interface JXLRFindPwdViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) CustomTextField *phoneWindow;
@property (nonatomic, strong) CustomTextField *verifyWindow;

@end

@implementation JXLRFindPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavigationBar];
    
    [self initData];

    [self initView];
}

- (void)initView
{
    UIControl *viewControl = [[UIControl alloc] initWithFrame:self.view.bounds];
    [viewControl addTarget:self action:@selector(ControlAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewControl];
    
    
    // 请输入绑定的手机号
    _phoneWindow = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 64+25, MSWIDTH-10, 60)];
    for (UIView *view in _phoneWindow.subviews) {
        [view removeFromSuperview];
    }
    [_phoneWindow setLeftImage:@"Find_phone" rightImage:nil placeName:@"请输入绑定的手机号"];
    _phoneWindow.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneWindow.delegate = self;
    _phoneWindow.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_phoneWindow];
    
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(5, 64+100, MSWIDTH-10, 120)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, MSWIDTH-20, 40)];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.text = @"输入短信中的验证码:";
    lbl1.font = [UIFont systemFontOfSize:17];
    [bgView addSubview:lbl1];
    
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 59, MSWIDTH-10, 2)];
    lbl2.textAlignment = NSTextAlignmentCenter;
    lbl2.textColor = [UIColor grayColor];
    lbl2.text = @"----------------------------------------------------------------------";
    lbl2.font = [UIFont systemFontOfSize:17];
    [bgView addSubview:lbl2];
    
    // 请输入验证码
    _verifyWindow = [[CustomTextField alloc] initWithFrame:CGRectMake(0, 61, MSWIDTH-10, 60)];
    for (UIView *view in _verifyWindow.subviews) {
        [view removeFromSuperview];
    }
    [_verifyWindow setLeftImage:@"Find_code" rightImage:nil placeName:@"请输入验证码"];
    _verifyWindow.delegate = self;
    _verifyWindow.keyboardAppearance = UIKeyboardTypeNumbersAndPunctuation;
    _verifyWindow.returnKeyType = UIReturnKeyNext;
    [bgView addSubview:_verifyWindow];
    
    
    UIButton  *verifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    verifyBtn.frame = CGRectMake(MSWIDTH-105-20, 70, 105, 40);
    verifyBtn.backgroundColor = KRedColor;
    verifyBtn.layer.cornerRadius = 3.0;
    verifyBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [verifyBtn addTarget:self action:@selector(verifyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:verifyBtn];
    
    
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(bgView.frame), MSWIDTH-10, 40)];
    lbl3.textAlignment = NSTextAlignmentCenter;
    lbl3.backgroundColor = [UIColor clearColor];
    lbl3.textColor = [UIColor grayColor];
    lbl3.text = @"点击下一步，验证成功后就可以重置密码!";
    lbl3.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:lbl3];
    
    
    UIButton  *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(10, MSHEIGHT-200, MSWIDTH-20, 45);
    nextBtn.backgroundColor = KRedColor;
    nextBtn.layer.cornerRadius = 3.0;
    nextBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(nextBtn.frame), MSWIDTH-10, 40)];
    lbl4.textAlignment = NSTextAlignmentCenter;
    lbl4.backgroundColor = [UIColor clearColor];
    lbl4.textColor = [UIColor grayColor];
    lbl4.text = @"客服电话：400 - 915 - 1000";
    lbl4.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:lbl4];

}

- (void)initData
{
    
}

#pragma mark - 获取验证码
- (void)verifyBtnClick
{
    //验证码接口
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"4" forKey:@"OPT"];
    [parameters setObject:@"" forKey:@"body"];
    //    [parameters setObject:_phoneWindow.text forKey:@"cellPhone"];
    
    //    if (_requestClient == nil) {
    //        _requestClient = [[NetWorkClient alloc] init];
    //        _requestClient.delegate = self;
    //
    //    }
    //    [_requestClient requestGet:@"app/services" withParameters:parameters];
    
}

#pragma mark 下一步
- (void)nextBtnClick
{
    JXLRNewPwdViewController *VC = [[JXLRNewPwdViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}


#pragma mark - textField
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

#pragma mark - 点击空白处收回键盘
- (void)ControlAction
{
    if (_phoneWindow.isEditing || _verifyWindow.isEditing) {
        [_phoneWindow resignFirstResponder];
        [_verifyWindow resignFirstResponder];
    }
}

#pragma mark - 初始化导航条
- (void)initNavigationBar
{
    self.title = @"找回密码";
    
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
