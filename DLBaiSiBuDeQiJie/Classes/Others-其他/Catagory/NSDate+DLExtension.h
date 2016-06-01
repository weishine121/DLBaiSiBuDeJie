//
//  NSDate+DLExtension.h
//  DLBaiSiBuDeQiJie
//
//  Created by weishine on 16/5/25.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DLExtension)

/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  是否为今天
 */
- (BOOL)isToday;

/**
 *  是否为昨天
 */
- (BOOL)isYesterday;

/**
 *  是否为明天
 */
- (BOOL)isTomorrow;

@end
