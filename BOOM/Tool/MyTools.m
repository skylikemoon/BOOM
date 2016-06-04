//
//  MyTools.m
//  SP2P_6.1
//
//  Created by wujiandong on 15/11/13.
//  Copyright (c) 2015年 EIMS. All rights reserved.
//

#import "MyTools.h"
@implementation MyTools
+ (NSString *)formatNumberToTenThousandUnitWith:(double)number
                                  decimalLength:(NSInteger)decimalLength {
    NSString *numString;/*
    if (number > 10000) {
        
        switch (decimalLength) {
            case 0:
                numString = [NSString stringWithFormat:@"%.0f万",number/10000.0];
                break;
            case 1:
                numString = [NSString stringWithFormat:@"%.1f万",number/10000.0];
                break;
            case 2:
                numString = [NSString stringWithFormat:@"%.2f万",number/10000.0];
                break;
            case 3:
                numString = [NSString stringWithFormat:@"%.3f万",number/10000.0];
                break;
            case 4:
                numString = [NSString stringWithFormat:@"%.4f万",number/10000.0];
                break;
                
            default:
                numString = [NSString stringWithFormat:@"%.2f万",number/10000.0];
                break;
        }
        numString = [NSString stringWithFormat:@"%.2f万",number/10000.0];
    }else {
        */
        switch (decimalLength) {
            case 0:
                numString = [NSString stringWithFormat:@"%.0f",number];
                break;
            case 1:
                numString = [NSString stringWithFormat:@"%.1f",number];
                break;
            case 2:
                numString = [NSString stringWithFormat:@"%.2f",number];
                break;
            case 3:
                numString = [NSString stringWithFormat:@"%.3f",number];
                break;
            case 4:
                numString = [NSString stringWithFormat:@"%.4f",number];
                break;
                
            default:
                numString = [NSString stringWithFormat:@"%.2f",number];
                break;
        }
    if (number > 1000) {
        numString = [self strmethodComma:numString];
    }
    
//    }
    return numString;
}

//分割
+ (NSString*)strmethodComma:(NSString*)string {
    NSString *sign = nil;
    if ([string hasPrefix:@"-"]||[string hasPrefix:@"+"]) {
        sign = [string substringToIndex:1];
        string = [string substringFromIndex:1];
    }
    
    NSString *pointLast = [string substringFromIndex:[string length]-3];
    NSString *pointFront = [string substringToIndex:[string length]-3];
    
    NSInteger commaNum = ([pointFront length]-1)/3;
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < commaNum+1; i++) {
        NSInteger index = [pointFront length] - (i+1)*3;
        NSInteger leng = 3;
        if(index < 0)
        {
            leng = 3+index;
            index = 0;
            
        }
        NSRange range = {index,leng};
        NSString *stq = [pointFront substringWithRange:range];
        [arr addObject:stq];
    }
    NSMutableArray *arr2 = [NSMutableArray array];
    for (NSInteger i = [arr count]-1; i>=0; i--) {
        
        [arr2 addObject:arr[i]];
    }
    NSString *commaString = [[arr2 componentsJoinedByString:@","] stringByAppendingString:pointLast];
    if (sign) {
        commaString = [sign stringByAppendingString:commaString];
    }
    return commaString;
    
}

+ (NSMutableAttributedString *)getNSMutableAttributedStringWithText:(NSString *)text
                                                              start:(NSInteger)textStart
                                                                end:(NSInteger)textEnd
                                                          textColor:(UIColor *)textColor
                                                           textFont:(UIFont *)textFont
{
    NSString *string = text;
    NSInteger textLong = textEnd - textStart;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSFontAttributeName value:textFont range:NSMakeRange(textStart, textLong)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(textStart, textLong)];
    
    return attributedString;
}

+ (NSMutableAttributedString *)getTimeNSMutableAttributedStringWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont
{
    NSString *string = text;
    NSRange dayRange = [string rangeOfString:@"天"];
    NSRange hourRange = [string rangeOfString:@"时"];
    NSRange minuteRange = [string rangeOfString:@"分"];
    NSRange secondRange = [string rangeOfString:@"秒"];
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                          value:textColor
                          range:NSMakeRange(dayRange.location, dayRange.length)];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                               value:textColor
                               range:NSMakeRange(hourRange.location, hourRange.length)];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                          value:textColor
                               range:NSMakeRange(minuteRange.location, minuteRange.length)];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                               value:textColor
                               range:NSMakeRange(secondRange.location, secondRange.length)];
    
    
    return AttributedStr;
}

+ (CGSize)getSizeOfString:(NSString *)string
                 maxWidth:(float)width
                maxHeight:(float)height
             withFontSize:(CGFloat)fontSize
{
    CGSize size =  [string boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil].size;
    return size;
}

+ (CGSize)getTypeFaceSizeOfString:(NSString *)string
                         maxWidth:(float)width
                        maxHeight:(float)height
                         withFont:(UIFont *)font
{
    CGSize size =  [string boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size;
}

+ (UIButton *)leftBarButton
{
    // 导航条返回按钮
    UIImage *leftImage = [UIImage imageNamed:@"nav_back"];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame =  CGRectMake(0, 0, 60, 44);
    [leftButton setBackgroundColor:[UIColor clearColor]];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    [leftButton setImage:leftImage forState:UIControlStateNormal];
    
    return leftButton;
}

+ (UIView *)textFieldLeftViewWithImageSize:(CGSize)imageSize
                                 imageName:(NSString *)imageName
{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 30)];
    leftView.backgroundColor = [UIColor clearColor];
    
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:CGRectMake((leftView.frame.size.width - 6 - imageSize.width)/2, (leftView.frame.size.height - imageSize.height)/2, imageSize.width, imageSize.height)];
    leftImage.image = [UIImage imageNamed:imageName];
    leftImage.contentMode = UIViewContentModeScaleAspectFit;
    [leftView addSubview:leftImage];
    
    UIView *lineNameWindow = [[UIView alloc] initWithFrame:CGRectMake(leftView.frame.size.width - 6, (leftView.frame.size.height-20)/2, 1, 20)];
    lineNameWindow.backgroundColor = [UIColor lightGrayColor];
    [leftView addSubview:lineNameWindow];
    
    return leftView;
}
@end

