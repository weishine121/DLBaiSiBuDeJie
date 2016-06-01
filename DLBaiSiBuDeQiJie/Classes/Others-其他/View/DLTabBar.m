//
//  DLTabBar.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/5.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLTabBar.h"
#import "DLLoginRegisterViewController.h"
@interface DLTabBar()
/**
 *  发布按钮
 */
@property(nonatomic,weak) UIButton *publishButton;


@end

@implementation DLTabBar

#pragma mark -
#pragma mark -  懒加载
- (UIButton *)publishButton{
    if (!_publishButton) {
        /*** 增加一个发布按钮 ***/
        UIButton *publishButton = [[UIButton alloc] init];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton sizeToFit];// 按钮里的内容多大 按钮就多大
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

/**
 *  布局子控件
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    /*** 按钮的尺寸 ***/
    CGFloat buttonW = self.dl_width / 5;
    CGFloat buttonH = self.dl_height;
    /*** 设置所有UITabBarbutton的frame ***/
    CGFloat tabBarButtonY = 0;
    // 按钮的索引
    int tabBarButtonIndex = 0;
    
    for (UIView *subview in self.subviews) {
        // 过滤掉非UITabBarbutton
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        
        // 设置frame
        CGFloat tabBarButtonX = tabBarButtonIndex * buttonW;
        
        if (tabBarButtonIndex >= 2) { // 右边的2个UITabBarButton
            tabBarButtonX += buttonW;
        }
        
        subview.frame = CGRectMake(tabBarButtonX, tabBarButtonY, buttonW, buttonH);
        
        // 增加索引
        tabBarButtonIndex++;
        
    }
    
    /*** 设置中间发布按钮的frame ***/
//    self.publishButton.frame = CGRectMake(0, 0, self.frame.size.width/5, self.frame.size.height);
    self.publishButton.dl_width = buttonW;
    self.publishButton.dl_height = buttonH;
    self.publishButton.center = CGPointMake(self.dl_width*0.5, self.dl_height*0.5);
}

#pragma mark -
#pragma mark -  监听
/*** 点击发布按钮 ***/
- (void)publishClick{
    DLLogFunc
    DLLoginRegisterViewController *loginRegister = [[DLLoginRegisterViewController alloc] init];
//    [self presentViewController:loginRegister animated:YES completion:nil];
    [self.window.rootViewController presentViewController:loginRegister animated:YES completion:nil];
    
}


@end
