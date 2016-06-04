//
//  ClickButton.m
//  P2P
//
//  Created by Cindy on 15/12/18.
//  Copyright (c) 2015年 EIMS. All rights reserved.
//

#import "ClickButton.h"
#import "ColorImages.h"

@implementation ClickButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        self.layer.cornerRadius = 3;
        [self.layer setMasksToBounds:YES];
        
        self.backgroundColor = [UIColor clearColor];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        
        UIImage *image = [ColorImages imageWithColor:KRedColor];
        UIImage *highlightedImage = [ColorImages imageWithColor:[ColorTools colorWithHexString:@"#CA3E3E"]];
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
        [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
        
        
    }
    return self;
}

- (void)setBackColor:(UIColor *)color HighlightColor:(UIColor *)highlightColor
{
    UIImage *image = [ColorImages imageWithColor:color];
    UIImage *highlightedImage = [ColorImages imageWithColor:highlightColor];
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
    [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
}

@end
