//
//  PhotoBrowseViewController.h
//  12345
//
//  Created by tidoo on 14-3-21.
//  Copyright (c) 2014年 Dicky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoBrowseViewController : UIViewController

//自定义的初始化方法
//-(id)initWithimageArray:(NSMutableArray *)imageArray withIndex:(int)index withCourseID:(NSString *)ID withTag:(NSInteger)_tag;

//查看本地大图
- (id)initWithLocalImage:(UIImage *)image;


/**
 *  查看网络大图
 *
 *  @param imageArray 数据源，字典形式，图片键为icon
 *  @param index      从第几张开始显示
 *  @param type       1.有下载
 *
 *  @return self
 */
-(id)initWithimageArray:(NSMutableArray *)imageArray withIndex:(NSInteger)index withType:(NSInteger)type;

@end
