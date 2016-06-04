//
//  ProgressLayer.h
//  SP2P_7
//
//  Created by wujiandong on 15/12/9.
//  Copyright (c) 2015年 EIMS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressLayer : UIView

- (id)initWithFrame:(CGRect)frame diameter:(float)diamter roundWidth:(float)roundWidth start:(CGPoint)startPoint;

-(void)setPercent:(float)percent animated:(BOOL)animated;

@property (nonatomic ,copy) NSString *lineCap;



@end
