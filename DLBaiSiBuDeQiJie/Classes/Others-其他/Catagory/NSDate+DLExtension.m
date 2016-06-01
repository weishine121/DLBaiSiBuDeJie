//
//  NSDate+DLExtension.m
//  DLBaiSiBuDeQiJie
//
//  Created by weishine on 16/5/25.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "NSDate+DLExtension.h"

@implementation NSDate (DLExtension)


- (BOOL)isThisYear{
    // 判断self这个日期是否为今年
    
    NSCalendar *calendar = [NSCalendar dl_calendar];
    
    NSInteger thisYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    return thisYear = nowYear;
}
//- (BOOL)isThisYear
//{
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyy";
//
//    // 年
//    NSString *selfYear = [fmt stringFromDate:self];
//    NSString *nowYear = [fmt stringFromDate:[NSDate date]];
//
//    return [selfYear isEqualToString:nowYear];
//}

//- (BOOL)isToday{
//    // 判断self这个日期是否为今天
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyyMMdd";
//    
//        // 年
//     NSString *selfYear = [fmt stringFromDate:self];
//     NSString *nowYear = [fmt stringFromDate:[NSDate date]];
//    
//    return [selfYear isEqualToString:nowYear];
//}

- (BOOL)isToday{
    // 判断self这个日期是否为今天
    
    NSCalendar *calendar = [NSCalendar dl_calendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ;
    
    NSDateComponents *selfComps = [calendar components:unit fromDate:self];
    NSDateComponents *nowComps  = [calendar components:unit fromDate:[NSDate date]];

    return selfComps.year  == nowComps.year
        && selfComps.month == nowComps.month
        && selfComps.day   == nowComps.day;
}

- (BOOL)isYesterday{
    // 判断self这个日期是否为昨天
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString  = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate  = [fmt dateFromString:nowString];
    
    NSCalendar *calendar = [NSCalendar dl_calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ;
    NSDateComponents *comps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return comps.year  == 0
        && comps.month == 0
        && comps.day   == 1;
}

- (BOOL)isTomorrow{
    // 判断self这个日期是否为明天
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString  = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate  = [fmt dateFromString:nowString];
    
    NSCalendar *calendar = [NSCalendar dl_calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay ;
    NSDateComponents *comps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return comps.year  == 0
        && comps.month == 0
        && comps.day   == -1;
}
@end
