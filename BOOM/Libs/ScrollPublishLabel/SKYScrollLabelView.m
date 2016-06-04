//
//  SKYScrollLabelView.m
//  SwiftLunBoLabel
//
//  Created by eims1 on 16/2/3.
//  Copyright © 2016年 bsmac1. All rights reserved.
//

/** 使用示例
 self.SKYView = [[SKYScrollLabelView alloc] initWithFrame:CGRectMake(20, 100,  self.view.frame.size.width-40, PUBLIC_HIGHT)];
 //    self.SKYView.backgroundColor = [UIColor brownColor];
 self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
 self.tapGesture.numberOfTapsRequired = 1;
 [self.SKYView addGestureRecognizer:self.tapGesture];
 
 [self.view addSubview:self.SKYView];
 
 //数据源
 self.dataArray = @[@"qiajinesoyo",@"ani",@"nigaodiinnayo",@"weitedapeijione"];
 
 //调用开始滚动
 [self.SKYView beginScrollWithTimeIntervalAndScrollDatas:2.0 and:self.dataArray];
 
 //停止滚动
 [self.SKYView stopScroll];

 
 ==========================
 - (void)handleTapGesture:(UITapGestureRecognizer *)tap
 {
 //可以传参数跳转
 //    NSLog(@"dataArray:%@",self.dataArray);
 NSLog(@"self.SKYView.showLabelsIndex = %d",self.SKYView.showLabelsIndex);
 
 }
 
 */

#import "SKYScrollLabelView.h"
#define PUBLIC_HIGHT 30

@implementation SKYScrollLabelView
{
    NSInteger labelIndex;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.showLabel = [[UILabel alloc] init];
        self.showLabel.frame = CGRectMake(20, PUBLIC_HIGHT, self.frame.size.width, PUBLIC_HIGHT);
//        self.showLabel.backgroundColor = [UIColor redColor];
//        self.showLabel.textColor = [UIColor redColor];
        self.showLabel.textAlignment = NSTextAlignmentCenter;
        self.showLabelsIndex  = 0;
        self.showLabel.text = @"init text";
        [self addSubview:self.showLabel];
        
        
        self.showImage = [[UIImageView alloc] init];
        self.showImage.frame = CGRectMake(0, 0, 20, PUBLIC_HIGHT);
        self.showImage.image = [UIImage imageNamed:@"laba"];
        [self addSubview:self.showImage];
    }
   
    
    return self;
}

- (void)beginScrollWithTimeIntervalAndScrollDatas:(NSTimeInterval)timeInterval and:(NSArray *)scrollDatas
{

    //设置滚动的数据
    self.showLabelArr = scrollDatas;

    self.scrollTimeInterval = (float)timeInterval ;
    self.showLabel.text = self.showLabelArr[0];

    
    //设置计时器开始滚动
    self.timer  = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(refreshScrollLabel) userInfo:nil repeats:YES];
}



- (void)refreshScrollLabel
{
//    NSLog(@"self.scrollTimeInterval:%f",self.scrollTimeInterval-0.1);

    
    [UIView animateWithDuration:self.scrollTimeInterval-0.1 animations:^{
        CGRect rect = self.showLabel.frame;
        rect.origin.y  = -PUBLIC_HIGHT;
        self.showLabel.frame = rect;
        
    }completion:^(BOOL finished) {
        CGRect rect2 = self.showLabel.frame;
        rect2.origin.y = self.frame.size.height;
        self.showLabel.frame = rect2;
        
        //如果还有下一个，就设置下一个，如果没有就重新开始
        if (self.showLabelArr.count-1>self.showLabelsIndex) {
            self.showLabelsIndex = self.showLabelsIndex+1;
        }else
        {
            self.showLabelsIndex = 0;
            
        }
        
        if (self.showLabelArr.count!=0) {
            self.showLabel.text = self.showLabelArr[self.showLabelsIndex];
        }
        
    }];
    
    labelIndex = self.showLabelsIndex;
    
}

- (void)stopScroll
{
    [self.timer invalidate];
    self.timer = nil;
    self.showLabel.text = @"";
    self.showLabelArr = nil;
    self.showLabelsIndex = 0;
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
