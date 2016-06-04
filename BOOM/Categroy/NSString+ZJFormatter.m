//
//  NSString+ZJFormatter.m
//  SP2P
//
//  Created by mac on 16/3/24.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "NSString+ZJFormatter.h"
#import <math.h>

@implementation NSString (ZJFormatter)

+ (NSString *)timeLimitWithTime:(id)time andUnit:(id)unit
{
    if ([unit isEqualToString:@"0"]) {
        return [NSString stringWithFormat:@"%@个月",time];
    }else if ([unit isEqualToString:@"1"]){
        return [NSString stringWithFormat:@"%@日",time];
    }else{
        return [NSString stringWithFormat:@"%@年",time];
    }
}

//金额 格式化
+ (NSString *)RMBFormatterWithObject:(id)obj
{
    if (![obj isKindOfClass:[NSNull class]]) {
        NSString *money=[NSString stringWithFormat:@"%@",obj];
        return [NSString stringWithFormat:@"¥%.2f",[money doubleValue]];
    }else{
        return @"¥0.00";
    }
}

//计算 定金
+ (NSString *)depositMoneyWithMoney:(NSString *)money andDepositRate:(CGFloat)depositRate
{
    return [NSString stringWithFormat:@"%.0f",round([money doubleValue]*depositRate)];
}

@end
