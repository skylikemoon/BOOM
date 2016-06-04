//
//  ImgAndLblButton.m
//  LX-UI模板
//
//  Created by eims1 on 16/4/6.
//  Copyright (c) 2016年 sky. All rights reserved.
//  作图效果：图和文字做两行，y轴中间对齐

#import "ImgAndLblButton.h"

#define IMG_WIDTH 30
#define IMG_HEIGHT 30
#define LBL_WIDTH 100
#define LBL_HEIGHT 20
#define ADJUST_GAP 10


@implementation ImgAndLblButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.TopLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
        self.TopLine.backgroundColor = KlayerBorder;
        [self addSubview:self.TopLine];
        
        self.BtmLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
        self.BtmLine.backgroundColor = KlayerBorder;
        [self addSubview:self.BtmLine];
        
        self.LeftLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, self.frame.size.height)];
        self.LeftLine.backgroundColor = KlayerBorder;
        [self addSubview:self.LeftLine];
        
        self.RightLine = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-1, 0,1, self.frame.size.height)];
        self.RightLine.backgroundColor = KlayerBorder;
        [self addSubview:self.RightLine];
        
        
        self.CenterImgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.CenterImgBtn.frame = CGRectMake((self.frame.size.width-IMG_WIDTH)/2, (self.frame.size.height-IMG_HEIGHT-ADJUST_GAP)/2, IMG_WIDTH, IMG_HEIGHT);//根据实际使用情况修改frame
//        self.CenterImgBtn.backgroundColor = [UIColor brownColor];
        self.CenterImgBtn.userInteractionEnabled = NO;
        [self addSubview:self.CenterImgBtn];

        
        self.CenterTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.CenterImgBtn.frame)+ADJUST_GAP, self.frame.size.width, LBL_HEIGHT)];
        self.CenterTitleLabel.backgroundColor = [UIColor clearColor];
        self.CenterTitleLabel.font = [UIFont systemFontOfSize:15.0f];
        self.CenterTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.CenterTitleLabel];
    
    }
    return self;
}

- (void)setCenterImgBtn:(NSString *)imgName CenterTitleLabel:(NSString *)lblTitle
{
    [self.CenterImgBtn setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    self.CenterTitleLabel.text = lblTitle;
    
}


@end
