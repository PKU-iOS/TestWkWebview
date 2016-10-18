//
//  ViewController.m
//  TestWkWebview
//
//  Created by ys on 2016/9/27.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

#import <WebKit/WebKit.h>

@interface ViewController ()<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.userContentController = [[WKUserContentController alloc] init];
    [config.userContentController addScriptMessageHandler:self name:@"AppModel"];
    
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:config];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    
    
    NSURL *path = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
    [webView loadRequest:[NSURLRequest requestWithURL:path]];

}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    if ([message.name isEqualToString:@"AppModel"]) {
        NSLog(@"%@", message.body);
    }
}

@end
