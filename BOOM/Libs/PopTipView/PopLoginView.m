//
//  PopLoginView.m
//  LX-UI模板
//
//  Created by eims1 on 15/11/12.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import "PopLoginView.h"

@implementation PopLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        UIView *rectView = [[UIView alloc] init];
        rectView.backgroundColor = [UIColor whiteColor];
        rectView.frame = CGRectMake(70, MSHEIGHT/2-75, MSWIDTH-140, 150);
        [self addSubview:rectView];
        
        _titleLbl1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MSWIDTH-140, 50)];
        _titleLbl1.textAlignment = NSTextAlignmentCenter;
        _titleLbl1.font = [UIFont systemFontOfSize:16];
        _titleLbl1.backgroundColor = KColor;
        _titleLbl1.textColor = [UIColor whiteColor];
        _titleLbl1.text = @"提示";
        [rectView addSubview:_titleLbl1];
        
        _titleLbl2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, MSWIDTH-140, 50)];
        _titleLbl2.textAlignment = NSTextAlignmentCenter;
        _titleLbl2.font = [UIFont systemFontOfSize:18];
        _titleLbl2.backgroundColor = [UIColor whiteColor];
        _titleLbl2.text = @"请先登录~";
        [rectView addSubview:_titleLbl2];
        
        _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, (MSWIDTH-140)/2, 50)];
        _sureBtn.backgroundColor = KColor;
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [rectView addSubview:_sureBtn];
        
        _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake((MSWIDTH-140)/2, 100, (MSWIDTH-140)/2, 50)];
        [_cancelBtn setTitleColor:KColor forState:UIControlStateNormal];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [rectView addSubview:_cancelBtn];
    }
    return self;
}


@end
