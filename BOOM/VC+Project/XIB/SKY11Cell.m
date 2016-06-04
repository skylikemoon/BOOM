//
//  SKY11Cell.m
//  LX-UI模板
//
//  Created by eims1 on 15/11/3.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import "SKY11Cell.h"

@implementation SKY11Cell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
                
       /*在webView的delegate回调方法-webViewDidFinishLoad:(UIWebView*)webView;中写下语句即可;把方法写在init里不行
        //字体大小
        
        [self.contentWebView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '330%'"];
        
        //字体颜色
        
        [self.contentWebView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= 'gray'"];
        
        //页面背景色
        
        [self.contentWebView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#2E2E2E'"];
        */
        
        self.imgBtn.CenterImgBtn.backgroundColor = [UIColor redColor];
        [self.imgBtn setCenterImgBtn:@"login_lock" CenterTitleLabel:@"23rqe"];
    

    }
    return self;
}


@end
