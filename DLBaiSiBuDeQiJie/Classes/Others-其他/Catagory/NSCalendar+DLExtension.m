//
//  NSCalendar+DLExtension.m
//  DLBaiSiBuDeQiJie
//
//  Created by weishine on 16/5/25.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "NSCalendar+DLExtension.h"

@implementation NSCalendar (DLExtension)

+ (instancetype)dl_calendar{
    
    if ([NSCalendar instancesRespondToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }else{
        return [NSCalendar currentCalendar];
    }
}

@end
