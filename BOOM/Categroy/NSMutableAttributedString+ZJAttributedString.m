//
//  NSMutableAttributedString+ZJAttributedString.m
//  SP2P
//
//  Created by mac on 16/3/24.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "NSMutableAttributedString+ZJAttributedString.h"

@implementation NSMutableAttributedString (ZJAttributedString)

+ (NSMutableAttributedString *)fillWithMaxString:(NSString *)maxStr andMinString:(NSString *)minStr andMaxFont:(UIFont *)maxFont andMaxColor:(UIColor *)maxColor andMinFont:(UIFont *)minFont andMinColor:(UIColor *)minColor
{
    NSString *str=[NSString stringWithFormat:@"%@%@",maxStr,minStr];
    NSMutableAttributedString *attributedStr=[[NSMutableAttributedString alloc] initWithString:str];
    [attributedStr addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:maxFont,NSFontAttributeName,maxColor,NSForegroundColorAttributeName, nil] range:[str rangeOfString:maxStr]];
    [attributedStr addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:minFont,NSFontAttributeName,minColor,NSForegroundColorAttributeName, nil] range:[str rangeOfString:minStr]];
    return attributedStr;
}

@end
