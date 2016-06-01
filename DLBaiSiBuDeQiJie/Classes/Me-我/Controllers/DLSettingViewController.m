//
//  DLSettingViewController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/14.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLSettingViewController.h"
#import "SDImageCache.h"
#import "DLClearCacheCell.h"
#import "DLSettingCell.h"

@interface DLSettingViewController ()

@end
static NSString * const DLClearCacheCellID = @"clearCache";
static NSString * const DLSettingCellID    = @"setting";

@implementation DLSettingViewController



- (instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[DLClearCacheCell class] forCellReuseIdentifier:DLClearCacheCellID];
    [self.tableView registerClass:[DLSettingCell class] forCellReuseIdentifier:DLSettingCellID];
    
//    [self getCacheSize2];
//    DLLog(@"%@",NSHomeDirectory());
    
//    DLLog(@"%zd",@"/Users/imac11/weishine/weishine_iOS/2015-9~2016-1/CZ/7 - 百思不得姐/百思 资料和代码/2 - 1106/02.pptx".fileSize);
   
//    self.tableView.allowsSelection = NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)getCacheSize2{
    
    // 总大小
    unsigned long long size = 0;
    
    // 获得缓存文件夹路劲
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dirPath   = [cachePath stringByAppendingPathComponent:@"default"];
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 获取文件夹中所有文件的总大小
    NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:dirPath];
    
    for (NSString *subpath in enumerator) {
        // 全路径
        NSString *fullSubPath = [dirPath stringByAppendingPathComponent:subpath];
        
        //累加文件大小
        size += [mgr attributesOfItemAtPath:fullSubPath error:nil].fileSize;
        
    }
//    DLLog(@"%zd", size);
}

- (void)getCacheSize
{
    // 总大小
    unsigned long long size = 0;
    
    // 获得缓存文件夹路径
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dirpath = [cachesPath stringByAppendingPathComponent:@"MP3/Abc"];
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
    //    DLLog(@"contents - %@", [mgr contentsOfDirectoryAtPath:dirpath error:nil]);
    NSArray *subpaths = [mgr subpathsAtPath:dirpath];
    for (NSString *subpath in subpaths) {
        // 全路径
        NSString *fullSubpath = [dirpath stringByAppendingPathComponent:subpath];
        // 累加文件大小
        size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        
        //        NSDictionary *attrs = [mgr attributesOfItemAtPath:fullSubpath error:nil];
        //        size += [attrs[NSFileSize] unsignedIntegerValue];
    }
    
    DLLog(@"%zd", size);
}


#pragma mark -
#pragma mark -  数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return [tableView dequeueReusableCellWithIdentifier:DLClearCacheCellID];
    }else{
        DLSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:DLSettingCellID];
        if (indexPath.row == 1) {
            cell.textLabel.text = @"推荐给朋友";
        }else if(indexPath.row == 2){
            cell.textLabel.text = @"帮助";
        }else if(indexPath.row == 3){
            cell.textLabel.text = @"关于我们";
        }else if(indexPath.row == 4){
            cell.textLabel.text = @"检查更新";
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DLLogFunc
}

@end
