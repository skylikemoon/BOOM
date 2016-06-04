//
//  NSString+ZJFormatter.h
//  SP2P
//
//  Created by mac on 16/3/24.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZJFormatter)

+ (NSString *)timeLimitWithTime:(id)time andUnit:(id)unit;

//金额 格式化
+ (NSString *)RMBFormatterWithObject:(id)obj;

//定金算法
+ (NSString *)depositMoneyWithMoney:(NSString *)money andDepositRate:(CGFloat)depositRate;

@end
