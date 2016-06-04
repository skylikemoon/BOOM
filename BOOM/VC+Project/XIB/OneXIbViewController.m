//
//  OneXIbViewController.m
//  LX-UI模板
//
//  Created by eims1 on 15/11/3.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import "OneXIbViewController.h"
#import "SKY11Cell.h"
#import "ImgAndLblButton.h"

@interface OneXIbViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation OneXIbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SKY11Cell" bundle:nil] forCellReuseIdentifier:@"SKY11Cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 2;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textLabel.text= [NSString stringWithFormat:@"测试数据%ld",indexPath.row];
        //    cell.detailTextLabel.text=contact.phoneNumber;
        return cell;
    }else
    {
        SKY11Cell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SKY11Cell" forIndexPath:indexPath];
        return cell;
    }
    
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%ld",section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 44;
    }else
    {
        return 80;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.frame  = CGRectMake(0, 0, MSWIDTH, 40);
    UIImageView *imgView   = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(0, 0, MSWIDTH, 80);
    imgView.image = [UIImage imageNamed:@"headImage"];
    [view addSubview:imgView];
    return view;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
