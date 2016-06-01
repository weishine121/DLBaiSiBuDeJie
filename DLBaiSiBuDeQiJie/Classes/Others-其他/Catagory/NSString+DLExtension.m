//
//  NSString+DLExtension.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/15.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "NSString+DLExtension.h"

@implementation NSString (DLExtension)

//- (unsigned long long)fileSize{
//    
//    // 总大小
//    unsigned long long size = 0;
//    
////    // 获得缓存文件夹路劲
////    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
////    NSString *dirPath   = [cachePath stringByAppendingPathComponent:@"default"];
////    
//    // 文件管理者
//    NSFileManager *mgr = [NSFileManager defaultManager];
//    NSDictionary *attrs =[mgr attributesOfItemAtPath:self error:nil];
//    
//    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) {
//        // 获取文件夹中所有文件的总大小
//        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
//        
//        for (NSString *subpath in enumerator) {
//            // 全路径
//            NSString *fullSubPath = [self stringByAppendingPathComponent:subpath];
//            
//            //累加文件大小
//            size += [mgr attributesOfItemAtPath:fullSubPath error:nil].fileSize;
//            
//        }
//    }else{
//        
//        size = attrs.fileSize;
//    }
//    
//   
//    return size;
//}
- (unsigned long long)fileSize{
    
    // 总大小
    unsigned long long size = 0;
    
    //    // 获得缓存文件夹路劲
    //    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    //    NSString *dirPath   = [cachePath stringByAppendingPathComponent:@"default"];
    //
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];

    // 是否为文件夹
    BOOL isDirectory = NO;
    
    // 路劲是否存在
    BOOL isExist = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!isExist) {
        return size;
    }
    if (isDirectory) {
        // 获取文件夹中所有文件的总大小
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        
        for (NSString *subpath in enumerator) {
            // 全路径
            NSString *fullSubPath = [self stringByAppendingPathComponent:subpath];
            
            //累加文件大小
            size += [mgr attributesOfItemAtPath:fullSubPath error:nil].fileSize;
            
        }
    }else{
        
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    
    return size;
}

@end
