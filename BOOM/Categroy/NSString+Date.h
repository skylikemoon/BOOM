//
//  NSString+Date.h
//  SP2P
//
//  Created by 李小斌 on 14-10-9.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

// 时间转换 @"yyyy-MM-dd hh:mm:ss"
+(NSString *)converDate:(NSString *)value withFormat:(NSString *)format;

//计算倒计时  相差秒数
+ (NSString *)ZJTimeDowWithEndTimeString:(NSString *)endTimeStr;

//时间差， 返回  天  时  分  秒
+ (NSString *)ZJDayFormatWithTime:(NSInteger)time;

//返回  年 月  日
+ (NSString *)ZJTimeUnit:(NSString *)unit;

@end
