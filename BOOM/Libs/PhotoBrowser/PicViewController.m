////
////  PicViewController.m
////  SP2P_7
////
////  Created by eims1 on 16/1/27.
////  Copyright (c) 2016年 EIMS. All rights reserved.
////
//
//#import "PicViewController.h"
//#import "PhotoBrowseViewController.h"
//#import <ImageIO/ImageIO.h>
//
//#define  YUSHU  (NSInteger)(_dataArray.count%2)?1:0;
//#define  SCRO_TAG  111
//
//@interface PicViewController ()<HTTPClientDelegate>
//{
//    
//    NSArray *titleArr;
//    
//}
//@property(nonatomic ,strong) NSMutableArray *dataArray;
//@property(nonatomic ,strong) UITableView *listView;
//
//@property(nonatomic ,strong) NetWorkClient *requestClient;
//
//@end
//
//@implementation PicViewController
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
////    UIScrollView *s = (UIScrollView *)[self.view viewWithTag:SCRO_TAG];
////    DLOG(@"s.frame x = %f  y = %f",s.frame.origin.x,s.frame.origin.y);
//    
//}
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    // 初始化数据
//    
//    [self initNavigationBar];
//
//    [self initData];
//    
//    // 初始化视图
////    [self initView];
//    
//    [self requestData];
//    
//}
//
///**
// * 初始化数据
// */
//- (void)initData
//{
//    
//    _dataArray = [[NSMutableArray alloc] init];
//    
//}
//
//
///**
// 初始化数据
// */
//- (void)initView
//{
//    
//
//    NSInteger picW = (MSWIDTH-15)/2;
//    NSInteger picH = (MSHEIGHT-200)/2;
//    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, MSWIDTH, MSHEIGHT-64)];
//    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.showsVerticalScrollIndicator = YES;
//    scrollView.backgroundColor = KblackgroundColor;//[UIColor redColor];
////    scrollView.backgroundColor = [UIColor redColor];
//    scrollView.tag = SCRO_TAG;
//
//    NSInteger t  = _dataArray.count%2?1:0;
//    DLOG(@"t = %d",t);
//    
//    if (t == 1) {
//        scrollView.contentSize = CGSizeMake(MSWIDTH, (_dataArray.count/2+1)*picH);
//
//    }else if (t == 0)
//    {
//        scrollView.contentSize = CGSizeMake(MSWIDTH, (_dataArray.count/2)*picH);
//
//    }
//    
//    
////    scrollView.contentSize = CGSizeMake(MSWIDTH, _dataArray.count*MSHEIGHT);
//
//    [self.view addSubview:scrollView];
//
//    for (int i = 0; i<[_dataArray count]; i++) {
//        
//            UIImageView *imgView = [[UIImageView alloc] init];
//            imgView.frame = CGRectMake(5+(picW+5)*(i%2), picH*(i/2), picW, picH);
////                    imgView.frame = CGRectMake(5+(picW+5)*(i%2), 64+MSHEIGHT*(i), picW, picH);
//            imgView.tag = 10+i;
//            imgView.userInteractionEnabled = YES;
//            imgView.contentMode = UIViewContentModeScaleAspectFit;
//            
//            //        CGSize size = [self getImageSizeWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Baseurl,[_dataArray[i][0] objectForKey:@"path"]]]];
//            
//            //        imgView.frame = CGRectMake(5+(picW+5)*(i%2), picH*(i/2), size.width, size.height);
//            //        DLOG(@"s.frame x = %f  y = %f",scrollView.frame.origin.x,scrollView.frame.origin.y);
//        if ([_dataArray[i] objectForKey:@"path"]) {
//            [imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Baseurl,[_dataArray[i] objectForKey:@"path"]]]];
//        }else
//        {
//            //加载旧图片
//            if ([[_dataArray[i] objectForKey:@"is_visible"] integerValue] == 1) {
//                //可见
//                if ([[_dataArray[i] objectForKey:@"image_file_name"] containsString:@"/sp2p_ytr"]) {
//                    NSMutableString *image_file_name = [_dataArray[i] objectForKey:@"image_file_name"];
//                    NSString *subStr = [image_file_name substringFromIndex:9];
//                    DLOG(@"subStr = %@",subStr);
//                    [imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Baseurl,subStr]]];
//
//                }else
//                {
//                    [imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",Baseurl,[_dataArray[i] objectForKey:@"image_file_name"]]]];
//
//                }
//
//            }else
//            {
////                imgView.image = [UIImage imageNamed:@"news_image_default"];
//                imgView.image = [UIImage imageNamed:@"yyyyynews_image_default"];
//
//                //不可见
//                UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(0, picH/2-20, picW, 40)];
//                lbl2.backgroundColor = [UIColor clearColor];
//                lbl2.textAlignment = NSTextAlignmentCenter;
//                lbl2.textColor = [ColorTools colorWithHexString:@"#666666"];
//                lbl2.font = [UIFont systemFontOfSize:20];
//                lbl2.text = @"图片不可见";
//                [imgView addSubview:lbl2];
//            }
//        }
//        
//            [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)]];
//            
//            [scrollView addSubview:imgView];
//            
//            //        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, size.height-20, picW, 20)];
//            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, picH-20, picW, 20)];
//            lbl.backgroundColor = [UIColor clearColor];
//            lbl.textAlignment = NSTextAlignmentCenter;
//            if ([_dataArray[i] objectForKey:@"description"]){
//                lbl.text = [NSString stringWithFormat:@"%@",[_dataArray[i] objectForKey:@"description"]];
//            }
//            lbl.textColor = [ColorTools colorWithHexString:@"#666666"];
//            lbl.font = [UIFont systemFontOfSize:14];
//            lbl.adjustsFontSizeToFitWidth = YES;
//            [imgView addSubview:lbl];
//
//        
//    }
//    
//}
//
//- (CGSize)getImageSizeWithURL:(NSURL *)url
//{
//    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
//    CGFloat width = 0.0f, height = 0.0f;
//    
//    if (imageSource)
//    {
//        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL);
//        
//        if (imageProperties != NULL)
//        {
//            CFNumberRef widthNum  = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
//            if (widthNum != NULL) {
//                
//                NSNumber *widNum = (__bridge NSNumber *)widthNum;
//                width = [widNum integerValue];
////                CFNumberGetValue(widthNum, kCFNumberFloatType, &width);
//            }
//            
//            CFNumberRef heightNum = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
//            if (heightNum != NULL) {
//                NSNumber *higNum = (__bridge NSNumber *)heightNum;
//                height = [higNum integerValue];
////                CFNumberGetValue(heightNum, kCFNumberFloatType, &height);
//
//            }
//            
//            CFRelease(imageProperties);
//        }
//        CFRelease(imageSource);
//        NSLog(@"Image dimensions: %.0f x %.0f px", width, height);
//    }
//    return CGSizeMake(width, height);
//
//}
//
//
///**
// * 初始化导航条
// */
//- (void)initNavigationBar
//{
//    self.view.backgroundColor = [UIColor blackColor];
//    //    self.view.backgroundColor = KblackgroundColor;
//
//    self.title = @"审核资料";
//    [self.navigationController.navigationBar setBarTintColor:KColor];
//    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//                                                                      [UIColor whiteColor], NSForegroundColorAttributeName,
//                                                                      [UIFont fontWithName:@"Arial-BoldMT" size:18.0], NSFontAttributeName, nil]];
//    
//    // 导航条返回按钮
//    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
//    backItem.tintColor = [UIColor whiteColor];
//    [self.navigationItem setLeftBarButtonItem:backItem];
//}
//
//
//#pragma mark -
//-(void)requestData
//{
//    
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    //借款投标记录
//    [parameters setObject:@"196" forKey:@"OPT"];
//    [parameters setObject:@"" forKey:@"body"];
//    [parameters setObject:self.bidId forKey:@"bidId"];
//
//    if (_requestClient == nil) {
//        _requestClient = [[NetWorkClient alloc] init];
//        _requestClient.delegate = self;
//        
//    }
//    [_requestClient requestGet:@"app/services" withParameters:parameters];
//}
//
//
//// 返回成功
//-(void) httpResponseSuccess:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didSuccessWithObject:(id)obj
//{
//    DLOG(@"pic==返回成功=======%@",obj);
//    NSDictionary *dics = obj;
//    
//    if ([[NSString stringWithFormat:@"%@",[dics objectForKey:@"error"]] isEqualToString:@"-1"]) {
//        
//        NSDictionary *dicKey = [dics objectForKey:@"images"];
//        NSArray *keyArray = [dicKey allKeys];
////        DLOG(@"[dicKey allKeys] = %@",[dicKey allKeys]);
//        
//        if (keyArray.count != 0)
//        {
//            
//            for (NSString *key in keyArray)
//            {
//                
//                if ([[dics objectForKey:@"images"] objectForKey:key])
//                {
//                    NSArray *tempImgArray = [[dics objectForKey:@"images"] objectForKey:key];
//                    for (NSDictionary *dic in tempImgArray) {
//                        [_dataArray addObject:dic];
//                    }
//                }
//          
//            }
////            DLOG(@"_dataArray = %@",_dataArray);
//            
//            
//
//        }
//        
//        if([[dics objectForKey:@"uItems"] count] !=0)
//        {
//            //有旧资料图片
//            NSArray *uItemsArray = [dics objectForKey:@"uItems"];
//            for (NSDictionary *uItemDic in uItemsArray) {
//                [_dataArray addObject:uItemDic];
//            }
//            
//            
//        }
//        
//        if (_dataArray .count != 0) {
//            [self initView];
//
//        }
//        else
//        {
//            //无图片
//            [SVProgressHUD showErrorWithStatus:@"暂无该信息"];
//            
//        }
//        
//
//    }else if ([[NSString stringWithFormat:@"%@",[dics objectForKey:@"error"]] isEqualToString:@"-2"]) {
//        
//        [ReLogin outTheTimeRelogin:self];
//        
//    }else {
//        
//        DLOG(@"返回失败===========%@",[obj objectForKey:@"msg"]);
//        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@", [obj objectForKey:@"msg"]]];
//    }
//    
//}
//
//// 返回失败
//-(void) httpResponseFailure:(NetWorkClient *)client dataTask:(NSURLSessionDataTask *)task didFailWithError:(NSError *)error
//{
//    // 服务器返回数据异常
//    //    [SVProgressHUD showErrorWithStatus:@"网络异常"];
//    
//}
//
//// 无可用的网络
//-(void) networkError
//{
//    [SVProgressHUD showErrorWithStatus:@"无可用网络"];
//}
//
//
//
//
//
//
//
//#pragma mark -  点击图片查看
//- (void)dealTap:(UITapGestureRecognizer *)tap
//{
//    [self performSelector:@selector(changeScrollViewFrame) withObject:nil afterDelay:1.0];
//
//    PhotoBrowseViewController *showVC = [[PhotoBrowseViewController alloc]initWithimageArray:_dataArray withIndex:tap.view.tag-10 withType:1];
//    showVC.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
//    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:showVC];
//    [self presentViewController:nav animated:YES completion:nil];
//
////    [self.navigationController presentViewController:showVC animated:YES completion:nil];
//    
//  
//    
//}
//- (void)changeScrollViewFrame
//{
//    UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:SCRO_TAG];
//    scrollView.backgroundColor = KblackgroundColor;//[UIColor redColor];
//    //    scrollView.backgroundColor = [UIColor redColor];
//    scrollView.frame = CGRectMake(0, 0, MSWIDTH, MSHEIGHT);
//    
//}
//
//#pragma mark - 返回按钮触发方法
//- (void)backClick
//{
//    // DLOG(@"返回按钮");
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}
//
//#pragma mark -
//-(void) viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    if (_requestClient != nil) {
//        [_requestClient cancel];
//    }
//}
//
//@end
