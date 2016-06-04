//
//  ImgAndLblButton.h
//  LX-UI模板
//
//  Created by eims1 on 16/4/6.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgAndLblButton : UIButton
@property (nonatomic, strong) UIButton *CenterImgBtn;
@property (nonatomic, strong) UILabel *CenterTitleLabel;

@property (nonatomic, strong) UIView *TopLine;
@property (nonatomic, strong) UIView *BtmLine;
@property (nonatomic, strong) UIView *RightLine;
@property (nonatomic, strong) UIView *LeftLine;

- (void)setCenterImgBtn:(NSString *)imgName CenterTitleLabel:(NSString *)lblTitle;
@end
