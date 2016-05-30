//
//  CustomPagerController.m
//  TYPagerControllerDemo
//
//  Created by tany on 16/5/17.
//  Copyright © 2016年 tanyang. All rights reserved.
//

#import "CustomPagerController.h"
#import "SJUBBCController.h"
#import "SJUNovelController.h"
#import "SJUFunController.h"
#import "SJURankController.h"

@interface CustomPagerController ()

@end

@implementation CustomPagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.adjustStatusBarHeight = YES;
    self.cellSpacing = 8;
    self.cellWidth = self.view.dl_width/4;
    self.showNavBar = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!_showNavBar) {
        self.navigationController.navigationBarHidden = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (!_showNavBar) {
        self.navigationController.navigationBarHidden = NO;
    }
}

// if you costom progress property  ovrride this
- (void)setBarStyle:(TYPagerBarStyle)barStyle
{
    barStyle =  TYPagerBarStyleCoverView;
    [super setBarStyle:barStyle];
}

#pragma mark - TYPagerControllerDataSource

- (NSInteger)numberOfControllersInPagerController
{
    return 4;
}


- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index
{
//    return index %2 == 0 ? [NSString stringWithFormat:@"Tab %ld",index]:[NSString stringWithFormat:@"Tab Tab %ld",index];
    
    if (index == 0) {
        return @"BBC";
    }else if(index == 1){
        return @"小说";
    }else if(index == 2){
        return @"娱乐";
    }else{
        return @"排行榜";
    }
    
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index
{
    if (index == 0) {
        SJUBBCController *VC = [[SJUBBCController alloc]init];
        return VC;
    }else if (index == 1) {
        SJUNovelController *VC = [[SJUNovelController alloc]init];
        return VC;
    }else if (index == 2) {
        SJUFunController *VC = [[SJUFunController alloc]init];
        return VC;
    }else {
        SJURankController *VC = [[SJURankController alloc]init];
        return VC;
    }
}

#pragma mark - override delegate

// configure cell need call super
- (void)pagerController:(TYTabPagerController *)pagerController configreCell:(TYTabTitleViewCell *)cell forItemTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath
{
    [super pagerController:pagerController configreCell:cell forItemTitle:title atIndexPath:indexPath];
    // configure cell
}

- (void)pagerController:(TYTabPagerController *)pagerController didSelectAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectAtIndexPath %@",indexPath);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
