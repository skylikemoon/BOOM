//
//  PhotoBrowseViewController.m
//  12345
//
//  Created by tidoo on 14-3-21.
//  Copyright (c) 2014年 Dicky. All rights reserved.
//

#import "PhotoBrowseViewController.h"
#import "SmilaScroview.h"
#import "JDControls.h"

#define KIMAGEVIEWTAG   200
#define KDefaultImage   [UIImage imageNamed:@"news_image_default"]
#define KYYYDefaultImage   [UIImage imageNamed:@"yyyyyynews_image_default"]

@interface PhotoBrowseViewController ()<UIActionSheetDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    NSInteger _imageIndex;
    UIScrollView *_mainSrcrollView;
    
    NSString  *content;
    NSInteger _type;
    
    NSInteger saveIndex;
    
    UIImage *_localImage;
    UIImageView *_localImageView;
    
    UILabel *_indexLabel;
    
}
@property(nonatomic,retain)NSMutableArray *imageArray;
@end

@implementation PhotoBrowseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithLocalImage:(UIImage *)image
{
    self=[super init];
    if(self)
    {
        _localImage = image;
    }
    return self;
}

-(id)initWithimageArray:(NSMutableArray *)imageArray withIndex:(NSInteger)index withType:(NSInteger)type
{
    self=[super init];
    if(self)
    {
        self.imageArray=[NSMutableArray arrayWithArray:imageArray];
        _imageIndex = index;
        _type = type;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    if (iOS7) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }
    if (_type == 1) {
        self.title = [NSString stringWithFormat:@"%ld of %lu",(long)_imageIndex+1,(unsigned long)self.imageArray.count];
    }else {
        self.title = @"查看大图";
    }

    [self.navigationController.navigationBar setBarTintColor:SETCOLOR(25, 26, 26, 1.0)];
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,
                                                                      
                                                                      [UIFont boldSystemFontOfSize:15.0], NSFontAttributeName, nil]];
    // 取消按钮
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
    cancelItem.tintColor = [UIColor whiteColor];
    [self.navigationItem setRightBarButtonItem:cancelItem];
    
    
    if (_localImage == nil)  //查看网络
    {
        _mainSrcrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, MSWIDTH, MSHEIGHT - 64 - 20 - 70)];
        _mainSrcrollView.contentSize=CGSizeMake(_imageArray.count*MSWIDTH, 0);
        _mainSrcrollView.contentOffset=CGPointMake(_imageIndex*MSWIDTH, 0);//设置默认的显示
        _mainSrcrollView.pagingEnabled=YES;
        _mainSrcrollView.scrollEnabled=YES;
        _mainSrcrollView.showsHorizontalScrollIndicator=NO;
        _mainSrcrollView.showsVerticalScrollIndicator=NO;
        _mainSrcrollView.delegate=self;
        [self.view addSubview:_mainSrcrollView];
        
        [self initImageViewsInScrollView];//添加图片视图
        
        if (_type == 1) {
            UIView *bottomView = [UIView viewWithFrame:CGRectMake(0, MSHEIGHT - 64 - 70, MSWIDTH, 70) backgroundColor:SETCOLOR(25, 26, 26, 1.0) superview:self.view];
            
            double indexHeight = bottomView.frame.size.height/2;
            _indexLabel = [UILabel labelWithFrame:CGRectMake(10, (indexHeight - 20)/2, MSWIDTH - 20, 20) text:[NSString stringWithFormat:@"第%ld张",(long)_imageIndex+1] textColor:[UIColor whiteColor] textFont:13.0 fitWidth:NO superview:bottomView];
            _indexLabel.textAlignment = NSTextAlignmentCenter;
            _indexLabel.font = [UIFont boldSystemFontOfSize:13.0f];
            
            [UIView viewWithFrame:CGRectMake(0, indexHeight, MSWIDTH, 1) backgroundColor:SETCOLOR(32, 32, 32, 1.0) superview:bottomView];
            
            UIButton *saveButton = [UIButton buttonWithFrame:CGRectMake(MSWIDTH - 60, indexHeight, 60, bottomView.frame.size.height - indexHeight) backgroundColor:nil title:nil titleColor:nil titleFont:0 target:self action:@selector(savePhotoButtonClick) superview:bottomView];
            [saveButton setImage:[UIImage imageNamed:@"investDetail_SavePhoto"] forState:UIControlStateNormal];
        }
        
        
    }else {         //查看本地图片
        _localImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MSWIDTH, MSHEIGHT)];
        _localImageView.backgroundColor = [UIColor clearColor];
        _localImageView.image = _localImage;
        _localImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:_localImageView];
        _localImageView.userInteractionEnabled = YES;
        [_localImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)]];

//        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(dealPinch:)];
//        [_localImageView addGestureRecognizer:pinch];
//        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dealPan:)];
//        [_localImageView addGestureRecognizer:pan];
//        
//        UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(dealRotation:)];
//        [_localImageView addGestureRecognizer:rotation];
    }
    
}



