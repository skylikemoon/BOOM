//
//  ColorTools.h
//  EnterpriseWeb
//
//  Created by 李小斌 on 14-5-28.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//

#import <Foundation/Foundation.h>

// app端传输 key
#define MD5key  @"l9b4eTdMS2D0Yc4K"
// 加密 key
#define DESkey  @"mbVjZF0AAvNeumcK"
// 测试
#define Baseurl   @"http://p2p-8.test9.shovesoft.com"

//设置RGB颜色值
#define SETCOLOR(R,G,B,A)	[UIColor colorWithRed:(CGFloat)R/255 green:(CGFloat)G/255 blue:(CGFloat)B/255 alpha:A]

//黑色字体
#define FONTCOLOR_BLACK ([UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1])

//淡黑色字体
#define FONTCOLOR_LIGHTBLACK ([UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1])

//灰色字体
#define FONTCOLOR_GREY ([UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1])

@interface ColorTools : NSObject

/** 颜色转换 IOS中十六进制的颜色转换为UIColor **/
+ (UIColor *) colorWithHexString: (NSString *)color;

@end
