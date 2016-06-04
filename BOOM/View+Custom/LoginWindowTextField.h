//
//  LoginWindowTextField.h


#import <UIKit/UIKit.h>

@interface LoginWindowTextField : UIView
@property (nonatomic, copy) NSString *placeName;
@property (nonatomic, strong) UIImageView *leftImage;
@property (nonatomic, strong) UITextField *contentText;
@property (nonatomic, strong) UIButton *rightImage;

- (UIView *)textWithleftImage:(NSString *)leftIcon rightImage:(NSString *)rightIcon placeName:(NSString *)placeName;
- (UIView *)textWithFrame:(CGRect)frame leftImage:(NSString *)leftIcon rightImage:(NSString *)rightIcon placeName:(NSString *)placeName;

@end
