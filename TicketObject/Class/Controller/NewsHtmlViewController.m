//
//  NewsHtmlViewController.m
//  TicketObject
//
//  Created by 沈阳 on 2018/5/28.
//  Copyright © 2018年 沈阳. All rights reserved.
//

#import "NewsHtmlViewController.h"
#import <WebKit/WebKit.h>

@interface NewsHtmlViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic,strong) WKWebView * wkWebView;
@end

@implementation NewsHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.listModel.title;
    [self creatBaseUI];
}
-(void)creatBaseUI{
    self.wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, WindowWidth, WindowHeight)];
    self.wkWebView.UIDelegate = self;
    self.wkWebView.navigationDelegate = self;
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.listModel.url]];
    [self.wkWebView loadRequest:request];
    [self.view addSubview:self.wkWebView];
}
/// 2 页面开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"-------1111");
    [MBProgressHUD showMessage:@"加载中..." toView:self.view];
}
/// 4 开始获取到网页内容时返回
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"-------2222");
}
/// 5 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"-------3333");
    [MBProgressHUD hideHUDForView:self.view];
}
/// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"-------4444");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
