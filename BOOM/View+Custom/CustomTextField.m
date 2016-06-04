//
//  CustomTextField.m
//  P2P
//
//  Created by Cindy on 15/12/23.
//  Copyright (c) 2015年 EIMS. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.textColor = KBlackColor;
        self.font = [UIFont systemFontOfSize:16.0];
        
        self.line1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
        self.line1.backgroundColor = KlayerBorder;
        [self addSubview:self.line1];
        
        self.line2 = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
        self.line2.backgroundColor = KlayerBorder;
        [self addSubview:self.line2];
        
        
        _leftIconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, self.frame.size.height)];
        _leftIconView.backgroundColor = [UIColor clearColor];
        self.leftView = _leftIconView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
}


- (void) setLeftImage:(NSString *)leftIcon rightImage:(NSString *)rightIcon placeName:(NSString *)placeName
{
    self.placeholder = placeName;
    
    if (leftIcon.length > 0)
    {
        _leftIconView.frame = CGRectMake(0, 0, 50, self.frame.size.height);
        _leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, (self.frame.size.height-25)*0.5, 20, 25)];
        _leftImage.image = [UIImage imageNamed:leftIcon];
        _leftImage.contentMode = UIViewContentModeScaleAspectFit;
        [_leftIconView addSubview:_leftImage];
    }
    
    if (rightIcon.length > 0)
    {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 28)];
        [_rightBtn setImage:[UIImage imageNamed:rightIcon] forState:UIControlStateNormal];
        _rightBtn.contentMode = UIViewContentModeScaleAspectFit;
        [_rightBtn addTarget:self action:@selector(shiftAction) forControlEvents:UIControlEventTouchUpInside];
        self.rightView = _rightBtn;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
}

- (void)shiftAction
{
    if(self.tapActionBlock)
    {
        self.tapActionBlock();
        return;
    }
}

@end
