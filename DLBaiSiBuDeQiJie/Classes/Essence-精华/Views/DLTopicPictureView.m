//
//  DLTopicPictureView.m
//  4期-百思不得姐
//
//  Created by xiaomage on 15/10/18.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "DLTopicPictureView.h"
#import "UIImageView+WebCache.h"
#import "DLTopics.h"
#import "AFNetworking.h"
#import "DALabeledCircularProgressView.h"

@interface DLTopicPictureView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;
@end

@implementation DLTopicPictureView

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
    self.progressView.roundedCorners = 5;
    self.progressView.progressLabel.textColor = [UIColor whiteColor];
    
    self.imageView.userInteractionEnabled = YES;
}

- (void)setTopic:(DLTopics *)topic{
    _topic = topic;
    
   [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    
    CGFloat progress = 1.0 * receivedSize / expectedSize;
    self.progressView.progress = progress;
    self.progressView.hidden = NO;
    
    self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.0f%%", progress * 100];
} completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    self.progressView.hidden = YES;
}];

}
@end
