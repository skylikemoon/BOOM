//
//  NSString+Date.m
//  SP2P
//
//  Created by 李小斌 on 14-10-9.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)


+(NSString *)converDate:(NSString *)value withFormat:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970: [value doubleValue]/1000];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate: date];
}

+ (NSString *)ZJTimeDowWithEndTimeString:(NSString *)endTimeStr
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.dateFormat=@"yyyy-MM-dd HH:mm:ss";
    dateFormatter.timeZone=[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    
    NSDate *nowDate=[NSDate date];
    
    NSDate *endDate=[NSDate dateWithTimeIntervalSince1970:[endTimeStr doubleValue]/1000];
    
    NSTimeInterval timeDown=[endDate timeIntervalSinceDate:nowDate];
    if (timeDown>0) {
        return [NSString stringWithFormat:@"%ld",(long)timeDown];
    }else{
        return @"";
    }
}

+ (NSString *)ZJDayFormatWithTime:(NSInteger)time
{
    if (time>0) {
        int day = (int)time/(3600*24);
        int hour = (int)time%(3600*24)/3600;
        int minute = (int)time%(3600*24)%3600/60;
        int second = (int)time%(3600*24)%3600%60;
        if (day==0) {
            if (hour==0) {
                if (minute==0) {
                    if (second==0) {
                        return @"";
                    }else{
                        return [NSString stringWithFormat:@"%d秒",second];
                    }
                }else{
                    return [NSString stringWithFormat:@"%d分%d秒",minute,second];
                }
            }else{
                return [NSString stringWithFormat:@"%d时%d分%d秒",hour,minute,second];
            }
        }else{
            return [NSString stringWithFormat:@"%d天%d时%d分%d秒",day,hour,minute,second];
        }
    }else{
        return @"";
    }
}

+ (NSString *)ZJTimeUnit:(NSString *)unit
{
    if ([unit isEqualToString:@"0"]) {
        return @"个月";
    }else if ([unit isEqualToString:@"1"]){
        return @"日";
    }else{
        return @"年";
    }
}

@end
