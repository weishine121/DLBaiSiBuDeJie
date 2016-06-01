//
//  DLMJExtensionConfig.m
//  DLBaiSiBuDeQiJie
//
//  Created by weishine on 16/5/25.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLMJExtensionConfig.h"
#import "MJExtension.h"
#import "DLTopics.h"
#import "DLComment.h"

@implementation DLMJExtensionConfig

+ (void)load{
    
    [DLTopics mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"top_cmt" : [DLComment class]};
    }];
    
    [DLTopics mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"top_cmt" : @"top_cmt[0]",
                 @"small_image" : @"image0",
                 @"middle_image" : @"image2",
                 @"large_image" : @"image1"
                 };
    }];
    
}

@end
