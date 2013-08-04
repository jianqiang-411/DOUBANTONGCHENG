//
//  SouSuoVC.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-4.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//
//UITableViewDelegate,
//UITableViewDataSource,
#import "SouSuoVC.h"
#import "PullingRefreshTableView.h"
#import "ASIHTTPRequest.h"
#import "EventData.h"
#import "Cell.h"
#import "ModelData.h"
#import "WebViewController.h"
#import "PViewController.h"
#import "MenuVC.h"
#import "Citys.h"
@interface SouSuoVC ()<PullingRefreshTableViewDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>


@property(nonatomic,strong)PullingRefreshTableView *prft;

@property(nonatomic,strong)NSMutableArray *Datalist;
@property(nonatomic,assign)BOOL isSearching;
@property(nonatomic,assign)BOOL bIsRefreshing;
@property(nonatomic,assign)NSInteger nStart;
@property(nonatomic,assign)NSInteger eventsTotal;
@property(nonatomic,strong)NSArray *arr1Picker;
@property(nonatomic,strong)Citys *city;
@property(nonatomic,strong)NSArray *arr2Picker;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)NSString *dayType;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,assign)NSInteger nDayTypeRow;
@property(nonatomic,assign)NSInteger nTypeRow;
@end

@implementation SouSuoVC

@synthesize prft,Datalist,frontpickerview,toolbar,pickerVC,btn1,dayType,type;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    ModelData *data = [ModelData shareModelData];
    
    if (data.City.name != nil) {
        self.city = [[Citys alloc]init];
        self.city = data.City;
        NSLog(@"city.id%@",_city.Id);
        [btn1 setTitle:data.City.name forState:UIControlStateNormal];
    }
    
   
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
   // [Datalist removeAllObjects];
    [prft launchRefreshing];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    dayType = @"future";
    type = @"all";
    self.arr1Picker=[[NSArray alloc]initWithObjects:@"全部时间",@"一周",@"今天",@"明天",@"周末", nil];
    self.arr2Picker=[[NSArray alloc]initWithObjects:@"全部类型",@"音乐",@"戏剧",@"展览",@"沙龙",@"聚会",@"运动",@"旅行",@"公益",@"电影",@"其他", nil];
     [self addObserver:self forKeyPath:@"city" options:NSKeyValueObservingOptionNew context:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 80, 33);
    [btn addTarget:self action:@selector(xuanze:) forControlEvents:UIControlEventTouchUpInside];
//    btn.tintColor = [UIColor clearColor];
    [btn setTitle:@"全部" forState:UIControlStateNormal];
    self.navigationItem.titleView = btn;
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"btn_nav_right_bg"] forState:UIControlStateNormal ] ;
    btn1.frame = CGRectMake(0, 0, 40, 30);
    [btn1 setTitle:@"城市" forState:UIControlStateNormal];
    [btn1.titleLabel setFont:[UIFont fontWithName:@"Arial" size:14.f]];
    [btn1 addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = barbtn;
    
        
    
    
    
    
    Datalist = [[NSMutableArray alloc]init];
	// Do any additional setup after loading the view.
    self.prft = [[PullingRefreshTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) pullingDelegate:self];
    self.prft.dataSource = self;
    self.prft.delegate = self;
    //self.view = self.prft;
    [self.view addSubview:prft];
    
    
    
    
    if (self.nStart == 0) {

        _bIsRefreshing = NO;
        [prft launchRefreshing];
    }

}
-(void)itemBtnClike:(UIBarButtonItem*)sender
{
    switch (sender.tag) {
        case 100:
        {
            //future未来, week星期,  today今天, tomorrow明天,weekend周末,
            //all全部,music音乐, drama话剧,exhibition展览,salon沙龙,  party派队, sports运动, travel旅游, commonweal公益, film电影,  others其他
            NSArray *arrp1=[[NSArray alloc]initWithObjects:@"future",@"week",@"today",@"tomorrow",@"weekend", nil];
            NSArray *arrp2=[[NSArray alloc]initWithObjects:@"all",@"music",@"drama",@"exhibition",@"salon",@"party",@"sports",@"travel",@"commonweal",@"film",@"others", nil];
            //NSArray *arr1 = @[@"future", @"week",@"today", @"tomorrow",@"weekend"];
            dayType = [arrp1 objectAtIndex:_nDayTypeRow];
            type = [arrp2 objectAtIndex:_nTypeRow];
            NSLog(@"daType%@",dayType);
            NSLog(@"Type%@",type);
            Datalist = [[NSMutableArray alloc]init];
            NSLog(@"dataList%@",Datalist);
            [pickerVC removeFromSuperview];
            [toolbar removeFromSuperview];
            [frontpickerview removeFromSuperview];
            //[self loadData];
            [prft launchRefreshing];
        }
            break;
        case 101:
            [pickerVC removeFromSuperview];
            [toolbar removeFromSuperview];
            [frontpickerview removeFromSuperview];
            break;
        default:
            break;
    }
}
-(void)push
{
    MenuVC *menuVC = [[MenuVC alloc]init];
    [self.navigationController pushViewController:menuVC animated:YES];
}

