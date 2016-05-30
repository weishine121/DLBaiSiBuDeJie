//
//  SJUBBCController.m
//  W-M-Learning
//
//  Created by weishine on 16/5/29.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "SJUBBCController.h"
#import "SJUHeaderView.h"


@interface SJUBBCController ()

@end

static NSString *identifier = @"BBCCellID";

@implementation SJUBBCController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = DLRandomColor;
    
    self.navigationItem.title = @"悦听";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    SJUHeaderView *headerView = [[SJUHeaderView alloc]initWithFrame:CGRectMake(5, 5, self.view.dl_width, 180)];
    headerView.backgroundColor = DLRandomColor;
    self.tableView.tableHeaderView = headerView;

}

#pragma mark -
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}


@end