#pragma mark ----- UILabel
@implementation UILabel (MyTools)
+ (id)labelWithFrame:(CGRect)frame
                text:(NSString *)text
           textColor:(UIColor *)textColor
            textFont:(float)textFont
            fitWidth:(BOOL)fitWidth
           superview:(id)superview {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (text.length > 0) {
        label.text = text;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (textFont > 0) {
        label.font = [UIFont systemFontOfSize:textFont];
    }
    if (fitWidth) {
        label.adjustsFontSizeToFitWidth = YES;
    }else {
        label.adjustsFontSizeToFitWidth = NO;
    }
    label.textAlignment = NSTextAlignmentLeft;
    if (superview) {
        [superview addSubview:label];
    }
    return label;
}

@end

#pragma mark ----- UIImageView
@implementation UIImageView (MyTools)
+ (id)imageViewWithFrame:(CGRect)frame
               imageFile:(NSString *)imageFile
               superview:(id)superview {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (imageFile.length > 0) {
        imageView.image = [UIImage imageNamed:imageFile];
    }
    [superview addSubview:imageView];
    return imageView;
}
@end

@implementation UIView (JDControls)
+ (id)viewWithFrame:(CGRect)frame
    backgroundColor:(UIColor *)backgroundColor
          superview:(id)superview {
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    if (backgroundColor) {
        view.backgroundColor = backgroundColor;
    }
    [superview addSubview:view];
    return view;
}

@end

#pragma mark ----- UIButton
@implementation UIButton (MyTools)
+(id)buttonWithFrame:(CGRect)frame
     backgroundColor:(UIColor *)backgroundColor
               title:(NSString *)title
          titleColor:(UIColor *)titleColor
           titleFont:(CGFloat)titleFont
              target:(id)target
              action:(SEL)action
           superview:(id)superview {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (backgroundColor) {
        [button setBackgroundColor:backgroundColor];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (titleFont > 0) {
        button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (superview) {
        [superview addSubview:button];
    }
    return button;
}

@end

#pragma mark ----- UITextField
@implementation UITextField (MyTools)
+ (id)textFieldWithFrame:(CGRect)frame
                delegate:(id)delegate
                    text:(NSString *)text
               textColor:(UIColor *)textColor
                textFont:(float)textFont
             placeholder:(NSString *)placeholder
               superview:(id)superview {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleNone;
    if (delegate) {
        textField.delegate = delegate;
    }
    if (text.length > 0) {
        textField.text = text;
    }
    if (placeholder.length > 0) {
        textField.placeholder = placeholder;
    }
    if (textFont > 0) {
        textField.font = [UIFont systemFontOfSize:textFont];
    }
    textField.returnKeyType = UIReturnKeyDone;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone; //取消自动大写
    textField.autocorrectionType = UITextAutocorrectionTypeNo;  //取消自动修正
    textField.borderStyle = UITextBorderStyleNone;  //取消边框
    [superview addSubview:textField];
    return textField;
}
@end

#pragma mark ----- UITableView
@implementation UITableView (MyTools)
+ (id)tableViewWithFrmae:(CGRect)frame
         backgroundColor:(UIColor *)backgroundColor
                delegate:(id)delegate
              dataSource:(id)dataSource
          tableViewStyle:(UITableViewStyle)tableViewStyle
          separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
               superview:(id)superview {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:tableViewStyle];
    if (backgroundColor) {
        tableView.backgroundColor = backgroundColor;
    }
    if (delegate) {
        tableView.delegate = delegate;
    }
    if (dataSource) {
        tableView.dataSource = dataSource;
    }
    if (separatorStyle) {
        tableView.separatorStyle = separatorStyle; //分割线样式
    }else {
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    [superview addSubview:tableView];
    return tableView;
}
@end

#pragma mark ----- UIScrollView
@implementation UIScrollView (MyTools)
+ (id)scrollViewWithFrame:(CGRect)frame
                 delegate:(id)delegate
          backgroundColor:(UIColor *)backgroundColor
                superview:(id)superview {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    if (backgroundColor) {
        scrollView.backgroundColor = backgroundColor;
    }
    if (delegate) {
        scrollView.delegate = delegate;
    }
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [superview addSubview:scrollView];
    return scrollView;
}
@end

@implementation UIBarButtonItem(MyTools)
+ (UIBarButtonItem *)leftBarButtonItemWithImage:(UIImage *)image
                                    highlighted:(UIImage *)highlightedImage
                                         target:(id)target
                                       selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 30, 30);
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = NO;
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)rightBarButtonItemWithImage:(UIImage *)image
                                     highlighted:(UIImage *)highlightedImage
                                          target:(id)target
                                        selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 30, 30);
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = NO;
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)leftBarButtonItemWithTitle:(NSString *)title
                                          target:(id)target
                                        selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 40, 40);
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)rightBarButtonItemWithTitle:(NSString *)title
                                          target:(id)target
                                        selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 40, 40);
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end
