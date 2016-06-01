//
//  DLTopics.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/17.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLComment.h"
#import "DLComment.h"
#import "DLTopics.h"
#import "DLUser.h"
#import "MJExtension.h"

static NSDateFormatter *fmt_;
static NSCalendar *calendar_;

@implementation DLTopics

//+ (NSDictionary *)mj_objectClassInArray{
//    return @{@"top_cmt" : [DLComment class]};
//}

/**
 *  在第一次使用DLTopics类时调用一次
 */
+ (void)initialize {
  fmt_ = [[NSDateFormatter alloc] init];

  // 获取calendar
  calendar_ = [NSCalendar dl_calendar];
}

- (NSString *)created_at {
  fmt_.dateFormat = @"yyyy-MM-dd HH-mm-ss";

  // 获得发帖日期
  NSDate *createAtDate = [fmt_ dateFromString:_created_at];

  if (createAtDate.isThisYear) { // 今年
    if (createAtDate.isToday) {  // 今天
      // 手机当前时间
      NSDate *nowDate = [NSDate date];
      NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth |
                            NSCalendarUnitDay | NSCalendarUnitHour |
                            NSCalendarUnitMinute | NSCalendarUnitSecond;
      NSDateComponents *cmps = [calendar_ components:unit
                                            fromDate:createAtDate
                                              toDate:nowDate
                                             options:0];

      if (cmps.hour >= 1) { // 时间间隔 >= 1小时
        return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
      } else if (cmps.minute >= 1) { // 1小时 > 时间间隔 >= 1分钟
        return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
      } else { // 1分钟 > 分钟
        return @"刚刚";
      }

    } else if (createAtDate.isYesterday) { // 昨天
      fmt_.dateFormat = @"昨天 HH:mm:ss";
      return [fmt_ stringFromDate:createAtDate];

    } else { // 其他

      fmt_.dateFormat = @"MM-dd HH:mm:ss";
      return [fmt_ stringFromDate:createAtDate];
    }

  } else { // 非今年
  }
  return _created_at;
}

- (CGFloat)cellHeight {
  // 如果cell的高度已经计算过，就直接返回
  if (_cellHeight)
    return _cellHeight;

  // 头像
  _cellHeight = 55;

  // 文字
  CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 2 * DLMargin;
  CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
  //  CGSize textSize = [self.text sizeWithFont:[UIFont systemFontOfSize:14]
  //                          constrainedToSize:textMaxSize];
  CGSize textSize =
      [self.text boundingRectWithSize:textMaxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{
                             NSFontAttributeName : [UIFont systemFontOfSize:14]
                           }
                              context:nil]
          .size;
  _cellHeight += textSize.height + DLMargin;

  // 中间内容
  if (self.type !=DLTopicTypeWord) { // 如果是图片\声音\视频帖子, 才需要计算中间内容的高度
    // 中间内容的高度 == 中间内容的宽度 * 图片的真实高度 / 图片的真实宽度
    CGFloat contentH = textMaxW * self.height / self.width;
      self.contentF = CGRectMake(DLMargin, _cellHeight, textMaxW, contentH);

    _cellHeight += contentH + DLMargin;
  }
    
  // 4.最热评论
  if (self.top_cmt) { // 如果有最热评论
    // 最热评论-标题
    _cellHeight += 20;
    // 最热评论-内容
    NSString *topCmtContent =
        [NSString stringWithFormat:@"%@ : %@", self.top_cmt.user.username,
                                   self.top_cmt.content];
    // CGSize topCmtContentSize = [topCmtContent sizeWithFont:[UIFont
    // systemFontOfSize:14] constrainedToSize:textMaxSize];
    CGSize topCmtContentSize =
        [topCmtContent
            boundingRectWithSize:textMaxSize
                         options:NSStringDrawingUsesLineFragmentOrigin
                      attributes:@{
                        NSFontAttributeName : [UIFont systemFontOfSize:14]
                      }
                         context:nil]
            .size;
    _cellHeight += topCmtContentSize.height + DLMargin;
  }

  // 5.底部 - 工具条
  _cellHeight += 55 + DLMargin;

  return _cellHeight;
}
@end
/**
 // _created_at == @"2015-11-20 09:10:05"
 // _created_at -> @"刚刚" \ @"10分钟前" \ @"5小时前" \ @"昨天 09:10:05" \
 @"11-20 09:10:05" \ @"2015-11-20 09:10:05"

 今年
 今天
 时间间隔 >= 1小时 - @"5小时前"
 1小时 > 时间间隔 >= 1分钟 - @"10分钟前"
 1分钟 > 分钟 - @"刚刚"
 昨天 - @"昨天 09:10:05"
 其他 - @"11-20 09:10:05"


 非今年 - @"2015-11-20 09:10:05"

 */