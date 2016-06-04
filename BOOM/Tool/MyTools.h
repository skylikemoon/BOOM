//
//  MyTools.h
//  SP2P_6.1
//
//  Created by wujiandong on 15/11/13.
//  Copyright (c) 2015年 EIMS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTools : NSObject
#define KDefaultImage   [UIImage imageNamed:@"news_image_default"]

/**
 *  格式化数字以万为单位
 *
 *  @param number 需要格式化的数字
 *  @param decimalLength 格式化后保留几位小数,默认两位,最多四位
 *
 *  @return 格式化后的数字
 */
+ (NSString *)formatNumberToTenThousandUnitWith:(double)number decimalLength:(NSInteger)decimalLength;

+ (NSString*)strmethodComma:(NSString*)string;

// 获取指定最大宽度、最大高度、字体大小的string的size
+ (CGSize)getSizeOfString:(NSString *)string
                 maxWidth:(float)width
                maxHeight:(float)height
             withFontSize:(CGFloat)fontSize;
/**
 *  获取指定最大宽度、最大高度、字体大小的string的size
 *
 *  @param string   计算的文字
 *  @param width    最大宽度
 *  @param height   最大高度
 *  @param font     自定义字体
 *
 *  @return size
 */
+ (CGSize)getTypeFaceSizeOfString:(NSString *)string
                         maxWidth:(float)width
                        maxHeight:(float)height
                         withFont:(UIFont *)font;
//返回button
+ (UIButton *)leftBarButton;

/**
 *  TextField左视图
 *
 *  @param imageFrame leftImage-->size
 *
 *  @return view
 */
+ (UIView *)textFieldLeftViewWithImageSize:(CGSize)imageSize
                                 imageName:(NSString *)imageName;

/**
 *  简单的富文本
 *
 *  @param text      需要处理的字符串
 *  @param textStart 富文本开始的位置
 *  @param textEnd   富文本结束的位置
 *  @param textColor 富文本颜色
 *  @param textFont  富文本字体
 *
 *  @return 处理后的富文本
 */
+ (NSMutableAttributedString *)getNSMutableAttributedStringWithText:(NSString *)text
                                                              start:(NSInteger)textStart
                                                                end:(NSInteger)textEnd
                                                          textColor:(UIColor *)textColor
                                                           textFont:(UIFont *)textFont;
/**
 *  处理时间格式（如：x天x时x分x秒）的富文本
 *
 *  @param text      需要处理的字符串
 *  @param textColor 富文本颜色
 *  @param textFont  富文本字体
 *
 *  @return 处理后的富文本
 */
+ (NSMutableAttributedString *)getTimeNSMutableAttributedStringWithText:(NSString *)text
                                                          textColor:(UIColor *)textColor
                                                           textFont:(UIFont *)textFont;

@end

@interface UILabel (MyTools)
+ (id)labelWithFrame:(CGRect)frame
                text:(NSString *)text
           textColor:(UIColor *)textColor
            textFont:(float)textFont
            fitWidth:(BOOL)fitWidth
           superview:(id)superview;

@end

@interface UIImageView (MyTools)
+ (id)imageViewWithFrame:(CGRect)frame
               imageFile:(NSString *)imageFile
               superview:(id)superview;

@end

@interface UIView (MyTools)
+ (id)viewWithFrame:(CGRect)frame
    backgroundColor:(UIColor *)backgroundColor
          superview:(id)superview;

@end

@interface UIButton (MyTools)
+ (id)buttonWithFrame:(CGRect)frame
      backgroundColor:(UIColor *)backgroundColor
                title:(NSString *)title
           titleColor:(UIColor *)titleColor
            titleFont:(CGFloat)titleFont
               target:(id)target
               action:(SEL)action
            superview:(id)superview;

@end

@interface UITextField (MyTools)
+ (id)textFieldWithFrame:(CGRect)frame
                delegate:(id)delegate
                    text:(NSString *)text
               textColor:(UIColor *)textColor
                textFont:(float)textFont
             placeholder:(NSString *)placeholder
               superview:(id)superview;

@end

@interface UITableView (MyTools)
+ (id)tableViewWithFrmae:(CGRect)frame
         backgroundColor:(UIColor *)backgroundColor
                delegate:(id)delegate
              dataSource:(id)dataSource
          tableViewStyle:(UITableViewStyle)tableViewStyle
          separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
               superview:(id)superview;
@end

@interface UIScrollView (MyTools)
+ (id)scrollViewWithFrame:(CGRect)frame
                 delegate:(id)delegate
          backgroundColor:(UIColor *)backgroundColor
                superview:(id)superview;


@end

@interface UIBarButtonItem(MyTools)

+ (UIBarButtonItem *)leftBarButtonItemWithImage:(UIImage *)image
                                    highlighted:(UIImage *)highlightedImage
                                         target:(id)target
                                       selector:(SEL)selector;

+ (UIBarButtonItem *)rightBarButtonItemWithImage:(UIImage *)image
                                     highlighted:(UIImage *)highlightedImage
                                          target:(id)target
                                        selector:(SEL)selector;

+ (UIBarButtonItem *) leftBarButtonItemWithTitle:(NSString *)title
                                          target:(id)target
                                        selector:(SEL)selector;

+ (UIBarButtonItem *)rightBarButtonItemWithTitle:(NSString *)title
                                          target:(id)target
                                        selector:(SEL)selector;

@end
