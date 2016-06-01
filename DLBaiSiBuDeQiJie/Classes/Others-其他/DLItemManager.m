//
//  DLItemManager.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/5.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLItemManager.h"

@implementation DLItemManager

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end
