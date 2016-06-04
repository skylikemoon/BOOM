//
//  JDControls.m
//  Controls
//
//  Created by Dicky on 15/10/15.
//  Copyright (c) 2015年 Dicky. All rights reserved.
//

#import "JDControls.h"

#pragma mark ----- UILabel
@implementation UILabel (JDControls)
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
@implementation UIImageView (JDControls)
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
@implementation UIButton (JDControls)
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
@implementation UITextField (JDControls)
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
@implementation UITableView (JDControls)
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
@implementation UIScrollView (JDControls)
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