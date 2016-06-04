//
//  LoginWindowTextField.m
//  SP2P_6.1
//
//  Created by kiu on 14-6-18.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//  作图效果：常用于登录界面，带左图和中间内容输入框、右图，明/暗文自己选择加吧

#import "LoginWindowTextField.h"
#import "ColorTools.h"

#define GAP 10
#define WIDTH  self.frame.size.width
#define HEIGHT self.frame.size.height
#define  IMGW  HEIGHT-2*GAP//图片的宽和高
#define  IMGH  HEIGHT-2*GAP


@implementation LoginWindowTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (UIView *)textWithleftImage:(NSString *)leftIcon rightImage:(NSString *)rightIcon placeName:(NSString *)pName
{
    
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = LineColor.CGColor;
    self.layer.cornerRadius = 4.0;
    _contentText = [[UITextField alloc] initWithFrame:CGRectMake(40, 0, 180, 35)];
    _contentText.backgroundColor = [UIColor clearColor];
    _contentText.textColor = [UIColor blackColor];
    _contentText.font = [UIFont fontWithName:@"Arial-BoldMT" size:15.0];
    _contentText.placeholder = pName;
    [self addSubview:_contentText];
    
    _leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    _leftImage.image = [UIImage imageNamed:leftIcon];
    _leftImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_leftImage];

    _rightImage = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 28)];
    [_rightImage setImage:[UIImage imageNamed:rightIcon] forState:UIControlStateNormal];
    _rightImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_rightImage];

    
    return self;
}

- (UIView *)textWithFrame:(CGRect)frame leftImage:(NSString *)leftIcon rightImage:(NSString *)rightIcon placeName:(NSString *)placeName
{
    self.frame = frame;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = LineColor.CGColor;
    self.layer.cornerRadius = 4.0;
    
    _leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(GAP,GAP,IMGW,IMGW)];
    _leftImage.image = [UIImage imageNamed:leftIcon];
    _leftImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_leftImage];
    
    if (![rightIcon isEqualToString:@""] || !rightIcon) {
        _rightImage = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH-GAP-IMGW, GAP, IMGW, IMGW)];
        [_rightImage setImage:[UIImage imageNamed:rightIcon] forState:UIControlStateNormal];
        _rightImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_rightImage];
        
        _contentText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftImage.frame)+GAP, 0, WIDTH-2*(2*GAP+IMGW), HEIGHT)];

    }else{
        _contentText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftImage.frame)+GAP, 0, WIDTH-2*GAP+IMGW, HEIGHT)];
        
    }
    _contentText.backgroundColor = [UIColor clearColor];
    _contentText.textColor = [UIColor blackColor];
    _contentText.font = [UIFont fontWithName:@"Arial-BoldMT" size:15.0];
    _contentText.placeholder = placeName;
    [self addSubview:_contentText];
    
    return self;
}


@end
