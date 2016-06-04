//
//  JXLRLoginViewController.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/19.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import "JXLRLoginViewController.h"
#import "JXLRRegisterViewController.h"
#import "JXLRFindPwdViewController.h"

#import "CustomTextField.h"
#import "ClickButton.h"

#define NAME_tag 111
#define PWD_tag 222

@interface JXLRLoginViewController ()< UITextFieldDelegate>
{
    BOOL _isLoading;
    
}
//@property (nonatomic, strong) NetWorkClient *requestClient;

@property (nonatomic, strong) CustomTextField *nameWindow;
@property (nonatomic, strong) CustomTextField *passWindow;

@property (nonatomic, strong) ClickButton *signBtn;

@property (nonatomic, strong) UIView *reminderView;

@property (nonatomic, strong) UIButton *phoneView;
@property (nonatomic, assign) BOOL isLook;
@property(nonatomic,strong) NSArray *NameListArr;


@end

@implementation JXLRLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavigationBar];
    
    [self initContentView];
}


#pragma mark - 初始化视图
- (void)initContentView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, MSWIDTH, MSHEIGHT)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(MSWIDTH, MSHEIGHT+10);
    scrollView.backgroundColor = KbackgroundColor;
    [self.view addSubview:scrollView];
    
    
    // 用户名 输入框
    _nameWindow = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 25, MSWIDTH-10, 60)];
    for (UIView *view in _nameWindow.subviews) {
        [view removeFromSuperview];
    }
    [_nameWindow setLeftImage:@"login_name" rightImage:@"row_down" placeName:@"请输入用户名/手机号"];
    _nameWindow.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameWindow.delegate = self;
    _nameWindow.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    //_nameWindow.keyboardType = UIKeyboardTypeNumberPad;
    [_nameWindow addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventEditingChanged];
