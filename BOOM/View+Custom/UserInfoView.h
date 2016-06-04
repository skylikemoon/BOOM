//
//  UserInfoView.h
//  LX-UI模板
//
//  Created by eims1 on 15/11/3.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoView : UIView
@property (nonatomic,strong) NSDictionary *param;

- (void)loadData;
@end
