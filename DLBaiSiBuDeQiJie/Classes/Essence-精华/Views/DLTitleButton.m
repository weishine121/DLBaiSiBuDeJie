//
//  DLTitleButton.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/15.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLTitleButton.h"

@implementation DLTitleButton


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor]      forState:UIControlStateSelected];
//      [self setTitleColor:[UIColor redColor]      forState:UIControlStateDisabled];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{}

@end
