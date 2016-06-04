//
//  NSMutableAttributedString+ZJAttributedString.h
//  SP2P
//
//  Created by mac on 16/3/24.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (ZJAttributedString)

+ (NSMutableAttributedString *)fillWithMaxString:(NSString *)maxStr andMinString:(NSString *)minStr andMaxFont:(UIFont *)maxFont andMaxColor:(UIColor *)maxColor andMinFont:(UIFont *)minFont andMinColor:(UIColor *)minColor;

@end
