//
//  UIColor+DLExtension.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/16.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "UIColor+DLExtension.h"
#import <UIKit/UIKit.h>

//@interface UIColor (Extension)
//
//+ (UIColor *) colorWithHexString: (NSString *)color;
//
//@end


@implementation UIColor (DLExtension)


#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
/**
 *  颜色转换 IOS中十六进制的颜色转换为UIColor
 */
+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //red
    NSString *rString = [cString substringWithRange:range];
    
    //green
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //blue
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
