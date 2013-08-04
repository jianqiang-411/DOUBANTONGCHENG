//
//  LYXViewController.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-4.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "LYXViewController.h"
#import "ASIFormDataRequest.h"
@interface LYXViewController ()<UIWebViewDelegate>

@end

@implementation LYXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *Path = @"https://www.douban.com/service/auth2/auth?client_id=059da36417b60b3110d8ea2c47222193&&redirect_uri=http://www.baidu.com/&response_type=code";
    NSURL *url = [NSURL URLWithString:Path];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    webView.delegate = self;
    [self.view addSubview:webView];
    [webView loadRequest:request];

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];
    NSLog(@"%@",url);
    NSString *path = [NSString stringWithFormat:@"%@",url];
    NSLog(@"%@path",path);
    NSRange rang = [path rangeOfString:@"code="];
    if (rang.location != NSNotFound) {
        NSArray *arr = [path componentsSeparatedByString:@"="];
        NSString*code = [arr objectAtIndex:1];
        NSLog(@"code= %@",code);
        [self getAccessToken:code];
    }
    return true;
}
//https://www.douban.com/service/auth2/token
-(void)getAccessToken:(NSString*)code
{
    NSURL *url = [NSURL URLWithString:@"https://www.douban.com/service/auth2/token"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc]initWithURL:url];
    [request setPostValue:@"059da36417b60b3110d8ea2c47222193" forKey:@"client_id"];
    [request setPostValue:@"f58d07adab0f5727" forKey:@"client_secret"];
    [request setPostValue:@"http://www.baidu.com" forKey:@"redirect_uri"];
    [request setPostValue:@"authorization_code" forKey:@"grant_type"];
    [request setPostValue:code forKey:@"code"];
    
    [request setCompletionBlock:^{
        NSError *error = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:kNilOptions error:&error];
        NSString *access_token = [dic objectForKey:@"access_token"];
        NSString *refresh_token = [dic objectForKey:@"refresh_token"];
        NSInteger expires_in = [[dic objectForKey:@"expires_in"]integerValue];
        NSInteger douban_user_id = [[dic objectForKey:@"douban_user_id"]integerValue];
        NSLog(@"%@,%@,%i,%i",access_token,refresh_token,expires_in,douban_user_id);
        
    }];
    [request setFailedBlock:^{
        UIAlertView *alx = [[UIAlertView alloc]initWithTitle:@"提示" message:@"发送失败！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alx show];
    }];
    [request startAsynchronous];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
