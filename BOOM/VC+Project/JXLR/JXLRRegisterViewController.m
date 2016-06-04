//
//  JXLRRegisterViewController.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/19.
//  Copyright (c) 2016年 sky. All rights reserved.
//  注册

#import "JXLRRegisterViewController.h"
#import "CustomTextField.h"
#import "JXLRRegNextViewController.h"



#define NAME_tag 111
#define PHONE_tag 222

@interface JXLRRegisterViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) CustomTextField *nameWindow;
@property (nonatomic, strong) CustomTextField *phoneWindow;

@end

@implementation JXLRRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    
    [self initData];
    
    [self initView];
}

- (void)initData
{
    
}


- (void)initView
{
    UIControl *viewControl = [[UIControl alloc] initWithFrame:self.view.bounds];
    [viewControl addTarget:self action:@selector(ControlAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewControl];
    
    // 请输入用户名
    _nameWindow = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 64+25, MSWIDTH-10, 60)];
    for (UIView *view in _nameWindow.subviews) {
        [view removeFromSuperview];
    }
    [_nameWindow setLeftImage:@"login_name" rightImage:@"Right_error" placeName:@"请输入用户名"];
    _nameWindow.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameWindow.delegate = self;
    _nameWindow.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _nameWindow.rightBtn.tag = NAME_tag;
    [_nameWindow.rightBtn addTarget:self action:@selector(clearText:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nameWindow];
    
    // 请输入手机号
    _phoneWindow = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 64+25+75, MSWIDTH-10, 60)];
    for (UIView *view in _phoneWindow.subviews) {
        [view removeFromSuperview];
    }
    [_phoneWindow setLeftImage:@"Find_phone" rightImage:@"Right_error" placeName:@"请输入手机号"];
    _phoneWindow.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneWindow.delegate = self;
    _phoneWindow.keyboardType = UIKeyboardTypeNumberPad;
    _phoneWindow.rightBtn.tag = PHONE_tag;
    [_phoneWindow.rightBtn addTarget:self action:@selector(clearText:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_phoneWindow];
    
    UIButton  *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(10, MSHEIGHT-250, MSWIDTH-20, 45);
    nextBtn.backgroundColor = KRedColor;
    nextBtn.layer.cornerRadius = 3.0;
    nextBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(nextBtn.frame), MSWIDTH-40, 40)];
    lbl1.textAlignment = NSTextAlignmentCenter;
    lbl1.textColor = [UIColor grayColor];
    lbl1.font = [UIFont systemFontOfSize:16];
    //    lbl1.backgroundColor = [UIColor brownColor];
    lbl1.numberOfLines = 0;
    lbl1.text = @"客服电话：400 - 915 - 1000";
    [self.view addSubview:lbl1];

    
    
}

#pragma mark - 下一步
- (void)nextBtnClick
{
    if (_nameWindow.text.length == 0 ) {
        //            [SVProgressHUD showErrorWithStatus:@"请输入用户名！"]];
//        return;

    }
    if (_phoneWindow.text.length == 0 ) {
        //            [SVProgressHUD showErrorWithStatus:@"请输入手机号！"]];
//        return;
    }
    
    JXLRRegNextViewController *VC = [[JXLRRegNextViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (void)clearText:(UIButton *)button
{
    if (_nameWindow.text.length != 0 && button.tag == NAME_tag) {
        _nameWindow.text = @"";
    }
    if (_phoneWindow.text.length != 0 && button.tag == PHONE_tag) {
        _phoneWindow.text = @"";
    }
}

#pragma mark - textField
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == _nameWindow) {
        if (textField.text.length<6) {
            //            [SVProgressHUD showErrorWithStatus:@"请设置新登录密码不少于6位"]];
        }
    }
    
    if (textField == _phoneWindow && _phoneWindow.text.length != 0) {
        //判断手机号格式
//        if (![_phoneWindow.text isEqualToString:_pwd2.text]) {
            //            [SVProgressHUD showErrorWithStatus:@"两次输入的密码不一致！"]];
            
//        }
    }
    
}


#pragma mark - 点击空白处收回键盘
- (void)ControlAction
{
    if (_nameWindow.isEditing || _phoneWindow.isEditing) {
        [_nameWindow resignFirstResponder];
        [_phoneWindow resignFirstResponder];
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
