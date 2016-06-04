//
//  SKYScrollLabelView.h
//  SwiftLunBoLabel
//
//  Created by eims1 on 16/2/3.
//  Copyright © 2016年 bsmac1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKYScrollLabelView : UIView

@property (nonatomic, strong)UIImageView *showImage;
@property (nonatomic, strong)UILabel *showLabel;
@property (nonatomic, strong)NSArray *showLabelArr;
@property (nonatomic, assign)double scrollTimeInterval;
@property (nonatomic, assign)int showLabelsIndex;
@property (nonatomic, weak)NSTimer *timer;

- (void)beginScrollWithTimeIntervalAndScrollDatas:(NSTimeInterval)timeInterval and:(NSArray *)scrollDatas;

- (void)stopScroll;

@end
