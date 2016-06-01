//
//  DLAllViewController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/16.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLAllViewController.h"
//#import "AFNetworking.h"
#import "DLEssenceViewController.h"
#import "DLHTTPSessionManager.h"
#import "DLRefreshFooter.h"
#import "DLRefreshHeader.h"
#import "DLTopicCell.h"
#import "DLTopics.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

@interface DLAllViewController () <UIViewControllerPreviewingDelegate>

/** 把这里的strong写成了weak -- 导致数据加载不出来*/
@property(nonatomic, strong) NSMutableArray<DLTopics *> *topics;

/** maxtime : 用来加载下一页数据 */
@property(nonatomic, copy) NSString *maxtime;

/** 任务管理者 */
@property(nonatomic, strong) DLHTTPSessionManager *manager;
@end

@implementation DLAllViewController

static NSString *const DLTopicCellId = @"topic";

#pragma mark -
#pragma mark -  懒加载
- (DLHTTPSessionManager *)manager {
  if (!_manager) {
    _manager = [DLHTTPSessionManager manager];
  }
  return _manager;
}

#pragma mark -
#pragma mark -  初始化
- (void)viewDidLoad {
  [super viewDidLoad];

  [self loadNewTopics];

  [self setupRefresh];

  [self setupTable];
}

- (void)setupTable {
  self.tableView.backgroundColor = DLCommonBgColor;

  //    self.tableView.rowHeight = 200;

  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

  [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(
                                                        [DLTopicCell class])
                                             bundle:nil]
       forCellReuseIdentifier:DLTopicCellId];
  // 内边距
  self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
  self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}
- (void)setupRefresh {
  self.tableView.mj_header =
      [DLRefreshHeader headerWithRefreshingTarget:self
                                 refreshingAction:@selector(loadNewTopics)];

  self.tableView.mj_footer =
      [DLRefreshFooter footerWithRefreshingTarget:self
                                 refreshingAction:@selector(loadMoreTopics)];
}

- (void)loadNewTopics {
  // 取消所有请求
  [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];

  NSMutableDictionary *params = [NSMutableDictionary dictionary];

  params[@"a"] = @"list";
  params[@"c"] = @"data";
  params[@"type"] = @"1";

  [self.manager GET:DLCommonUrl
      parameters:params
      progress:nil
      success:^(NSURLSessionDataTask *_Nonnull task,id _Nullable responseObject) {

        // 存储maxtime(方便用来加载下一页数据)
        self.maxtime = responseObject[@"info"][@"maxtime"];

        //      [responseObject
        //      writeToFile:@"/Users/imac11/Desktop/DLExtension/me.plist"
        //      atomically:YES];
        self.topics =
            [DLTopics mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];

        // 刷新表格
        [self.tableView reloadData];

        // 结束刷新
        [self.tableView.mj_header endRefreshing];

      }
      failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {

        // 结束刷新
        [self.tableView.mj_header endRefreshing];
      }];
}

- (void)loadMoreTopics {
  // 取消所有请求
  [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];

  NSMutableDictionary *params = [NSMutableDictionary dictionary];

  params[@"a"] = @"list";
  params[@"c"] = @"data";
  params[@"maxtime"] = self.maxtime;
  params[@"type"] = @"1";

  [self.manager GET:DLCommonUrl
      parameters:params
      progress:nil
      success:^(NSURLSessionDataTask *_Nonnull task,
                id _Nullable responseObject) {

        // 存储maxtime(方便用来加载下一页数据)
        self.maxtime = responseObject[@"info"][@"maxtime"];

        // 字典数组 -> 模型数组
        NSArray<DLTopics *> *moreTopics =
            [DLTopics mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:moreTopics];

        // 刷新表格
        [self.tableView reloadData];

        // 结束刷新
        [self.tableView.mj_footer endRefreshing];

      }
      failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {

        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
      }];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  DLTopicCell *cell =
      [tableView dequeueReusableCellWithIdentifier:DLTopicCellId];

  cell.topic = self.topics[indexPath.row];

  [self registerForPreviewingWithDelegate:self sourceView:cell];

  return cell;
}

- (UIViewController *)previewingContext:
                          (id<UIViewControllerPreviewing>)previewingContext
              viewControllerForLocation:(CGPoint)location {
  DLEssenceViewController *touch = [[DLEssenceViewController alloc] init];

  CGRect rect =
      CGRectMake(10, location.y - 10, self.view.frame.size.width - 20, 50);
  previewingContext.sourceRect = rect;

  return touch;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext
     commitViewController:(UIViewController *)viewControllerToCommit {
  //    [self tableView:self.tableView didSelectRowAtIndexPath:self.indexPath];
  [self showViewController:viewControllerToCommit sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return self.topics[indexPath.row].cellHeight;
}

@end

/**
 写代码过程中遇到的问题：
 *  数据加载不出来：解决 -> 1.topics 用strong。 2.得到数据后 调用reloadData
 */