//添加图片视图
-(void)initImageViewsInScrollView
{
    for (int i=0; i<_imageArray.count; i++)
    {
        NSDictionary *dic = [_imageArray objectAtIndex:i];
        DLOG(@"dic  = %@",dic);
        
        SmilaScroview * smil = [[SmilaScroview alloc] initWithFrame:CGRectMake(i*MSWIDTH, 0, MSWIDTH, _mainSrcrollView.frame.size.height-40)];

        __weak UIActivityIndicatorView *weakS = smil.activityView;
        
        [weakS startAnimating];
        
        NSString *imgUrl;
        
        if ([dic objectForKey:@"path"]) {
            imgUrl = [NSString stringWithFormat:@"%@%@",Baseurl,[dic objectForKey:@"path"]];
        }else
        {
            if ([[dic objectForKey:@"is_visible"] integerValue] == 1) {
                
                if ([[dic objectForKey:@"image_file_name"] containsString:@"/sp2p_ytr"]) {
                    NSMutableString *image_file_name = [dic objectForKey:@"image_file_name"];
                    NSString *subStr = [image_file_name substringFromIndex:9];
                    DLOG(@"subStr = %@",subStr);
                    imgUrl = [NSString stringWithFormat:@"%@%@",Baseurl,subStr];
                    
                }else
                {
                    imgUrl = [NSString stringWithFormat:@"%@%@",Baseurl,[dic objectForKey:@"image_file_name"]];
                    
                }
                

            }else
            {
                imgUrl =  @"ssehwef";
            }

        }

        [smil.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:KYYYDefaultImage options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType,NSURL *imageURL)
         {
            [weakS stopAnimating];
            if (error)
            {
                return ;
            }
        }];
        
        smil.imageView .contentMode = UIViewContentModeScaleAspectFit;
        [_mainSrcrollView addSubview:smil];
        smil.tag = 100 + i ;
        
        smil.imageView.tag = KIMAGEVIEWTAG + i;

        //点击返回手势
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backClick)];
        tapGesture.numberOfTapsRequired=1;
        [smil.imageView addGestureRecognizer:tapGesture];
        /*
        //常按下载图片
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(dealDownload:)];
        [smil.imageView addGestureRecognizer:longPress];
        */
    }
}

- (void)savePhotoButtonClick {
    
    saveIndex = _imageIndex;
    
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil  otherButtonTitles:@"保存到手机",nil];
    sheet.tag = 16;
    [sheet showInView:self.view];
}

- (void)dealDownload:(UILongPressGestureRecognizer *)press
{
    saveIndex = press.view.tag - KIMAGEVIEWTAG;
    
    if (press.state == UIGestureRecognizerStateBegan)
    {
        UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil  otherButtonTitles:@"保存到手机",nil];
        sheet.tag = 16;
        [sheet showInView:self.view];
    }
}

//返回按钮和点击手势关联的方法
-(void)backClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

}

//弹出的提示---关联的方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 16)
    {
        if (buttonIndex == 0)
        {
            [self saveImageToMobile];
        }
        else
        {
            return;
        }
    }
}

//保存照片到手机
- (void)saveImageToMobile
{
    NSDictionary *dic = [_imageArray objectAtIndex:saveIndex];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"icon"]] placeholderImage:KDefaultImage];
    UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error == nil) {
        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
    }else {
        [SVProgressHUD showErrorWithStatus:@"保存失败,请重试"];
    }
}

-(void)dealRotation:(UIRotationGestureRecognizer *)rotation
{
    //rotation表示旋转的角度
    //NSLog(@"%f",rotation.rotation);
    _localImageView.transform = CGAffineTransformMakeRotation(rotation.rotation);
    
}

-(void)dealPan:(UIPanGestureRecognizer *)pan
{
    //获取拖移的位置
    //屏幕上的位置
    CGPoint screenPoint = [pan locationInView:self.view];
    //相对自己的位置
    //CGPoint selfPoint = [pan locationInView:pan.view];
    
    _localImageView.center = screenPoint;
}

- (void)dealTap
{
    [self backClick];
}

//捏合手势
-(void)dealPinch:(UIPinchGestureRecognizer *)pinch
{
    //获取缩放比例 pinch.scale
    //  设置一个用于缩放的放射变换的对象
    //  实现了缩放的效果
    _localImageView.transform = CGAffineTransformMakeScale(pinch.scale, pinch.scale);
}

static float startContentOffsetX = 0;
static float willEndContentOffsetX = 0;
static float endContentOffsetX = 0;
#pragma mark----UIScrollView--的代理实现
//拖动前的起始坐标
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    startContentOffsetX = scrollView.contentOffset.x;
}
//将要停止前的坐标
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    willEndContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    endContentOffsetX = scrollView.contentOffset.x;
    if (endContentOffsetX < willEndContentOffsetX && willEndContentOffsetX < startContentOffsetX) {
        //画面从右往左移动，前一页
        _imageIndex--;
    }else if (endContentOffsetX > willEndContentOffsetX && willEndContentOffsetX > startContentOffsetX) {
        //画面从左往右移动，后一页
        _imageIndex++;
    }
    
    if (_type == 1) {
        self.title = [NSString stringWithFormat:@"%ld of %lu",(long)_imageIndex+1,(unsigned long)self.imageArray.count];
        _indexLabel.text = [NSString stringWithFormat:@"第%ld张",(long)_imageIndex+1];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_mainSrcrollView)
    {
        int page = (_mainSrcrollView.contentOffset.x + _mainSrcrollView.bounds.size.width/2 ) / _mainSrcrollView.bounds.size.width ;
        
        SmilaScroview * smi = (SmilaScroview *)[_mainSrcrollView viewWithTag:100 + page -1];
        if (smi) {
            [smi setZoomScale:1.0];
        }
        smi = (SmilaScroview *)[_mainSrcrollView viewWithTag:100 + page +1];
        if (smi) {
            [smi setZoomScale:1.0];
        }
        
    }
}

// 处理缩放手势
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIImageView *imageView = (UIImageView *)pinchGestureRecognizer.view ;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        imageView.transform = CGAffineTransformScale(imageView.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
