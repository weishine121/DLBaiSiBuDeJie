//
//  UITextField+DLExtension.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/12.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "UITextField+DLExtension.h"

static NSString * const DLPlaceholderColorKey = @"placeholderLabel.textColor";

@implementation UITextField (DLExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    // 提前设置占位文字，目的：让它提前创建placeholderLabel
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;

    // 恢复到默认占位文字颜色
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:DLPlaceholderColorKey];
    
}

- (UIColor *)placeholderColor{
    return [self valueForKey:DLPlaceholderColorKey];
}

@end

// 提前设置占位文字，目的：让它提前创建placeholderLabel
//    if (self.placeholder.length == 0) {
//        self.placeholder = @" ";
//    }