-(void)showPickerView{
    frontpickerview = [[UIView alloc]initWithFrame: CGRectMake(0, 0, kDeviceWidth, KDeviceHeight)];
    frontpickerview.backgroundColor = [UIColor blackColor];
    [frontpickerview setHidden:YES];
    [frontpickerview setAlpha:0.6];
    [self.view addSubview:frontpickerview];
    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, KDeviceHeight, kDeviceWidth, 44)];
    [toolbar setBarStyle:UIBarStyleBlack];
    [toolbar setAlpha:1.0];
    [toolbar setHidden:YES];
    UIBarButtonItem *Okbtn = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStyleDone target:self action:@selector(itemBtnClike:)];
    Okbtn.tag = 100;
    Okbtn.title = @"确定";
    UIBarButtonItem* it = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *Canelbtn = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStyleDone target:self action:@selector(itemBtnClike:)];
    Canelbtn.title = @"取消";
    Canelbtn.tag = 101;
    NSArray* items = @[Okbtn,it,Canelbtn];
    toolbar.items = items;
    //    [toolbar addSubview:Okbtn];
    pickerVC = [[UIPickerView alloc]initWithFrame:CGRectMake(0, KDeviceHeight+44, kDeviceWidth, 216)];
    [pickerVC setShowsSelectionIndicator:YES];
    [pickerVC setDelegate:self];
    [pickerVC setHidden:YES];
    [self.view addSubview: pickerVC];
    
    [self.view addSubview:toolbar];

    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];
    self.pickerVC.frame = CGRectMake(0, KDeviceHeight-329, kDeviceWidth, 216);
    [toolbar setFrame:CGRectMake(0, KDeviceHeight-373, kDeviceWidth, 44)];
    [frontpickerview setHidden:NO];
    [pickerVC setHidden:NO];
    [toolbar setHidden:NO];
    [frontpickerview setFrame:CGRectMake(0, 0, 320, 200)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

-(void)xuanze:(UIButton*)sender
{
//    NSLog(@"aaa");
    [self showPickerView];
//    PViewController *pvc = [[PViewController alloc]init];
//    
//    pvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    
//    [self presentViewController:pvc animated:YES completion:^{}];
}



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [prft tableViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [prft tableViewDidEndDragging:scrollView];
}
#pragma mark - UITableViewDataSourceDelegate

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    NSLog(@"[Datalist count]%i",[Datalist count]);
    return [Datalist count];
}

- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* strIndentifier = @"ContentVC_Cell";
    Cell* cell = [tableView dequeueReusableCellWithIdentifier:strIndentifier];
    
    if (!cell) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIndentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    EventData *et = [Datalist objectAtIndex:indexPath.row];
    [cell configCell:et];
    return cell;
}

// 返回指定indexPath位置的Cell的高度
- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 186.f;
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventData *data = [Datalist objectAtIndex:indexPath.row];
    WebViewController *webView = [[WebViewController alloc]init];
    webView.str = data.event_Adapt_URL;
    [self.navigationController pushViewController:webView animated:YES];
    NSLog(@"%@",data.event_Alt);
}



#pragma mark - PullingRefreshTableViewDelegate
// 开始刷新
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView {
    self.bIsRefreshing = YES;
    self.nStart  = 0;
    // 延迟调用数据刷新方法
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0.1]; 

}

// 开始加载更多
- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView {
     
    [self performSelector:@selector(loadData) withObject:nil afterDelay:0.1f];
}

-(void)LoadDataType:(getEvents)_type
{
    self.nStart = 0;
    self.geteventstype = _type;
    [prft launchRefreshing];
}
#pragma mark - Custum Method

- (void)loadData {
    if (self.bIsRefreshing) {
        self.nStart = 0 ;
        self.bIsRefreshing = NO;
        [Datalist removeAllObjects];
    }
    NSURL *url = [[NSURL alloc]init];
    if (_city.Id == nil) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.douban.com/v2/event/list?loc=108296&day_type=%@&type=%@",dayType,type]];
    }
    else{
        url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.douban.com/v2/event/list?loc=%@&day_type=%@&type=%@",_city.Id,dayType,type]];
    }

       NSLog(@"url%@",url);
    //future未来, week星期, weekend周末, today今天, tomorrow明天
    
    //all全部,music音乐, film电影, drama话剧, commonweal公益, salon沙龙, exhibition展览, party派队, sports运动, travel旅游, others其他
    
    
    ASIHTTPRequest* request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
        NSError *error = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:kNilOptions error:&error];
        self.eventsTotal = [[dic objectForKey:@"total"] integerValue];
        NSArray *arr1 = [dic objectForKey:@"events"];
        for (NSDictionary*temp in arr1) {
            EventData *event = [[EventData alloc]initWithDictionary:temp];
            NSLog(@"--------------------%@------------------",event);
            [Datalist addObject:event];
        }
        
        NSLog(@"%@",Datalist);
        self.bIsRefreshing = NO;
        self.nStart = [Datalist count];
        
        if ([Datalist count]>self.eventsTotal) {
            [prft tableViewDidFinishedLoadingWithMessage:@"下面没有了.."];
            [NSThread detachNewThreadSelector:@selector(displayImage:) toTarget:self withObject:nil];
            prft.reachedTheEnd  = YES;
        } else
        {
            [prft tableViewDidFinishedLoading];
            prft.reachedTheEnd  = NO;
            [prft reloadData];
        }

    }];
    
    
    [request setFailedBlock:^{
        _bIsRefreshing = NO;
        [prft tableViewDidFinishedLoading];
        UIAlertView *alx = [[UIAlertView alloc]initWithTitle:@"提示" message:@"网络连接异常，请检查网络环境..." delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alx show];
    }];
    
    [request startAsynchronous];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0)
        return [self.arr1Picker count];
    else if (component==1)
        return [self.arr2Picker count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //NSLog(@"component:%i",component);
    if (component==0) {
        return [self.arr1Picker objectAtIndex:row];
    }
    else if (component==1)
    {
        return [self.arr2Picker objectAtIndex:row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.nDayTypeRow = row;
        NSLog(@"1%i========",self.nDayTypeRow);
    }
    else if (component == 1)
    {
        self.nTypeRow = row;
        NSLog(@"2%i======",self.nTypeRow);
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
