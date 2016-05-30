//
//  SJUTabBar.m
//  W-M-Learning
//
//  Created by weishine on 16/5/28.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "SJUTabBar.h"
#import "UIView+DLExtension.h"

@interface SJUTabBar()

/** 考试按钮 */
@property(nonatomic,weak) UIButton *examButton;

@end

@implementation SJUTabBar

#pragma mark -
#pragma mark - 懒加载考试按钮
- (UIButton *)examButton{
    if (_examButton == nil) {
        UIButton *examButton = [[UIButton alloc]init];
        [examButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [examButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [examButton sizeToFit];
        [examButton addTarget:self action:@selector(examButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:examButton];
        _examButton = examButton;
    }
    return _examButton;
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
    
    CGFloat tabBarButtonW = self.dl_width / 5;
    CGFloat tabBarButtonH = self.dl_height;
    
    NSInteger index = 0;
    
    for (UIView *subview in self.subviews) {
        
        // 过滤掉非UITabBarbutton
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        
        CGFloat tabBarButtonX = tabBarButtonW * index;
        
        if (index >= 2) {
            tabBarButtonX = tabBarButtonX + tabBarButtonW;
        }
        
        subview.frame = CGRectMake(tabBarButtonX, 0, tabBarButtonW, tabBarButtonH);
        
        index++;
    }
    
    self.examButton.dl_width = tabBarButtonW;
    self.examButton.dl_height = tabBarButtonH;
    self.examButton.center = CGPointMake(self.dl_width*0.5, self.dl_height*0.5);
}

- (void)examButtonClick{
    
}



@end
