//
//  DLTabBarController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/4.
//  Copyright © 2016年 weishine. All rights reserved.
//




#import "DLTabBarController.h"
#import "DLTabBar.h"
#import "DLEssenceViewController.h"
#import "DLNewViewController.h"
#import "DLFollowViewController.h"
#import "DLMeViewController.h"
#import "DLNavigationController.h"

@interface DLTabBarController ()

@end

@implementation DLTabBarController

#pragma mark -
#pragma mark -  初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /****  设置所有UITabBarItem的文字属性  ****/
    [self setupitemTitleTextAttributes];
    
    /****  添加子控制器  ***/
    [self setupChildViewControllers];
    
     /****  更换TabBar ***/
    [self setupTabBar];
    
}

/**
 *   设置所有UITabBarItem的文字属性
 */
- (void)setupitemTitleTextAttributes{
    UITabBarItem *item = [UITabBarItem appearance];
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

/**
 *  添加子控制器
 */
- (void)setupChildViewControllers{
    
    [self setupOneChildViewController:[[DLNavigationController alloc]initWithRootViewController: [[DLEssenceViewController alloc] init]] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupOneChildViewController:[[DLNavigationController alloc]initWithRootViewController:[[DLMeViewController alloc] init]] title:@"我"   image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    [self setupOneChildViewController:[[DLNavigationController alloc]initWithRootViewController:[[DLFollowViewController alloc] init]] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupOneChildViewController:[[DLNavigationController alloc]initWithRootViewController:[[DLNewViewController alloc] init]] title:@"新贴" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
}

/**
 *  更换TabBar
 */
- (void)setupTabBar{
    [self setValue:[[DLTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  初始化一个自控制器
 *
 *  @param clazz         子控制器
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中的图标
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{

//    vc.view.backgroundColor = DLRandomColor;
   
    vc.tabBarItem.title     = title;
    if (image.length) { // image.length 排除两种可能：nil 和 空串
        vc.tabBarItem.image         = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
}

@end
