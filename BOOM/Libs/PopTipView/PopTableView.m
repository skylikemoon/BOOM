//
//  PopTableView.m
//  LX-UI模板
//
//  Created by eims1 on 16/1/19.
//  Copyright (c) 2016年 sky. All rights reserved.
//

#import "PopTableView.h"

#define GAP (MSWIDTH-20)/5

@interface PopTableView ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation PopTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        
        _backgroundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroundBtn.frame = CGRectMake(0, 0, MSWIDTH, MSHEIGHT);
        _backgroundBtn.backgroundColor = [UIColor clearColor];
        [_backgroundBtn addTarget:self action:@selector(backgroundBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backgroundBtn];
        
        UIView *rectView = [[UIView alloc] init];
        rectView.backgroundColor = [UIColor whiteColor];
        rectView.frame = CGRectMake(10, 70, MSWIDTH-20, 200);
        rectView.layer.cornerRadius = 4.0f;
        [self addSubview:rectView];
        
        UIView *headView = [[UIView alloc] init];
        headView.backgroundColor = [UIColor lightGrayColor];
        headView.frame = CGRectMake(0, 0, MSWIDTH-20, 30);
        headView.layer.cornerRadius = 4.0f;
        [rectView addSubview:headView];
        
        NSArray *titleArray2 = @[@"编号",@"金额",@"期限",@"奖金利率",@"获得奖金"];
//        int gap = (MSWIDTH-20)/(titleArray2.count);
        
        for (int j=0; j<titleArray2.count; j++)
        {
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(GAP*j, 0, GAP, 30)];
            lbl.backgroundColor = [UIColor clearColor];
            lbl.textAlignment = NSTextAlignmentCenter;
            lbl.text = titleArray2[j];
            lbl.font = [UIFont systemFontOfSize:12];
            [headView addSubview:lbl];
        
        }

        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 31, MSWIDTH-20, 210) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.layer.cornerRadius = 4.0f;
        [rectView addSubview:self.tableView];
        
        
        
       
    }
    return self;
}

-(void)backgroundBtnClick
{
    [self removeFromSuperview];
}

#pragma mark - UITableView 代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cate_cell%ld",(long)indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *titleArray2 = @[@"编号",@"金额",@"期限",@"奖金利率",@"获得奖金"];

    for (int j=0; j<titleArray2.count; j++)
    {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(GAP*j, 0, GAP, 30)];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.text = titleArray2[j];
        lbl.font = [UIFont systemFontOfSize:12];
        if (j==3) {
            lbl.textColor = [UIColor redColor];
        }
        
        if (j==4) {
            //拼接文本
            
        }
        
        [cell addSubview:lbl];
        
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 6;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
}

- (void)viewDidLayoutSubviews
{
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
}



@end
