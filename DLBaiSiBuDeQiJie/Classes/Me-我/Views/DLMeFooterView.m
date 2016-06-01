//
//  DLMeFooterView.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/14.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLMeFooterView.h"
#import "DLMeSquare.h"
#import "MJExtension.h"
#import "UIButton+WebCache.h"
#import "DLMeSquareButton.h"
//#import "AFNetworking.h"
#import "DLHTTPSessionManager.h"
#import "DLWebViewController.h"
#import <SafariServices/SafariServices.h>

@interface DLMeFooterView()

/**
 *  存放所有模型的字典
 */
//@property(nonatomic,strong) NSMutableDictionary<NSString *,DLMeSquare *> *allSquares;

@end

@implementation DLMeFooterView

//// 懒加载
//- (NSMutableDictionary<NSString *,DLMeSquare *> *)allSquares{
//    if (_allSquares == nil) {
//        _allSquares = [NSMutableDictionary dictionary];
//    }
//    return _allSquares;
//}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
//        self.backgroundColor = [UIColor whiteColor];
        // 参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        // 请求
        [[DLHTTPSessionManager manager] GET:DLCommonUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nonnull responseObject) {
//            DLLog(@"请求成功 - %@ %@",[responseObject class],responseObject);
//            [responseObject writeToFile:@"/Users/imac11/Sites/me.plist" atomically:YES];
            // 字典数组转成模型数组
            NSArray *squares = [DLMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            
            [self createSquares:squares];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            DLLog(@"请求失败 - %@",error);
        }];
    }
    return self;
}
/**
 *  根据模型数据创建对应的控件
 */
- (void)createSquares:(NSArray *)squares
{
    // 方块个数
    NSUInteger count = squares.count;
    
    // 方块的尺寸
    int maxColsCount = 4; // 一行的最大列数
    CGFloat buttonW  = self.dl_width / maxColsCount;
    CGFloat buttonH  = buttonW;
    
    // 创建所有的方块
    for (NSUInteger i = 0; i < count; i++) {
        // i位置对应的模型数据
        DLMeSquare *square = squares[i];
       
        
        // 创建按钮
        DLMeSquareButton *button = [DLMeSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        // 设置frame
        button.dl_x      = (i % maxColsCount) * buttonW;
        button.dl_y      = (i / maxColsCount) * buttonH;
        button.dl_width  = buttonW;
        button.dl_height = buttonH;
        
//        button.backgroundColor = [UIColor whiteColor];
        
        
//        // 设置数据
        button.square = square;
        
        // 存储模型数据
         //self.allSquares[square.name] = square;
//        self.allSquares[button.currentTitle] = square;
    }
    
    // 设置footer的高度 == 最后一个按钮的bottom(最大Y值)
    self.dl_height = self.subviews.lastObject.dl_bottom;
    
    // 设置tableView的contentSize
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData]; // 重新刷新数据(会重新计算contentSize)
    //    tableView.contentSize = CGSizeMake(0, self.DL_bottom); // 不靠谱
}

- (void)buttonClick:(DLMeSquareButton *)button{
    
    NSString *url = button.square.url;

    DLLogFunc
//    DLMeSquare *square = self.allSquares[button.currentTitle];
    DLMeSquare *square = button.square;
    
    if ([square.url hasPrefix:@"http"]) { // 利用webView加载url即可
        DLLog(@"利用webView加载url");
        
        // 使用SFSafariViewController显示网页
        //        SFSafariViewController *webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url]];
        //        UITabBarController *tabBarVc = (UITabBarController *)self.window.rootViewController;
        //        [tabBarVc presentViewController:webView animated:YES completion:nil];
        
        
        // 获得"我"模块对应的导航控制器
        //        UITabBarController *tabBarVc = [UIApplication sharedApplication].keyWindow.rootViewController;
        //        UINavigationController *nav = tabBarVc.childViewControllers.firstObject;
        UITabBarController *tabBarVc = (UITabBarController *)self.window.rootViewController;
        UINavigationController *nav = tabBarVc.selectedViewController;
        
        // 显示DLWebViewController
        DLWebViewController *webView = [[DLWebViewController alloc] init];
        webView.url                  = url;
        webView.navigationItem.title = button.currentTitle;
        [nav pushViewController:webView animated:YES];
        
        
        
    } else if ([square.url hasPrefix:@"mod"]) { // 另行处理
        if ([square.url hasSuffix:@"BDJ_To_Check"]) {
            DLLog(@"跳转到[审帖]界面");
        } else if ([square.url hasSuffix:@"BDJ_To_RecentHot"]) {
            DLLog(@"跳转到[每日排行]界面");
        } else {
            DLLog(@"跳转到其他界面");
        }
    } else {
        DLLog(@"不是http或者mod协议的");
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
