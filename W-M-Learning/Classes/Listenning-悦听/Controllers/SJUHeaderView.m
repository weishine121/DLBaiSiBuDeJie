//
//  SJUHeaderView.m
//  W-M-Learning
//
//  Created by weishine on 16/5/29.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "SJUHeaderView.h"

#define IMG_COUNT 5
#define SCROLLVIEW_SIZE (elf.scrollView.frame.size)

@interface SJUHeaderView()<UIScrollViewDelegate>

/** scrollView */
@property (nonatomic, strong) UIScrollView *scrollView;

/** UIPageControl */
@property (nonatomic, strong) UIPageControl *pageControl;

/** 时间计时器NSTimer */
@property (nonatomic, strong) NSTimer *timer;


@end
@implementation SJUHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        DLLog(@"%zd",self.scrollView.frame.size.width);
        [self setupScrollView];
        
        [self setupPageControl];
        
        [self initImageTimer];
    }
    return self;
}

- (void)setupScrollView{
    self.scrollView                            = [[UIScrollView alloc] init];
    _scrollView.frame                          = self.bounds;
    _scrollView.delegate                       = self;

    _scrollView.contentSize                    = CGSizeMake(self.frame.size.width * IMG_COUNT, 0);
    _scrollView.pagingEnabled                  = YES;

    _scrollView.showsVerticalScrollIndicator   = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;

    
    [self addSubview:_scrollView];
    
    for (int i = 0; i < IMG_COUNT; i++) {
        CGFloat scrollImageX     = self.scrollView.dl_width * i;

        UIImageView *scrollImage = [[UIImageView alloc]initWithFrame:CGRectMake(scrollImageX, 0, _scrollView.dl_width, _scrollView.dl_height)];
        [scrollImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"img_%02d",i+1]]];

        [_scrollView addSubview:scrollImage];
    }
    
}

- (void)setupPageControl{
    
    _pageControl                               = [[UIPageControl alloc] init];

    _pageControl.frame                         = CGRectMake(150, 150, 75, 20);

    _pageControl.numberOfPages                 = IMG_COUNT;

    _pageControl.pageIndicatorTintColor        = DLRandomColor;

    _pageControl.currentPageIndicatorTintColor = DLRandomColor;

    _pageControl.currentPage                   = 0;

    [self addSubview:_pageControl];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    _pageControl.currentPage = _scrollView.contentOffset.x / _scrollView.dl_width;
    
}

/**
 在开始拖拽的时候， 把计时器停止
 
 invalidate 无效的意思
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 让计时器无效
    [_timer invalidate];
}

/**
 当停止拖拽的时候， 让计时器开始工作
 手指离开scrollView的时候
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [_timer fire];
    
    [self initImageTimer];
}


- (void)initImageTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(didClickButton:) userInfo:nil repeats:YES];
    
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    
    
    [mainLoop addTimer:_timer forMode:NSRunLoopCommonModes];
    

}

- (void)didClickButton:(id)sender{
    
    // 1. 取出 contentOffset
    CGPoint offset = _scrollView.contentOffset;
    
    // 2. currentPage
    NSInteger currentPage = _pageControl.currentPage;
    
    // 3. 进行修改
    
    if (currentPage == 4) {
        // 到了最后一张, 再次点击的时候， 到第一张图片的位置
        // currentPage 修改为0
        currentPage = 0;
        
        // 修改 scrollView的contentOffset
        offset = CGPointZero;
        
    } else {
        
        currentPage += 1;
        
        offset.x += _scrollView.dl_width;
    }
    
    // 4. 赋值回去
    _pageControl.currentPage = currentPage;
    [_scrollView setContentOffset:offset animated:YES];
}
@end
