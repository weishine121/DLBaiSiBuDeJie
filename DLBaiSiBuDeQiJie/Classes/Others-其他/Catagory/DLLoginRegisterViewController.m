//
//  DLLoginRegisterViewController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/6.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLLoginRegisterViewController.h"

@interface DLLoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@end

@implementation DLLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/**
 *  关闭登录界面 或 注册界面
 */
- (IBAction)close {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view endEditing:YES];

}

/**
 *  显示登录 或 注册界面
 *
 *  @param sender
 */
- (IBAction)showLoginOrRegister:(UIButton *)button {
    
    [self.view endEditing:YES];
    if (self.leftMargin.constant) { // 当前显示的是注册界面，点击按钮切换到登录界面
        self.leftMargin.constant = 0;
        button.selected = NO;
//        [button setTitle:@"注册账号" forState:UIControlStateNormal];
    }else{                          // 当前显示的是登录界面
        self.leftMargin.constant = -self.view.dl_width;
//        [button setTitle:@"已有账号" forState:UIControlStateNormal];
        button.selected = YES;
    }
    
    // block中放UI刷新的代码 -- 修改UI界面的代码
    [UIView animateWithDuration:0.25 animations:^{
        // 强制刷新  让最新设置的约束值马上作用到UI控件上 会刷新view的所有子控件
        [self.view layoutIfNeeded];
    }];
    
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
