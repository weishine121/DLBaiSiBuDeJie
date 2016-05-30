//
//  SJUTabBarController.m
//  W-M-Learning
//
//  Created by weishine on 16/5/28.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "SJUTabBarController.h"
#import "SJUNavigationController.h"
#import "SJUHomeViewController.h"
#import "SJULearnPlanController.h"
#import "SJUExamController.h"
#import "SJUListeningController.h"
#import "SJUExchangeController.h"
#import "CustomPagerController.h"
#import "SJUTabBar.h"

@interface SJUTabBarController ()

@end

@implementation SJUTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupChildViewControllers];
    
    [self setupTabBar];

    [self setupItemTitleTextAttributes];
}

/** 初始化子控制器 */
- (void)setupChildViewControllers{
    
    [self setupChildViewController:[[SJUHomeViewController alloc]init] title:@"首页" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildViewController:[[UINavigationController alloc]initWithRootViewController:[[SJULearnPlanController alloc]init]] title:@"学习计划" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildViewController:[[UINavigationController alloc]initWithRootViewController:[[CustomPagerController alloc]init]] title:@"悦听" image:@"tabBar_icon_listenning_normal" selectedImage:@"tabBar_icon_listenning_click"];
    
    [self setupChildViewController:[[UINavigationController alloc]initWithRootViewController:[[SJUExchangeController alloc]init]] title:@"大咖交流" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
}

/**
 *  初始化一个控制器的方法
 *
 *  @param VC            导航控制器的根控制器
 *  @param title         TabBarItem的标题
 *  @param image         TabBarItem正常状态下的图片
 *  @param selectedImage TabBarItem选中状态下的图片
 */
- (void)setupChildViewController:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    VC.tabBarItem.title = title;
    
    VC.tabBarItem.image = [UIImage imageNamed:image];
    
    VC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    [self addChildViewController:VC];
    
}

/** 替换tabBar */
- (void)setupTabBar{
    [self setValue:[[SJUTabBar alloc]init] forKey:@"tabBar"];
}

/** 设置所有UITabBarItem的文字属性 */
- (void)setupItemTitleTextAttributes{
    UITabBarItem *item = [UITabBarItem appearance];
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttributes = [NSMutableDictionary dictionary];
    normalAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    normalAttributes[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttributes = [NSMutableDictionary dictionary];
    selectedAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    selectedAttributes[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
}

@end














