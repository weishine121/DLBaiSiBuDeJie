//
//  DLMeViewController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/5.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLMeViewController.h"
#import "DLMeCell.h"
#import "DLMeFooterView.h"
#import "DLSettingViewController.h"
@implementation DLMeViewController


- (void)viewDidLoad{

    
    [super viewDidLoad];
    
    
    [self setupTable];
    
    self.view.backgroundColor = DLCommonBgColor;
    
    [self setupNav];
    

}

- (void)setupTable{
    
    self.tableView.backgroundColor = DLCommonBgColor;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = DLMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(DLMargin - 35, 0, 0, 0);
    
    
//    UIView *footerView = [[UIView alloc]init];
//    footerView.backgroundColor = [UIColor redColor];
//    footerView.dl_height = 200;
    self.tableView.tableFooterView = [[DLMeFooterView alloc]init];
    
}

- (void)setupNav{
    self.navigationItem.title = @"我";
    
    // 右边-设置
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    //右边-月亮
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
}


- (instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}

#pragma mark -
#pragma mark -  数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"me";
    
    DLMeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[DLMeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"1";
    
    if (indexPath.section == 0) {
        cell.textLabel.text  = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    }else{
        cell.textLabel.text  = @"离线下载";
        // 只要其他cell设置过imeView.image，其他不显示的cell都需要设置imageView.image = nil
        cell.imageView.image = nil;
    }
    
    
    return cell;
}


- (void)settingClick{

    DLSettingViewController *settingVC = [[DLSettingViewController alloc]init];
    
    [self.navigationController pushViewController:settingVC animated:YES];
    
}


- (void)moonClick{
    DLLogFunc
}


@end
