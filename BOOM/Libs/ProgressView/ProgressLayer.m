//
//  ProgressLayer.m
//  SP2P_7
//
//  Created by wujiandong on 15/12/9.
//  Copyright (c) 2015年 EIMS. All rights reserved.
//

/** 使用
 ProgressLayer *progress = [[ProgressLayer alloc]initWithFrame:CGRectMake(MSWIDTH/2-60, 100, 120, 120) diameter:120 roundWidth:4 start:CGPointMake(140, 40)];
 
 [progress setPercent:80 animated:YES];
 [backView1 addSubview:progress];
 
 */

#import "ProgressLayer.h"

#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define PROGREESS_WIDTH 200 //圆直径
#define PROGRESS_LINE_WIDTH 10 //弧线的宽度
@interface ProgressLayer ()
{
    CAShapeLayer *_trackLayer;
    CAShapeLayer *_progressLayer;
}
@end

@implementation ProgressLayer

- (id)initWithFrame:(CGRect)frame diameter:(float)diamter roundWidth:(float)roundWidth start:(CGPoint)startPoint
{
    if (self = [super initWithFrame:frame]) {
        
        //创建一个track shape layer
        _trackLayer = [CAShapeLayer layer];
        _trackLayer.frame = self.bounds;
        [self.layer addSublayer:_trackLayer];
        _trackLayer.fillColor = [[UIColor clearColor] CGColor];
        _trackLayer.strokeColor = [FONTCOLOR_LIGHTGREY CGColor];//指定path的渲染颜色
        _trackLayer.opacity = 0.8; //背景同学你就甘心做背景吧，不要太明显了，透明度小一点
        _trackLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
        if (self.lineCap.length > 0) {
            _trackLayer.lineCap = kCALineJoinBevel;
        }
        _trackLayer.lineWidth = roundWidth;//线的宽度
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:(diamter-roundWidth)/2 startAngle:degreesToRadians(startPoint.x) endAngle:degreesToRadians(startPoint.y) clockwise:YES];//上面说明过了用来构建圆形
        _trackLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.frame = self.bounds;
        _progressLayer.fillColor = [[UIColor clearColor] CGColor];
        _progressLayer.strokeColor  = [[UIColor whiteColor] CGColor];
        _progressLayer.lineCap = kCALineCapRound;
        if (self.lineCap.length > 0) {
            _trackLayer.lineCap = kCALineJoinBevel;
        }
        _progressLayer.lineWidth = roundWidth;
        _progressLayer.path = [path CGPath];
        _progressLayer.strokeEnd = 0.0;
        
        //创建一个渐变 layer
        CALayer *gradientLayer = [CALayer layer];
        [gradientLayer setMask:_progressLayer];    //用trackLayer来截取渐变层
        [self.layer addSublayer:gradientLayer];
        
        CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
        gradientLayer1.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[VIEWMAINCOLOR_ORANGE CGColor],(id)[VIEWMAINCOLOR_ORANGE CGColor], nil]];//设置不同颜色的数组可以展示混合色
        [gradientLayer1 setLocations:@[@0.0,@1.0,@1 ]];
        [gradientLayer1 setStartPoint:CGPointMake(0.5, 1)];
        [gradientLayer1 setEndPoint:CGPointMake(0.5, 0)];
        [gradientLayer addSublayer:gradientLayer1];
        
//        CAGradientLayer *gradientLayer2 =  [CAGradientLayer layer];
//        [gradientLayer2 setLocations:@[@0.1,@0.5,@1]];
//        gradientLayer2.frame = CGRectMake(self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height);
//        [gradientLayer2 setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor]CGColor],(id)[[UIColor yellowColor] CGColor], nil]];
//        [gradientLayer2 setStartPoint:CGPointMake(0.5, 0)];
//        [gradientLayer2 setEndPoint:CGPointMake(0.5, 1)];
//        [gradientLayer addSublayer:gradientLayer2];
        
        
    }
    return self;
}

-(void)setPercent:(float)percent animated:(BOOL)animated
{
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:0.3];
    _progressLayer.strokeEnd = percent/100.0;
    [CATransaction commit];
}

- (UIColor *)colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0x"] || [cString hasPrefix:@"0X"] )
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
