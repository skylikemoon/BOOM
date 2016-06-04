//
//  JXLRPopTipView.m
//  LX-UI模板
//
//  Created by eims1 on 16/2/20.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import "JXLRPopTipView.h"

@implementation JXLRPopTipView

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:1];
        
        UIView *rectView = [[UIView alloc] init];
        rectView.backgroundColor = [UIColor whiteColor];
        rectView.frame = CGRectMake(MSWIDTH/2-125, MSHEIGHT/2-100, 250, 200);
        rectView.layer.cornerRadius = 8.0;
        [self addSubview:rectView];
        
        _topBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 250, 50)];
        _topBtn.backgroundColor = [UIColor whiteColor];
        _topBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _topBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_topBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [rectView addSubview:_topBtn];
        
        _titleLbl1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 250, 60)];
        _titleLbl1.textAlignment = NSTextAlignmentCenter;
        _titleLbl1.font = [UIFont systemFontOfSize:14];
        _titleLbl1.numberOfLines = 0;
        _titleLbl1.lineBreakMode = NSLineBreakByClipping;
        _titleLbl1.textColor = [UIColor blackColor];
        [rectView addSubview:_titleLbl1];
//        _titleLbl1.backgroundColor = [UIColor blackColor];

//        _titleLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, MSWIDTH-140, 50)];
//        _titleLbl2.textAlignment = NSTextAlignmentCenter;
//        _titleLbl2.font = [UIFont systemFontOfSize:16];
//        _titleLbl2.backgroundColor = [UIColor whiteColor];
//        _titleLbl2.text = @"登录密码不正确，请重新输入";
//        [rectView addSubview:_titleLbl2];
        
        
        
        _bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 140, 210, 36)];
        _bottomBtn.backgroundColor = KRedColor;
        _bottomBtn.layer.cornerRadius = 3.0;
        _bottomBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
//        [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_bottomBtn setTitle:@"返回登录" forState:UIControlStateNormal];
        [rectView addSubview:_bottomBtn];
    }
    return self;
}



@end

