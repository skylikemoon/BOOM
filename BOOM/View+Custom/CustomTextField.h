//
//  CustomTextField.h
//  P2P
//
//  Created by Cindy on 15/12/23.
//  Copyright (c) 2015年 EIMS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapAction)(void);

@interface CustomTextField : UITextField

@property (nonatomic, copy) NSString *placeName;
@property (nonatomic, strong) UIView *leftIconView;
@property (nonatomic, strong) UIImageView *leftImage;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UILabel *line1;
@property (nonatomic, strong) UILabel *line2;
@property (nonatomic,copy) TapAction tapActionBlock;

@property (nonatomic,strong) NSArray *userLists;


- (void)setLeftImage:(NSString *)leftIcon rightImage:(NSString *)rightIcon placeName:(NSString *)placeName;


@end
