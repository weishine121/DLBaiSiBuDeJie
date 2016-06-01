//
//  DLMeSquareButton.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/14.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLMeSquareButton.h"
#import "DLMeSquare.h"
#import "UIButton+WebCache.h"

@implementation DLMeSquareButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font          = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.imageView.dl_y       = self.dl_height*0.15;
    self.imageView.dl_height  = self.dl_height*0.5;
    self.imageView.dl_width   = self.imageView.dl_height;
    self.imageView.dl_centerX = self.dl_width * 0.5;
    
    self.titleLabel.dl_y      = self.imageView.dl_bottom;
    self.titleLabel.dl_x      = 0;
    self.titleLabel.dl_width  = self.dl_width;
    self.titleLabel.dl_height = self.dl_height - self.titleLabel.dl_y;
    
}


- (void)setSquare:(DLMeSquare *)square{
    _square = square;
    
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
