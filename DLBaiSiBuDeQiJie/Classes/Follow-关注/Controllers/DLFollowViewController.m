//
//  DLFollowViewController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/5.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLFollowViewController.h"
#import "DLRecommendFollowViewController.h"
#import "DLLoginRegisterViewController.h"

@implementation DLFollowViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = DLCommonBgColor;
    
    // 标题
    self.navigationItem.title = @"我的关注";
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
//    [button addTarget:self action:@selector(followClick) forControlEvents:UIControlEventTouchUpInside];
//    [button sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(followClick)];
}

- (void)followClick{
    DLLogFunc
    DLRecommendFollowViewController *test = [[DLRecommendFollowViewController alloc] init];
    
    test.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:test animated:YES];
}
- (IBAction)loginRegister {
    DLLoginRegisterViewController *loginRegister = [[DLLoginRegisterViewController alloc] init];
    [self presentViewController:loginRegister animated:YES completion:nil];
    
}


@end
