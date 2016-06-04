//
//  UIViewController+NavBar.m
//  SP2P
//
//  Created by mac on 16/1/13.
//  Copyright © 2016年 EIMS. All rights reserved.
//

#import "UIViewController+NavBar.h"

@implementation UIViewController (NavBar)

- (void)initNavBarTitle:(NSString *)titleName andLeftItemImageName:(NSString *)leftItemImageName andRightItemImageName:(NSString *)rightItemImageName
{
//    if(IOS_7)
//    {
//        self.automaticallyAdjustsScrollViewInsets=NO;
//    }
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(backNotification:)
//                                                 name:kMSStartBackNotification
//                                               object:@"Back"];
    if (![leftItemImageName isEqualToString:@""]) {
        UIBarButtonItem* leftButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:leftItemImageName] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        [leftButtonItem setTintColor:[UIColor blackColor]];
        self.navigationItem.leftBarButtonItem = leftButtonItem;
    }
    if (![rightItemImageName isEqualToString:@""]) {
        UIBarButtonItem* rightButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:rightItemImageName] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonClick)];
        [rightButtonItem setTintColor:[UIColor blackColor]];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
    }
    
    
    UILabel *navigationTitleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    navigationTitleLabel.text=titleName;
    navigationTitleLabel.textAlignment=NSTextAlignmentCenter;
    navigationTitleLabel.textColor=FONTCOLOR_LIGHTBLACK;
    self.navigationItem.titleView=navigationTitleLabel;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18.0f],NSFontAttributeName, nil]];
}

- (void)initNavBarTitle:(NSString *)titleName andLeftItemImageName:(NSString *)leftItemImageName andRightItemName:(NSString *)rightItemName
{
    if (![leftItemImageName isEqualToString:@""]) {
        UIBarButtonItem* leftButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:leftItemImageName] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        [leftButtonItem setTintColor:[UIColor blackColor]];
        self.navigationItem.leftBarButtonItem = leftButtonItem;
    }
    if (![rightItemName isEqualToString:@""]) {
        UIBarButtonItem* rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:rightItemName style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
        [rightButtonItem setTintColor:FONTCOLOR_LIGHTBLACK];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
    }

    UILabel *navigationTitleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    navigationTitleLabel.text=titleName;
    navigationTitleLabel.textAlignment=NSTextAlignmentCenter;
    navigationTitleLabel.textColor=FONTCOLOR_LIGHTBLACK;
    self.navigationItem.titleView=navigationTitleLabel;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18.0f],NSFontAttributeName, nil]];
}

- (void)initNavBarTitle:(NSString *)titleName andLeftItemName:(NSString *)leftItemName andRightItemName:(NSString *)rightItemName
{
    if (![leftItemName isEqualToString:@""]) {
        UIBarButtonItem* leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:leftItemName style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        [leftButtonItem setTintColor:[UIColor blackColor]];
        self.navigationItem.leftBarButtonItem = leftButtonItem;
    }
    if (![rightItemName isEqualToString:@""]) {
        UIBarButtonItem* rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:rightItemName style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick)];
        [rightButtonItem setTintColor:FONTCOLOR_LIGHTBLACK];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
    }
    
    UILabel *navigationTitleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    navigationTitleLabel.text=titleName;
    navigationTitleLabel.textAlignment=NSTextAlignmentCenter;
    navigationTitleLabel.textColor=FONTCOLOR_LIGHTBLACK;
    self.navigationItem.titleView=navigationTitleLabel;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18.0f],NSFontAttributeName, nil]];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonClick
{
    
}

@end
