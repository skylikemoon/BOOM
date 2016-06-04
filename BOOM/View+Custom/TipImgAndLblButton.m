//
//  TipImgAndLblButton.m
//  BOOM
//
//  Created by eims1 on 16/4/29.
//  Copyright (c) 2016年 sky. All rights reserved.
//  作图效果：类似勾选“是否记住密码”，或展示带有小图的提示文字

#import "TipImgAndLblButton.h"

@implementation TipImgAndLblButton
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
     return self;
}
- (void)buttonSelectedImg:(NSString *)selectedImgName NormalImg:(NSString *)normalImgName LabelText:(NSString *)lblTitle
{

    self.selected = YES;
    [self setImage:[UIImage imageNamed:normalImgName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateSelected];
    self.imageEdgeInsets = UIEdgeInsetsMake(22,15,22,40);//上左下右间距，根据需要调整
    [self setTitle:lblTitle forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.titleLabel.bounds.size.width, 0, 0);
//    [self addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


@end
