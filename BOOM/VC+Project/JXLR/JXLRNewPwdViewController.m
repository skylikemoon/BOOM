//
//  JXLRNewPwdViewController.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/19.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import "JXLRNewPwdViewController.h"
#import "CustomTextField.h"
#import "JXLRPopTipView.h"

@interface JXLRNewPwdViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) CustomTextField *oldWindow;
@property (nonatomic, strong) CustomTextField *pwd2;


@end

@implementation JXLRNewPwdViewController
{
    JXLRPopTipView *tipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigationBar];
    
    [self initData];
    
    [self initView];
}

- (void)initView
{
    UIControl *viewControl = [[UIControl alloc] initWithFrame:self.view.bounds];
    [viewControl addTarget:self action:@selector(ControlAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:viewControl];
    
    
    // 请设置新登录密码不少于6位
    _oldWindow = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 64+25, MSWIDTH-10, 60)];
    for (UIView *view in _oldWindow.subviews) {
        [view removeFromSuperview];
    }
    [_oldWindow setLeftImage:@"login_pwd" rightImage:@"login_pwd_swicthOff" placeName:@"请设置新登录密码不少于6位"];
    _oldWindow.delegate = self;
    _oldWindow.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [_oldWindow.rightBtn addTarget:self action:@selector(swicth:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_oldWindow];
    
    
    // 请再次输入新密码
    _pwd2 = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 64+25+75, MSWIDTH-10, 60)];
    for (UIView *view in _pwd2.subviews) {
        [view removeFromSuperview];
    }
    [_pwd2 setLeftImage:@"login_pwd" rightImage:@"Right_error" placeName:@"请再次输入新密码"];
    _pwd2.clearButtonMode = UITextFieldViewModeWhileEditing;
    _pwd2.delegate = self;
    _pwd2.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [_pwd2.rightBtn addTarget:self action:@selector(clearText) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pwd2];
    
    UIButton  *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(10, MSHEIGHT-250, MSWIDTH-20, 45);
    submitBtn.backgroundColor = KRedColor;
    submitBtn.layer.cornerRadius = 3.0;
    submitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [submitBtn setTitle:@"提 交" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    
    
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(submitBtn.frame), MSWIDTH-40, 40*2)];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.textColor = [UIColor grayColor];
//    lbl1.backgroundColor = [UIColor brownColor];
    lbl1.numberOfLines = 0;
    lbl1.text = @"1、为了您的账户安全，新旧密码必须不同;\n2、密码为6-16位字符（数字、字母、符号）;\n3、不能只使用一个字符，区分大小写。";
    lbl1.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lbl1];
    
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lbl1.frame)-10,CGRectGetMaxY(submitBtn.frame)+20 , 10, 10)];
    lbl2.textAlignment = NSTextAlignmentCenter;
    lbl2.textColor = KRedColor;
    lbl2.text = @"*";
    lbl2.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:lbl2];
    
    
    
    
    
}

- (void)initData
{
    
}

#pragma mark -切换
- (void)swicth:(UIButton *)button
{
    if (button.selected == NO) {
        _oldWindow.secureTextEntry = YES;
        button.selected = YES;
        [_oldWindow setLeftImage:@"login_pwd" rightImage:@"login_pwd_swicthOn" placeName:@"请设置新登录密码不少于6位"];
    }else {
        _oldWindow.secureTextEntry = NO;
        button.selected = NO;
//        [_oldWindow setLeftImage:@"login_pwd" rightImage:@"login_pwd_swicthOff" placeName:@"请设置新登录密码不少于6位"];
    }
}

- (void)clearText
{
    if (_pwd2.text.length != 0) {
        _pwd2.text = @"";
    }
    
}

#pragma mark  提交
- (void)submitBtnClick
{
     //返回成功 === 弹框提示
    tipView  = [[JXLRPopTipView alloc] initWithFrame:CGRectMake(0, 64, MSWIDTH, MSHEIGHT)];
    [tipView.topBtn setImage:[UIImage imageNamed:@"Green_sure"] forState:UIControlStateNormal];
    tipView.topBtn.imageEdgeInsets = UIEdgeInsetsMake(5,15,5,50);
    
    tipView.topBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -tipView.topBtn.titleLabel.bounds.size.width, 0, 0);
    [tipView.topBtn setTitle:@"恭喜您！重置密码成功！" forState:UIControlStateNormal];
    
    tipView.titleLbl1.text = @"登录密码已重置成功，\n请牢记更改后的新密码！";
    
//    [tipView.bottomBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tipView];
    
    if (_oldWindow.text.length == 0 ) {
//            [SVProgressHUD showErrorWithStatus:@"请输入新密码！"]];
        return;
        
    }
    if ( _pwd2.text.length == 0) {
//            [SVProgressHUD showErrorWithStatus:@"请确认新密码！"]];
         return;
    }
    if (_oldWindow.text.length != 0 && _pwd2.text.length != 0) {
        if (![_oldWindow.text isEqualToString:_pwd2.text]) {
            //            [SVProgressHUD showErrorWithStatus:@"两次输入的密码不一致！"]];
            return;

        }
    }
    
    
    
}

#pragma mark - textField
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == _oldWindow) {
        if (textField.text.length<6) {
//            [SVProgressHUD showErrorWithStatus:@"请设置新登录密码不少于6位"]];
        }
    }
    
    if (_oldWindow.text.length != 0 && _pwd2.text.length != 0) {
        if (![_oldWindow.text isEqualToString:_pwd2.text]) {
            //            [SVProgressHUD showErrorWithStatus:@"两次输入的密码不一致！"]];

        }
    }
    
}






#pragma mark - 点击空白处收回键盘
- (void)ControlAction
{
    if (_oldWindow.isEditing || _pwd2.isEditing) {
        [_oldWindow resignFirstResponder];
        [_pwd2 resignFirstResponder];
    }
}

#pragma mark - 初始化导航条
- (void)initNavigationBar
{
    self.title = @"输入新密码";
    
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
