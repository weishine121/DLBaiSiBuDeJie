//
//  DLTopicVoiceView.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/17.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "DLTopicVoiceView.h"

#import "UIImageView+WebCache.h"

@interface DLTopicVoiceView ()
@property(weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property(weak, nonatomic) IBOutlet UILabel *voiceTimeLabel;
@property(weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation DLTopicVoiceView
- (void)awakeFromNib {
  self.autoresizingMask = UIViewAutoresizingNone;
}

@end
