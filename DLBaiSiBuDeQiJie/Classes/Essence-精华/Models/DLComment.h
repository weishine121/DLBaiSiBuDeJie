//
//  DLComment.h
//  DLBaiSiBuDeQiJie
//
//  Created by weishine on 16/5/25.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DLUser;

@interface DLComment : NSObject

/** 评论内容 */
@property (nonatomic, copy) NSString *content;

/** 用户(发表评论的人) */
@property (nonatomic, strong) DLUser *user;

@end
