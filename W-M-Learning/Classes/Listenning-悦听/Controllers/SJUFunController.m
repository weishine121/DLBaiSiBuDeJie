//
//  SJUFunController.m
//  W-M-Learning
//
//  Created by weishine on 16/5/29.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "SJUFunController.h"

@interface SJUFunController ()

@property (strong, nonatomic) IBOutlet UIImageView *imaViewCat;

@end

@implementation SJUFunController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DLRandomColor;
    DLLog(@"娱乐");
    
    _imaViewCat = [[UIImageView alloc] init];
    _imaViewCat.frame = CGRectMake(0, 0, self.view.dl_width, self.view.dl_height);
    [self.view addSubview:_imaViewCat];
    
    [self startAnimation:6 picName:@".png"];
    
}

//执行动画的方法
- (void) startAnimation: (int)count picName:(NSString *)picName {
    
    //判断当前是否正在执行动画，如果是，则什么都不操作
    if (self.imaViewCat.isAnimating) {
        return;
    }
    
    NSMutableArray *arrayM = [NSMutableArray array];
    //1.动态加载图片到一个NSArray中
    for (int i = 0; i<count; i++) {
        NSString *imgName = [NSString stringWithFormat:@"%d%@",i+1,picName];
        NSString *path = [[NSBundle mainBundle]pathForResource:imgName ofType:nil];
        UIImage *imgCat = [UIImage imageWithContentsOfFile:path];
        [arrayM addObject:imgCat];
    }
    
    //2.设置UIImageView（图片框）的animationImages属性，这个属性中包含的就是所有那些要执行的动画的图片
    self.imaViewCat.animationImages = arrayM;
    //3.设置动画持续时间
    self.imaViewCat.animationDuration = self.imaViewCat.animationImages.count*0.1;
    //4.设置动画是否要重复播放
    self.imaViewCat.animationRepeatCount = 1;
    //5.开启动画
    [self.imaViewCat startAnimating];
    [self.imaViewCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imaViewCat.animationImages.count*0.1];
}

@end








