//
//  SmilaScroview.h
//  zhanshiView
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmilaScroview : UIScrollView<UIScrollViewDelegate>
@property (nonatomic,strong) NSString * urlstring ;
@property (nonatomic,strong) UIImageView * imageView ;
@property(nonatomic,strong)UIActivityIndicatorView *activityView;//菊花视图

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image;

@end
