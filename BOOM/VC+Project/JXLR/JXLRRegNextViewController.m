//
//  JXLRRegNextViewController.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/19.
//  Copyright (c) 2016年 sky. All rights reserved.
//  注册-->下一步

#import "JXLRRegNextViewController.h"
#import "CustomTextField.h"
#import "JXLRRegSuccViewController.h"

#define NAME_tag 111
#define PHONE_tag 222

@interface JXLRRegNextViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) CustomTextField *verifyWindow;
@property (nonatomic, strong) CustomTextField *pwd1Window;
@property (nonatomic, strong) CustomTextField *pwd2Window;

@end

@implementation JXLRRegNextViewController
{
    BOOL isAgree;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    
    [self initData];
    
    [self initView];
}

- (void)initData
{
    isAgree = YES;
}


- (void)initView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, MSWIDTH, MSHEIGHT)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(MSWIDTH, MSHEIGHT+10);
    scrollView.backgroundColor = KbackgroundColor;
    [self.view addSubview:scrollView];
    
    UIControl *viewControl = [[UIControl alloc] initWithFrame:self.view.bounds];
    [viewControl addTarget:self action:@selector(ControlAction) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:viewControl];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(5, 25, MSWIDTH-10, 120)];
    bgView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:bgView];
    
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, MSWIDTH-20, 40)];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.text = @"注册验证码已发送到******";
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
    
    // 请设置登录密码不少于6位
    _pwd1Window = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 25+120+15, MSWIDTH-10, 60)];
    for (UIView *view in _pwd1Window.subviews) {
        [view removeFromSuperview];
    }
    [_pwd1Window setLeftImage:@"login_pwd" rightImage:@"" placeName:@"请设置登录密码不少于6位"];
    _pwd1Window.clearButtonMode = UITextFieldViewModeWhileEditing;
    _pwd1Window.delegate = self;
    _pwd1Window.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [scrollView addSubview:_pwd1Window];
    
    // 请再次输入密码
    _pwd2Window = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 25+120+75+15, MSWIDTH-10, 60)];
    for (UIView *view in _pwd2Window.subviews) {
        [view removeFromSuperview];
    }
    [_pwd2Window setLeftImage:@"login_pwd" rightImage:@"" placeName:@"请再次输入密码"];
    _pwd2Window.clearButtonMode = UITextFieldViewModeWhileEditing;
    _pwd2Window.delegate = self;
    [scrollView addSubview:_pwd2Window];
    
    //来融金服用户注册协议
    UIButton *agreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
    agreeBtn.frame =CGRectMake(0, CGRectGetMaxY(_pwd2Window.frame), 120, 30);//button的frame
    agreeBtn.selected = YES;
    [agreeBtn setImage:[UIImage imageNamed:@"uncheck"] forState:UIControlStateNormal];//给button添加image
    [agreeBtn setImage:[UIImage imageNamed:@"check"] forState:UIControlStateSelected];//给button添加image
    agreeBtn.imageEdgeInsets = UIEdgeInsetsMake(22,15,22,40);
    [agreeBtn setTitle:@"我同意" forState:UIControlStateNormal];
    agreeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    agreeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [agreeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    agreeBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -agreeBtn.titleLabel.bounds.size.width, 0, 0);
    [agreeBtn addTarget:self action:@selector(agreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:agreeBtn];
    
    UIButton  *proBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    proBtn.frame = CGRectMake(CGRectGetMaxX(agreeBtn.frame)-40, CGRectGetMaxY(_pwd2Window.frame), 200, 30);
    proBtn.backgroundColor = [UIColor clearColor];
    proBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [proBtn setTitleColor:KBlueColor forState:UIControlStateNormal];
    [proBtn setTitle:@"《来融金服用户注册协议》" forState:UIControlStateNormal];
    [proBtn addTarget:self action:@selector(proBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:proBtn];
    
    UIButton  *regBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    regBtn.frame = CGRectMake(10, CGRectGetMaxY(proBtn.frame)+25, MSWIDTH-20, 45);
    regBtn.backgroundColor = KRedColor;
    regBtn.layer.cornerRadius = 3.0;
    regBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [regBtn setTitle:@"注册" forState:UIControlStateNormal];
    [regBtn addTarget:self action:@selector(regBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:regBtn];
    
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(regBtn.frame), MSWIDTH-40, 40)];
    lbl3.textAlignment = NSTextAlignmentCenter;
    lbl3.textColor = [UIColor grayColor];
    lbl3.font = [UIFont systemFontOfSize:16];
    //    lbl1.backgroundColor = [UIColor brownColor];
    lbl3.numberOfLines = 0;
    lbl3.text = @"客服电话：400 - 915 - 1000";
    [scrollView addSubview:lbl3];
    
    
    
}

#pragma mark - 注册
- (void)regBtnClick
{
    if (_verifyWindow.text.length == 0 ) {
        //            [SVProgressHUD showErrorWithStatus:@"请输入验证码！"]];
        //        return;
        
    }
    if (_pwd1Window.text.length == 0 ) {
        //            [SVProgressHUD showErrorWithStatus:@"请输入密码！"]];
        //        return;
    }
    if (_pwd2Window.text.length == 0 ) {
        //            [SVProgressHUD showErrorWithStatus:@"请输入确认密码！"]];
        //        return;
    }
    if (!isAgree) {
        //            [SVProgressHUD showErrorWithStatus:@"请同意《来融金服用户注册协议》！"]];
        //        return;
    }
    
    JXLRRegSuccViewController *VC = [[JXLRRegSuccViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}

#pragma mark - 同意协议
- (void)agreeBtnClick:(UIButton *)button
{
    if (button.selected == YES) {
        button.selected = NO;
        isAgree = NO;
        
    }else {
        button.selected = YES;
        isAgree = YES;
        
    }
}

#pragma mark - 协议内容
- (void)proBtnClick
{
    
    
    
    
}

#pragma mark - textField
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == _pwd1Window && _pwd1Window.text.length != 0) {
        if (textField.text.length<6) {
            //判断密码长度
            //            [SVProgressHUD showErrorWithStatus:@"请设置新登录密码不少于6位"]];
        }
    }
    
    if (textField == _pwd2Window && _pwd2Window.text.length != 0) {
        
//                if (![_pwd1Window.text isEqualToString:_pwd2Window.text]) {
        //            [SVProgressHUD showErrorWithStatus:@"两次输入的密码不一致！"]];
        
        //        }
    }
    
}


#pragma mark - 点击空白处收回键盘
- (void)ControlAction
{
    if (_verifyWindow.isEditing || _pwd1Window.isEditing || _pwd2Window.isEditing) {
        [_verifyWindow resignFirstResponder];
        [_pwd1Window resignFirstResponder];
        [_pwd2Window resignFirstResponder];

    }
}

#pragma mark - 初始化导航条
- (void)initNavigationBar
{
    self.title = @"注册";
    
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
