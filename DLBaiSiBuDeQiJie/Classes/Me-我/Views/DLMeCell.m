//
//  DLMeCell.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/14.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLMeCell.h"

@implementation DLMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        // 内容模式
//      self.imageView.contentMode = 	UIViewContentModeScaleAspectFit;
        self.textLabel.textColor   = [UIColor grayColor];
        self.accessoryType         = UITableViewCellAccessoryDisclosureIndicator;
//      self.accessoryView         = [UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow"];
        self.backgroundView        = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
    
}

-  (void)layoutSubviews{
    [super layoutSubviews];
    
    // imageView
    self.imageView.dl_y      = DLSmallMargin;
    self.imageView.dl_height = self.contentView.dl_height - DLSmallMargin*2;
    self.imageView.dl_width  = self.imageView.dl_height;
    
    // label
    if (self.imageView.image == nil) return;// 为了保证”离线下载“的位置不变
    self.textLabel.dl_x = self.imageView.dl_right + DLMargin;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
