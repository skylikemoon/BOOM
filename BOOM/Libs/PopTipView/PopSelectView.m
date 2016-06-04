//
//  PopSelectView.m
//  LX-UI模板
//
//  Created by eims1 on 15/11/9.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import "PopSelectView.h"

@implementation PopSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [LineColor colorWithAlphaComponent:0.5];
        UIView *rectView = [[UIView alloc] init];
        rectView.backgroundColor = [UIColor whiteColor];
        rectView.frame = CGRectMake(MSWIDTH/2-100, 70, MSWIDTH-100, 150);
        [self addSubview:rectView];
        
        _titleLbl1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MSWIDTH-140, 50)];
        _titleLbl1.textAlignment = NSTextAlignmentCenter;
        _titleLbl1.font = [UIFont systemFontOfSize:16];
        _titleLbl1.textColor = [UIColor whiteColor];
        _titleLbl1.text = @"请选择注册方式";
        [rectView addSubview:_titleLbl1];
        
//        _titleLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, MSWIDTH-140, 50)];
//        _titleLbl2.textAlignment = NSTextAlignmentCenter;
//        _titleLbl2.font = [UIFont systemFontOfSize:16];
//        _titleLbl2.backgroundColor = [UIColor whiteColor];
//        _titleLbl2.text = @"登录密码不正确，请重新输入";
//        [rectView addSubview:_titleLbl2];
        
        _phoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, MSWIDTH-140, 50)];
        _phoneBtn.backgroundColor = KColor;
        [_phoneBtn setTitle:@"手机注册" forState:UIControlStateNormal];
        [rectView addSubview:_phoneBtn];
        
        _emailBtn= [[UIButton alloc] initWithFrame:CGRectMake(0, 100, MSWIDTH-140, 50)];
        [_phoneBtn setTitle:@"邮箱注册" forState:UIControlStateNormal];
        [rectView addSubview:_emailBtn];
    }
    return self;
}


@end
