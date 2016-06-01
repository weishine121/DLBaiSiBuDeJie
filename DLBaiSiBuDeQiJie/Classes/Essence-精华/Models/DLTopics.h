//
//  DLTopics.h
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/17.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DLTopicType) {
  /** 图片 */
  DLTopicTypePicture = 10,

  /** 段子 */
  DLTopicTypeWord = 29,

  /** 声音 */
  DLTopicTypeVoice = 31,

  /** 视频 */
  DLTopicTypeVideo = 41,

};
@class DLComment;

@interface DLTopics : NSObject

/** 用户的名字 */
@property (nonatomic, copy  ) NSString    *name;

/** 用户的头像 */
@property (nonatomic, copy  ) NSString    *profile_image;

/** 帖子的文字内容 */
@property (nonatomic, copy  ) NSString    *text;

/** 帖子审核通过的时间 */
@property (nonatomic, copy  ) NSString    *created_at;

/** 顶数量 */
@property (nonatomic, assign) NSInteger   ding;

/** 踩数量 */
@property (nonatomic, assign) NSInteger   cai;

/** 转发、分享数量 */
@property (nonatomic, assign) NSInteger   repost;

/** 评论数量 */
@property (nonatomic, assign) NSInteger   comment;

/** 最热评论 */
@property (nonatomic, strong) DLComment   *top_cmt;

/** 帖子类型 */
@property (nonatomic, assign) DLTopicType type;

/** 图片、视屏真实宽度 */
@property (nonatomic, assign) CGFloat     width;

/** 图片、视屏真实高度 */
@property (nonatomic, assign) CGFloat     height;

/** 小图 */
@property (nonatomic, copy  ) NSString    *small_image;

/** 中图 */
@property (nonatomic, copy  ) NSString    *middle_image;

/** 大图 */
@property (nonatomic, copy  ) NSString    *large_image;

/** 音频时长 */
@property (nonatomic, assign) NSInteger   voicetime;

/** 视频时长 */
@property (nonatomic, assign) NSInteger   videotime;

/** 音频\视频的播放次数 */
@property (nonatomic, assign) NSInteger   playcount;

/*** 额外增加的属性 ***/
/** cell高度 **/
@property (nonatomic, assign) CGFloat     cellHeight;

/** 中间内容的frame */
@property (nonatomic, assign) CGRect      contentF;

@end
