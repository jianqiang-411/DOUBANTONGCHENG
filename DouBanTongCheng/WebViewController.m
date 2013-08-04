//
//  WebViewController.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-16.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "WebViewController.h"
#import "SHSShareViewController.h"
@interface WebViewController ()

@end

@implementation WebViewController
@synthesize webView,str;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, -44, self.view.frame.size.width, self.view.frame.size.height)];
    
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *requst = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requst];
    [self.view addSubview: webView];
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    lbtn.frame = CGRectMake(0, 0, 40, 30);
    [lbtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    [lbtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *lbar = [[UIBarButtonItem alloc]initWithCustomView:lbtn];
    UIButton *rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rbtn.frame = CGRectMake(0, 0, 40, 30);
    [rbtn addTarget:self action:@selector(fenxiang) forControlEvents:UIControlEventTouchUpInside];
    [rbtn setBackgroundImage:[UIImage imageNamed:@"btn_nav_share"] forState:UIControlStateNormal];
    UIBarButtonItem *rbar = [[UIBarButtonItem alloc]initWithCustomView:rbtn];
    self.navigationItem.rightBarButtonItem = rbar;

    self.navigationItem.leftBarButtonItem = lbar;
}

-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)fenxiang
{
    SHSShareViewController *shareView = [[SHSShareViewController alloc]initWithRootViewController:self];
    
    [shareView.view setFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight)];
    [self.view addSubview:shareView.view];
    shareView.sharedtitle = @"线下活动搜集展示";
   // shareView.sharedText = mySelectEvent.event_title;
    shareView.sharedURL =@"http://www.douban.com";
    //shareView.sharedImageURL = mySelectEvent.event_hLargeImageURL;
    [shareView showShareKitView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
