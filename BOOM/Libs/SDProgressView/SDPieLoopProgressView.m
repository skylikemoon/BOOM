//
//  SDPieLoopProgressView.m
//  SDProgressView
//
//  Created by aier on 15-2-20.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDPieLoopProgressView.h"

@implementation SDPieLoopProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    /*
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - SDProgressViewItemMargin * 0.2;
    
    // 灰色背景遮罩
    [SDColorMaker(240, 240, 240, 1) set];
//    [[UIColor whiteColor] set];
    //    CGFloat maskW = (radius + 1) * 2;
    CGFloat maskW = radius  * 2;
    CGFloat maskH = maskW;
    CGFloat maskX = (rect.size.width - maskW) * 0.5;
    CGFloat maskY = (rect.size.height - maskH) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(maskX, maskY, maskW, maskH));
    CGContextFillPath(ctx);
    
    // 进度环边框
    [SDColorMaker(240, 240, 240, 1) set];
//    [[UIColor brownColor] set];
    CGFloat w = radius * 2 + 1;
    CGFloat h = w;
    CGFloat x = (rect.size.width - w) * 0.5;
    CGFloat y = (rect.size.height - h) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
    CGContextStrokePath(ctx);
    
    // 进度环
//    [SDProgressViewBackgroundColor set];
    [[UIColor orangeColor] set];
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGContextAddLineToPoint(ctx, xCenter, 0);
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    // 遮罩
//    [SDColorMaker(240, 240, 240, 1) set];
    [[UIColor whiteColor] set];
//    CGFloat maskW = (radius + 1) * 2;
    CGFloat maskW2 = (radius - 6) * 2;
    CGFloat maskH2 = maskW2;
    CGFloat maskX2 = (rect.size.width - maskW2) * 0.5;
    CGFloat maskY2 = (rect.size.height - maskH2) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(maskX2, maskY2, maskW2, maskH2));
    CGContextFillPath(ctx);
    
    // 遮罩边框
    [SDColorMaker(240, 240, 240, 1) set];
//    [[UIColor grayColor] set];
//    [[UIColor orangeColor] set];
    CGFloat borderW = maskW + 1;
    CGFloat borderH = borderW;
    CGFloat borderX = (rect.size.width - borderW) * 0.5;
    CGFloat borderY = (rect.size.height - borderH) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(borderX, borderY, borderW, borderH));
    CGContextStrokePath(ctx);
    
    // 进度数字
    NSString *progressStr = [NSString stringWithFormat:@"%.1f%s", self.progress * 100, "\%"];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20 * SDProgressViewFontScale];
    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [self setCenterProgressText:progressStr withAttributes:attributes];*/
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - SDProgressViewItemMargin * 0.2;
    
    // 灰色背景遮罩
    [SDColorMaker(240, 240, 240, 1) set];
    //    [[UIColor whiteColor] set];
    //    CGFloat maskW = (radius + 1) * 2;
    CGFloat maskW = radius  * 2;
    CGFloat maskH = maskW;
    CGFloat maskX = (rect.size.width - maskW) * 0.5;
    CGFloat maskY = (rect.size.height - maskH) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(maskX, maskY, maskW, maskH));
    CGContextFillPath(ctx);
    
    // 进度环边框
    [SDColorMaker(240, 240, 240, 1) set];
    //    [[UIColor brownColor] set];
    CGFloat w = radius * 2 + 1;
    CGFloat h = w;
    CGFloat x = (rect.size.width - w) * 0.5;
    CGFloat y = (rect.size.height - h) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
    CGContextStrokePath(ctx);
    
    // 进度环(默认为逆时针，需要改为顺时针)
    //    [SDProgressViewBackgroundColor set];
    [[UIColor orangeColor] set];
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGContextAddLineToPoint(ctx, -xCenter, yCenter);
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
    CGContextAddArc(ctx, xCenter, yCenter, radius, -M_PI*0.5-20, to-40,  0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    // 遮罩
    //    [SDColorMaker(240, 240, 240, 1) set];
    [[UIColor whiteColor] set];
    //    CGFloat maskW = (radius + 1) * 2;
    CGFloat maskW2 = (radius - 6) * 2;
    CGFloat maskH2 = maskW2;
    CGFloat maskX2 = (rect.size.width - maskW2) * 0.5;
    CGFloat maskY2 = (rect.size.height - maskH2) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(maskX2, maskY2, maskW2, maskH2));
    CGContextFillPath(ctx);
    
    // 遮罩边框
    [SDColorMaker(240, 240, 240, 1) set];
    //    [[UIColor grayColor] set];
    //    [[UIColor orangeColor] set];
    CGFloat borderW = maskW + 1;
    CGFloat borderH = borderW;
    CGFloat borderX = (rect.size.width - borderW) * 0.5;
    CGFloat borderY = (rect.size.height - borderH) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(borderX, borderY, borderW, borderH));
    CGContextStrokePath(ctx);
    
    // 进度数字
    NSString *progressStr = [NSString stringWithFormat:@"%.1f%s", self.progress * 100, "\%"];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20 * SDProgressViewFontScale];
    attributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [self setCenterProgressText:progressStr withAttributes:attributes];
    
    
}

@end
