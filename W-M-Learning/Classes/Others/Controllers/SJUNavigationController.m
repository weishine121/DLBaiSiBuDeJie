//
//  SJUNavigationController.m
//  W-M-Learning
//
//  Created by weishine on 16/5/28.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "SJUNavigationController.h"

@interface SJUNavigationController ()

@end

@implementation SJUNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.backgroundColor = [UIColor blueColor];
    
}

/**
 *  重写push的目的:拦截push进来的所有控制器
 *
 *  @param viewController 刚刚push进来的子控制器
 *  @param animated       动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        
        UIButton *backButton = [[UIButton alloc] init];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"]      forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -12, 0, 0);
        
        [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [backButton sizeToFit];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 所有设置搞定后 再push控制器
    [super pushViewController:viewController animated:animated];
    
}

/** pop控制器 */
- (void)backClick{
    [self popViewControllerAnimated:YES];
}

/**
 *  手势shibie器对象调用这个代理方法来决定手势 是否有效
 *
 *  @return YES：手势有效，NO：手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    // 手势何时有效：当导航控制器的子控制器个数 > 1就有效
    return self.childViewControllers.count > 1;
    
}


@end
