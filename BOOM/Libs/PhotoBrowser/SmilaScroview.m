//
//  SmilaScroview.m
//  zhanshiView
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "SmilaScroview.h"

@implementation SmilaScroview

- (id)initWithFrame:(CGRect)frame withImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:_imageView] ;
        self.scrollEnabled = YES ;
        _imageView.userInteractionEnabled=YES;
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        self.maximumZoomScale = 2 ;
        self.minimumZoomScale = 1 ;
        self.delegate = self ;
        self.contentSize = self.bounds.size ;
    }

    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView] ;
        self.scrollEnabled = YES ;
        _imageView.userInteractionEnabled=YES;
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        self.maximumZoomScale = 2 ;
        self.minimumZoomScale = 1 ;
        self.delegate = self ;
        self.contentSize = self.bounds.size ;
        
        _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_imageView addSubview:_activityView];
        [_activityView setCenter: _imageView.center] ;
    }
    return self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView ;
}

@end
