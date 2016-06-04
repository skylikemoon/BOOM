//
//  AuthcodeView.h
//  LX-UI模板
//
//  Created by eims1 on 15/11/2.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthcodeView : UIView
@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串
- (void)getAuthcode;

@end
