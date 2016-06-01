//
//  DLRefreshHeader.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/17.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLRefreshHeader.h"

@interface DLRefreshHeader()

/** logo */
@property (nonatomic, weak) UIImageView *logo;

@end

@implementation DLRefreshHeader


/**
 *  初始化
 */
- (void)prepare{
    [super prepare];
    
    self.automaticallyChangeAlpha       = YES;
    self.lastUpdatedTimeLabel.hidden    = NO;
    self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
    self.stateLabel.textColor           = [UIColor orangeColor];
    
    [self setTitle:@"赶紧下拉吧" forState:MJRefreshStateIdle];
    [self setTitle:@"赶紧松开吧" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
    
    UIImageView *logo = [[UIImageView alloc] init];
    logo.image = [UIImage imageNamed:@"bd_logo1"];
    [self addSubview:logo];
    self.logo = logo;
}
/**
 *  摆放子控件
 */
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.logo.dl_width = self.dl_width;
    self.logo.dl_height = 50;
    self.logo.dl_x = 0;
    self.logo.dl_y = - 50;
}


@end
