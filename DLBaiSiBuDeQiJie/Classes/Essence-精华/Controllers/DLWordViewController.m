//
//  DLWordViewController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/16.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLWordViewController.h"

@interface DLWordViewController ()

@end

@implementation DLWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 内边距
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",indexPath];
    
    cell.backgroundColor = DLRandomColor;
    
    return cell;
}
@end