//    _NameListArr = [[AppDefaultUtil sharedInstance] getDefaultNameList];//待改
//    _nameWindow.userLists= _NameListArr;
    [scrollView addSubview:_nameWindow];
    
    
    //放大提示
    _reminderView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_nameWindow.frame), MSWIDTH, 0)];
    
    _phoneView = [UIButton buttonWithType:UIButtonTypeCustom];
    _phoneView.frame = CGRectMake(40, 10, MSWIDTH-80, 0);
    _phoneView.titleLabel.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:18.0];
    [_phoneView setTitleColor:KBlackColor forState:UIControlStateNormal];
    [_phoneView setBackgroundImage:[UIImage imageNamed:@"phone_bg"] forState:UIControlStateNormal];
    [_phoneView setTitleEdgeInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
    [_reminderView addSubview:_phoneView];
    
    [scrollView addSubview:_reminderView];
    
    
    // 密码 输入框
    _passWindow = [[CustomTextField alloc] initWithFrame:CGRectMake(5, 100, MSWIDTH-10, 60)];
    for (UIView *view in _passWindow.subviews) {
        [view removeFromSuperview];
    }
    [_passWindow setLeftImage:@"login_pwd" rightImage:@"login_pwd_swicthOff" placeName:@"请输入密码"];
    _passWindow.tag = PWD_tag;//1002
    _passWindow.delegate = self;
    _passWindow.secureTextEntry = YES;
    _passWindow.returnKeyType = UIReturnKeyNext;
    [_passWindow addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventEditingChanged];
    __weak CustomTextField *weakPassField = _passWindow;
    [_passWindow setTapActionBlock:^{
        
        if (_isLook) {
            [weakPassField.rightBtn setImage:[UIImage imageNamed:@"btn_unlook"]forState:UIControlStateNormal];
            weakPassField.secureTextEntry = YES;
        }else{
            
            [weakPassField.rightBtn setImage:[UIImage imageNamed:@"btn_look"]forState:UIControlStateNormal];
            weakPassField.secureTextEntry = NO;
        }
        _isLook = !_isLook;
    }];
    [scrollView addSubview:_passWindow];
    
    //记住密码
    UIButton *rememberPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];//button的类型
    rememberPwdBtn.frame =CGRectMake(0, 175, 120, 30);//button的frame
    rememberPwdBtn.selected = YES;
    [rememberPwdBtn setImage:[UIImage imageNamed:@"check"] forState:UIControlStateSelected];//给button添加image
    rememberPwdBtn.imageEdgeInsets = UIEdgeInsetsMake(22,15,22,40);
    [rememberPwdBtn setTitle:@"记住密码" forState:UIControlStateNormal];
    rememberPwdBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    rememberPwdBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [rememberPwdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    rememberPwdBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -rememberPwdBtn.titleLabel.bounds.size.width, 0, 0);
    [rememberPwdBtn addTarget:self action:@selector(rememberPwdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:rememberPwdBtn];
    
    
    //找回密码
    UIButton  *findPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    findPwdBtn.frame = CGRectMake(MSWIDTH-80-20, 175, 90, 30);
    [findPwdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal]; 
    [findPwdBtn setTitle:@"找回密码?" forState:UIControlStateNormal];
    findPwdBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [findPwdBtn addTarget:self action:@selector(findPwdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:findPwdBtn];
    
    
    UIButton  *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    signBtn.frame = CGRectMake(20, MSHEIGHT-200, MSWIDTH-40, 45);
    signBtn.backgroundColor = KRedColor;
    signBtn.layer.cornerRadius = 3.0;
    [signBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [signBtn addTarget:self action:@selector(signBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:signBtn];
    
}

#pragma mark - 记住密码
- (void)rememberPwdBtnClick
{
    
}

#pragma mark  找回密码?
- (void)findPwdBtnClick
{
    JXLRFindPwdViewController *VC = [[JXLRFindPwdViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];

    
}

#pragma mark  注册
- (void)regItemClick
{
    JXLRRegisterViewController *VC = [[JXLRRegisterViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - 点击登录
- (void)signBtnClick
{
//    if (_nameWindow.text.length == 0) {
//        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
//        return;
//    }else if (_passWindow.text.length == 0) {
//        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
//        return;
//    }
//
//    [self ControlAction];// 关闭键盘
//    
//    if (self.type == ResetPassword) {  //忘记密码
//        
//        RegistrationViewController *reset = [[RegistrationViewController alloc] init];
//        reset.viewType = 1;
//        reset.mobileNumber = _nameWindow.text;
//        [self.navigationController pushViewController:reset animated:YES];
//        
//    }else {
//        
//        if (!_isLoading) {
//            // 不在加载
//            [self requestData];
//        }
//    }
}

#pragma mark - 请求数据
- (void)requestData
{
    //暂时先用登录接口，后面要新增判断账号是否存在接口
    
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    NSString *password = [NSString encrypt3DES:@"123456" key:DESkey];
//    [parameters setObject:@"1" forKey:@"OPT"];
//    [parameters setObject:@"" forKey:@"body"];
//    [parameters setObject:_nameWindow.text forKey:@"name"];
//    [parameters setObject:password forKey:@"pwd"];
//    if(AppDelegateInstance.userId !=nil && AppDelegateInstance.channelId != nil) {
//        [parameters setObject:AppDelegateInstance.userId forKey:@"userId"];
//        [parameters setObject:AppDelegateInstance.channelId forKey:@"channelId"];
//    }else {
//        [parameters setObject:@"" forKey:@"userId"];
//        [parameters setObject:@"" forKey:@"channelId"];
//    }
//    [parameters setObject:@"2" forKey:@"deviceType"];
//    
//    if (_requestClient == nil) {
//        _requestClient = [[NetWorkClient alloc] init];
//        _requestClient.delegate = self;
//    }
//    [_requestClient requestGet:@"app/services" withParameters:parameters];
}


#pragma mark  HTTPClientDelegate 网络数据回调代理
-(void) startRequest
{
    _isLoading = YES;
}

//// 返回成功
//-(void) httpResponseSuccess:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didSuccessWithObject:(id)obj
//{
//    DLOG(@"======填写手机号返回====%@",obj);
//    
//    NSDictionary *dics = obj;
//    
//    NSString *error = [NSString stringWithFormat:@"%@",[dics objectForKey:@"error"]];
//    
//    if ([error isEqualToString:@"-1"]) {
//        
//        // 手机号存在，则跳转填写密码
//        FillInPasswordViewController *fillPwdVC = [[FillInPasswordViewController alloc]init];
//        fillPwdVC.userName = _nameWindow.text;
//        if (self.type == Gesture) {
//            //从安全设置进入
//            fillPwdVC.isSecuritySet = YES;
//        }
//        [self.navigationController pushViewController:fillPwdVC animated:YES];
//        
//        
//    }else if ([error isEqualToString:@"-3"]) {
//        
//        //手机号不存在，则跳转注册
//        RegistrationViewController *registerView = [[RegistrationViewController alloc] init];
//        registerView.mobileNumber = _nameWindow.text;
//        [self.navigationController pushViewController:registerView animated:YES];
//        
//    }
//    else {
//        DLOG(@"返回失败  msg -> %@",[obj objectForKey:@"msg"]);
//        
//        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@", [obj objectForKey:@"msg"]]];
//    }
//    _isLoading  = NO;
//}
//
////返回失败
//-(void) httpResponseFailure:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didFailWithError:(NSError *)error
//{
//    [SVProgressHUD showErrorWithStatus:@"网络异常"];
//    _isLoading  = NO;
//}
//
////无可用的网络
//-(void) networkError
//{
//    [SVProgressHUD showErrorWithStatus:@"无可用网络"];
//    _isLoading  = NO;
//}


#pragma mark - 点击空白处收回键盘
- (void)ControlAction
{
    [_nameWindow resignFirstResponder];
}


#pragma mark - UITextField Delegate
-(void)changeValue {
    
    [_phoneView setTitle:_nameWindow.text forState:UIControlStateNormal];
    
    if (_nameWindow.text.length > 0)
    {
        [_signBtn setEnabled:YES];
        [self showView];
        
    }else{
        [_signBtn setEnabled:NO];
        [self hiddenView];
    }
}

- (void)showView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    _reminderView.frame = CGRectMake(0, CGRectGetMaxY(_nameWindow.frame), MSWIDTH, 55);
    _phoneView.hidden = NO;
    
    _phoneView.frame = CGRectMake(40, 10, MSWIDTH-80, 45);
    
    _signBtn.frame = CGRectMake(20, CGRectGetMaxY(_reminderView.frame) + 30, MSWIDTH-40, 38);
    
    [UIView commitAnimations];
}

- (void)hiddenView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    [_nameWindow resignFirstResponder];
    
    _reminderView.frame = CGRectMake(0, CGRectGetMaxY(_nameWindow.frame), MSWIDTH, 0);
    _phoneView.frame = CGRectMake(40, 0, MSWIDTH-80, 0);
    
    _phoneView.hidden = YES;
    
    _signBtn.frame = CGRectMake(20, CGRectGetMaxY(_reminderView.frame)+ 30, MSWIDTH-40, 38);
    
    [UIView commitAnimations];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self hiddenView];
}

#pragma mark - return键处理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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


#pragma mark - 初始化导航条
- (void)initNavigationBar
{
    self.title = @"登录";
    
    self.view.backgroundColor = KbackgroundColor;
    
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:KBlackColor, NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:18.0], NSFontAttributeName, nil]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    // 导航条返回按钮
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
    backItem.tintColor = KBlackColor;
    [self.navigationItem setLeftBarButtonItem:backItem];
    
    // 注册按钮
    UIBarButtonItem *regItem=[[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(regItemClick)];
    regItem.tintColor = KBlackColor;
    [self.navigationItem setRightBarButtonItem:regItem];
    
}



#pragma mark - 返回按钮
- (void)backClick
{
//    switch (self.type) {
//        case ChangeAccount://从登录界面切换账户
//        {
//            [self.navigationController popViewControllerAnimated:YES];
//        }
//            break;
//        case MyAccountCenter://从账户中心进入->点返回回到首页
//        {
//            if(self.delegate && [self.delegate respondsToSelector:@selector(backAction)])
//            {
//                [self.delegate backAction];
//            }
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
//            break;
//        case didFinishLaunching://进入手势密码->从其他账户登录->进入登录界面点返回->回到主界面
//        {
//            [self dismissViewControllerAnimated:NO completion:nil];
//            
//            TabViewController *main = [TabViewController shareTableView];
//            AppDelegateInstance.window.rootViewController = main;
//        }
//            break;
//        case Gesture://修改或关闭手势回到首页
//        {
//            [self.tabBarController setSelectedIndex:0];
//            [self.navigationController popToRootViewControllerAnimated:YES];
//        }
//        case ResetPassword: //忘记密码
//        {
//            [self.navigationController popViewControllerAnimated:YES];
//        }
//        default:
//        {
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
//            break;
//    }
}

@end


