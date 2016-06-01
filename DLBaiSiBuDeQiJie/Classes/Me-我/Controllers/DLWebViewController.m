//
//  DLWebViewController.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/14.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "DLWebViewController.h"
#import "MJExtension.h"

@interface DLWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView       *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@end

@implementation DLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
    
}

#pragma mark -
#pragma mark -  监听点击

- (IBAction)reload:(id)sender {
    [self.webView reload];
}

- (IBAction)back:(id)sender {
    
    [self.webView goBack];
}

- (IBAction)forward:(id)sender {

    [self.webView goForward];
}

#pragma mark -
#pragma mark -  webView代理
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    self.backItem.enabled    = webView.canGoBack;
    self.forwardItem.enabled = webView.canGoForward;
}



@end
