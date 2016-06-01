//
//  UIView+DLExtension.h
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/5.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DLExtension)
@property(nonatomic, assign) CGFloat dl_width;
@property(nonatomic, assign) CGFloat dl_height;
@property(nonatomic, assign) CGSize dl_size;
@property(nonatomic, assign) CGFloat dl_x;
@property(nonatomic, assign) CGFloat dl_y;
@property(nonatomic, assign) CGFloat dl_centerX;
@property(nonatomic, assign) CGFloat dl_centerY;

@property(nonatomic, assign) CGFloat dl_right;
@property(nonatomic, assign) CGFloat dl_bottom;

+ (instancetype)dl_viewFromXib;
@end
