//
//  UserInfoView.m
//  LX-UI模板
//
//  Created by eims1 on 15/11/3.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import "UserInfoView.h"


@interface UserInfoView()

//UI控件
@property (nonatomic,retain) UIImageView    *userImage;
@property (nonatomic,retain) UILabel        *nameLabel;
@property (nonatomic,retain) UILabel        *addressLabel;
@property (nonatomic,retain) UILabel        *infoLabel;
@property (nonatomic,retain) UILabel        *countLabel;
//@property (nonatomic,retain) RectButton     *attButton;
//@property (nonatomic,retain) RectButton     *fansButton;
@property (nonatomic,retain) UIButton       *profileButton;
@property (nonatomic,retain) UIButton       *moreButton;

//数据成员
//@property (nonatomic,copy) NSString *imgString;
@property (nonatomic,copy) NSString *nameString;
@property (nonatomic,copy) NSString *addrString;
@property (nonatomic,copy) NSString *infoString;
@property (nonatomic,copy) NSString *countString;
//@property (nonatomic,copy) NSString *attString;
//@property (nonatomic,copy) NSString *fansString;

@end

@implementation UserInfoView

- (id)init
{
    CGRect frameRect = CGRectMake(0, 0, 320, 200);
    self = [self initWithFrame:frameRect];
    if (self)
    {
        NSLog(@"Init called");
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _userImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_userImage];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_nameLabel];
        
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_addressLabel];
        
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_infoLabel];
        
//        _attButton = [[RectButton alloc] initWithFrame:CGRectZero];
//        [self addSubview:_attButton];
//        
//        _fansButton = [[RectButton alloc] initWithFrame:CGRectZero];
//        [self addSubview:_fansButton];
        
        _profileButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [self addSubview:_profileButton];
        
        _moreButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [self addSubview:_moreButton];
        
        _countLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_countLabel];
    }
    return self;
}

- (void)setParam:(NSDictionary *)param
{
    _param = param;
    
    _nameString = [_param objectForKey:@"Name"];
    _addrString = [_param objectForKey:@"Address"];
    _infoString = [_param objectForKey:@"Infomation"];
    _countString = [_param objectForKey:@"Count"];
    
    [self loadData];
}

- (void)layoutSubviews
{
    _userImage.frame = CGRectMake(20, 20, 80, 80);
    _userImage.backgroundColor = [UIColor yellowColor];
    
    _nameLabel.frame = CGRectMake(120, 20, 180, 20);
    _nameLabel.backgroundColor = [UIColor yellowColor];
    
    _addressLabel.frame = CGRectMake(120, 50, 180, 20);
    _addressLabel.backgroundColor = [UIColor yellowColor];
    
    _infoLabel.frame = CGRectMake(120, 80, 180, 20);
    _infoLabel.backgroundColor = [UIColor yellowColor];
    
//    _attButton.frame = CGRectMake(20, 110, 60, 60);
//    _attButton.backgroundColor = [UIColor greenColor];
//    
//    _fansButton.frame = CGRectMake(93, 110, 60, 60);
//    _fansButton.backgroundColor = [UIColor greenColor];
    
    _profileButton.frame = CGRectMake(167, 110, 60, 60);
    _profileButton.backgroundColor = [UIColor greenColor];
    
    _moreButton.frame = CGRectMake(240, 110, 60, 60);
    _moreButton.backgroundColor = [UIColor greenColor];
    
    _countLabel.frame = CGRectMake(20, 180, 280, 15);
    _countLabel.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
}

- (void)loadData
{
    if (self.nameString.length != 0)
    {
        _nameLabel.text = self.nameString;
    }
    if (self.addrString.length != 0)
    {
        _addressLabel.text = self.addrString;
    }
    if (self.infoString.length != 0)
    {
        _infoLabel.text = self.infoString;
    }
    if (self.countString.length != 0)
    {
        _countLabel.text = self.countString;
    }
}

@end
