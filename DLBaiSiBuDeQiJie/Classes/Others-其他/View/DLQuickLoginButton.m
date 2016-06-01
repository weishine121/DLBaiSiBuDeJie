//
//  DLQuickLoginButton.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/6.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLQuickLoginButton.h"

@implementation DLQuickLoginButton

- (void)awakeFromNib{
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.titleLabel.backgroundColor = [UIColor orangeColor];
//    self.backgroundColor = [UIColor blueColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

}



- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.dl_y = 0;
    self.imageView.dl_centerX = self.dl_width*0.5;
    
    self.titleLabel.dl_x = 0;
    self.titleLabel.dl_y = self.imageView.dl_bottom;
    self.titleLabel.dl_height = self.dl_height - self.imageView.dl_height;
    self.titleLabel.dl_width = self.dl_width;
    
}











@end
