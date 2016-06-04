//
//  JDControls.h
//  Controls
//
//  Created by Dicky on 15/10/15.
//  Copyright (c) 2015年 Dicky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UILabel (JDControls)
+ (id)labelWithFrame:(CGRect)frame
               text:(NSString *)text
          textColor:(UIColor *)textColor
           textFont:(float)textFont
           fitWidth:(BOOL)fitWidth
          superview:(id)superview;

@end

@interface UIImageView (JDControls)
+ (id)imageViewWithFrame:(CGRect)frame
              imageFile:(NSString *)imageFile
              superview:(id)superview;

@end

@interface UIView (JDControls)
+ (id)viewWithFrame:(CGRect)frame
   backgroundColor:(UIColor *)backgroundColor
         superview:(id)superview;

@end

@interface UIButton (JDControls)
+ (id)buttonWithFrame:(CGRect)frame
           backgroundColor:(UIColor *)backgroundColor
                     title:(NSString *)title
                titleColor:(UIColor *)titleColor
                 titleFont:(CGFloat)titleFont
                    target:(id)target
                    action:(SEL)action
                 superview:(id)superview;

@end

@interface UITextField (JDControls)
+ (id)textFieldWithFrame:(CGRect)frame
                delegate:(id)delegate
                    text:(NSString *)text
               textColor:(UIColor *)textColor
                textFont:(float)textFont
             placeholder:(NSString *)placeholder
               superview:(id)superview;

@end

@interface UITableView (JDControls)
+ (id)tableViewWithFrmae:(CGRect)frame
         backgroundColor:(UIColor *)backgroundColor
                delegate:(id)delegate
              dataSource:(id)dataSource
          tableViewStyle:(UITableViewStyle)tableViewStyle
          separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
               superview:(id)superview;
@end

@interface UIScrollView (JDControls)
+ (id)scrollViewWithFrame:(CGRect)frame
                 delegate:(id)delegate
          backgroundColor:(UIColor *)backgroundColor
                superview:(id)superview;

@end
