//
//  DLClearCacheCell.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/15.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLClearCacheCell.h"
#import "SDImageCache.h"
#import "SVProgressHUD.h"

#define DLClearCacheFile [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"]

@implementation DLClearCacheCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        // 设置cell默认的文字（如果设置文字之前 userInteractionEnabled = NO，那么文字颜色自动变为浅灰色）
        self.textLabel.text = @"清除缓存(正在计算缓存大小...)";
        // 禁止点击
        self.userInteractionEnabled = NO;
        
        __weak typeof(self) weakSelf = self;
        
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        
        // 在子线程计算缓存大小
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            // 获得缓存文件夹路径
            unsigned long long size = DLClearCacheFile.fileSize;
//          unsigned long long size =@"/Users/imac11/weishine/weishine_iOS/2015-9~2016-1/CZ/7 - 百思不得姐".fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            if (weakSelf == nil) return ;

            NSString *sizeText = nil;
            
            if (size >= pow(10, 9)) {        // 1GB =< size
                sizeText = [NSString stringWithFormat:@"%.2fGB",size / pow(10, 9) ];
            } else if(size >= pow(10, 6)){   // 1MB =< size <= 1GB
                sizeText = [NSString stringWithFormat:@"%.2fMB",size / pow(10, 6) ];
            } else if(size >= pow(10, 3)){   // 1KB =< size <= 1MB
                sizeText = [NSString stringWithFormat:@"%.2fKB",size / pow(10, 3) ];
            } else {                         //        size <= 1KB
                sizeText = [NSString stringWithFormat:@"%zdB",size];
            }
            
            // 生成文字
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)",sizeText];
            
            // 回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                
                weakSelf.textLabel.text = text;                                        // 设置文字
                weakSelf.accessoryView  = nil;                                         // 清空右边指示器
                weakSelf.accessoryType  = UITableViewCellAccessoryDisclosureIndicator; // 显示右边箭头
                
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:weakSelf action:@selector(clearCache)]];
                
                weakSelf.userInteractionEnabled = YES;
            });
        });
    }
    return self;
}

- (void)dealloc{
DLLogFunc
}

- (void)clearCache{
    DLLogFunc
    // 弹出指示器
    [SVProgressHUD showWithStatus:@"正在清除缓存..." ];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    
    // SDWebImage删除缓存文件
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            // 删除自定义的缓存
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr removeItemAtPath:DLClearCacheFile error:nil];
            [mgr createDirectoryAtPath:DLClearCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
//            [NSThread sleepForTimeInterval:2.0];
            // 所有缓存都清除完毕
            dispatch_async(dispatch_get_main_queue(), ^{
                // 隐藏指示器
                [SVProgressHUD dismiss];
                
                // 设置文字
                self.textLabel.text = @"清除缓存(0B)";
            });
            
        });
    }];
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    UIActivityIndicatorView *loadingView = (UIActivityIndicatorView *)self.accessoryView;
    [loadingView startAnimating];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
