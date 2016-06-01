//
//  DLEssenceViewController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/5.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLEssenceViewController.h"
#import "DLTitleButton.h"
#import "DLAllViewController.h"
#import "DLVideoViewController.h"
#import "DLVoiceViewController.h"
#import "DLPictureViewController.h"
#import "DLWordViewController.h"

@interface DLEssenceViewController()<UIScrollViewDelegate>

@property(nonatomic,weak) DLTitleButton *selectedTitleButton;
@property(nonatomic,weak) UIView *indicatorView;
@property(nonatomic,weak) UIScrollView *scrollView;
@property(nonatomic,weak) UIView *titlesView;

@end

@implementation DLEssenceViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = DLCommonBgColor;
    
    [self setupChildViewControllers];
    
    [self setupScrollView];
    
    [self setupTitlesView];
    
    [self setupNav];
    
    [self addChildVcView];
    
}

- (void)setupChildViewControllers{
    DLAllViewController *all         = [[DLAllViewController alloc] init];
    [self addChildViewController:all];

    DLVideoViewController *video     = [[DLVideoViewController alloc] init];
    [self addChildViewController:video];

    DLVoiceViewController *voice     = [[DLVoiceViewController alloc] init];
    [self addChildViewController:voice];

    DLPictureViewController *picture = [[DLPictureViewController alloc] init];
    [self addChildViewController:picture];

    DLWordViewController *word       = [[DLWordViewController alloc] init];
    [self addChildViewController:word];
    

}

- (void)setupScrollView{
    
    // 不允许自动调整scrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView                  = [[UIScrollView alloc]init];
    scrollView.frame                          = self.view.bounds;
    scrollView.backgroundColor                = [UIColor colorWithHexString:@"#f25fff"];
    scrollView.pagingEnabled                  = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator   = NO;
    scrollView.delegate                       = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 添加所有子控制器的view到scrollView中去
    NSUInteger count = self.childViewControllers.count;
//    for (NSUInteger i = 0 ; i < count ; i++) {
//        UITableView *childVcView    = (UITableView *)self.childViewControllers[i].view;
//        childVcView.backgroundColor = DLRandomColor;
//        childVcView.dl_x            = i * childVcView.dl_width;
//        childVcView.dl_y            = 0;
//        childVcView.dl_height       = scrollView.dl_height;
//        [scrollView addSubview:childVcView];
//        
//        // 内边距
//        childVcView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
//        childVcView.scrollIndicatorInsets = childVcView.contentInset;
//    }
    scrollView.contentSize = CGSizeMake(count * scrollView.dl_width, 0);
}

- (void)setupTitlesView{
    
    UIView *titlesView         = [[UIView alloc]init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    titlesView.frame           = CGRectMake(0, 64, self.view.dl_width, 35);
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 添加标题
    NSArray *titles      = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSUInteger count     = titles.count;
    CGFloat titleButtonW = titlesView.dl_width / count;
    CGFloat titleButtonH = titlesView.dl_height;
    
    for (int i = 0; i < count; i++ ) {
        DLTitleButton *titleButton = [DLTitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag            = i;
        titleButton.frame          = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        [titlesView  addSubview:titleButton];
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    DLTitleButton *firstTitleButton = titlesView.subviews.firstObject;
    UIView *indicatorView          = [[UIView alloc]init];
    indicatorView.dl_height        = 1;
    indicatorView.dl_y             = titlesView.dl_height - indicatorView.dl_height;
    indicatorView.backgroundColor  = [firstTitleButton titleColorForState:UIControlStateSelected];
    self.indicatorView             = indicatorView;
    [titlesView addSubview:indicatorView];
    
    //立刻根据文字内容计算label的宽度
    [firstTitleButton.titleLabel sizeToFit];
    indicatorView.dl_width   = firstTitleButton.titleLabel.dl_width + 10;
    indicatorView.dl_centerX = firstTitleButton.dl_centerX;
    
    // 默认选中最前面的按钮
    firstTitleButton.selected = YES;
    self.selectedTitleButton  = firstTitleButton;
}

- (void)setupNav{
    // 顶部的标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //    DLTitleButton *button = [DLTitleButton buttonWithType:DLTitleButtonTypeCustom];
    //    [button setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    //    [button setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    //    [button addTarget:self action:@selector(tagClick) forControlEvents:UIControlEventTouchUpInside];
    //    [button sizeToFit];
    //
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
}

/**
 *  点击标题按钮
 *
 *  @param button 被点击的标题按钮
 */
- (void)titleClick:(DLTitleButton *)titleButton{
    
//    self.selectedTitleButton.enabled = YES;
//    titleButton.enabled              = NO;
//    self.selectedTitleButton         = titleButton;
    
    self.selectedTitleButton.selected = NO;
    titleButton.selected              = YES;
    self.selectedTitleButton          = titleButton;

    [UIView animateWithDuration:0.25 animations:^{
        //   CGFloat textW = [titleButton.currentTitle sizeWithFont:titleButton.titleLabel.font].width;
        //   CGFloat textW = [titleButton.currentTitle sizeWithAttributes:@{NSFontAttributeName : titleButton.titleLabel.font}].width;
        
        self.indicatorView.dl_width   = titleButton.titleLabel.dl_width + 10;
        self.indicatorView.dl_centerX = titleButton.dl_centerX;
    }];
    
    // 让scrollView滚动到对应的位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.dl_width;
    [self.scrollView setContentOffset:offset animated:YES];

}

- (void)tagClick{
    DLLogFunc
}

#pragma mark -
#pragma mark -  <UISCrollViewDelegate>

/**
 *  在scrollView滚动结束时，就会调用这个方法
 *
 *  前提：使用setContentOffset：animated 或者 scrollRectVisible：animated 让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self addChildVcView];
}

/**
 *  在scrollView滚动结束时，就会调用这个方法
 *
 *  前提：认为拖拽scrollView产生滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.dl_width;
    
    DLTitleButton *titleButton = self.titlesView.subviews[index];
    
    [self titleClick:titleButton];
    
    [self addChildVcView];
}


#pragma mark -
#pragma mark -  添加子控制器View
- (void)addChildVcView{
    //索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.dl_width;
        
    //取出子控制器
    UIViewController *childVC = self.childViewControllers[index];
//    childVC.view.dl_y = self.scrollView.contentOffset.y;
//    childVC.view.dl_x = self.scrollView.contentOffset.x;
//    childVC.view.dl_width = self.scrollView.dl_width;
//    childVC.view.dl_height = self.scrollView.dl_height;
    
    if(childVC.view.superview) return;
    
    childVC.view.frame = self.scrollView.bounds;
    
    [self.scrollView addSubview:childVC.view];
}

@end
