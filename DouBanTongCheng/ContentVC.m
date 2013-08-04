//
//  ContentVC.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-4.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "ContentVC.h"

#import "ASIHTTPRequest.h"
#import "MenuVC.h"
#import "ModelData.h"
#import "Citys.h"
#import "EventData.h"
#import "GalleryCell.h"
#import "EMAsyncImageView.h"
#import "WebViewController.h"
#import "SliderSwitch.h"
#import <QuartzCore/QuartzCore.h>

@interface ContentVC ()<SliderSwitchDelegate>

@property(nonatomic,strong)UIButton *btn;

@property(nonatomic,strong)NSMutableArray *dataList;

@property(nonatomic,strong)NSMutableArray *bigImgArr;

@property(nonatomic,strong)Citys *city;

@property(nonatomic,strong) SliderSwitch *slider;
@property (nonatomic,strong) UIImageView *imgVWS;

@property(nonatomic,strong)NSString *dayType;
@end

@implementation ContentVC
@synthesize btn,dataList,bigImgArr,slider,imgVWS;

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
        self.city = data.City;
        NSLog(@"city.id%@",_city.Id);
        [btn setTitle:data.City.name forState:UIControlStateNormal];
    }

    [self loadData];
}
- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"";
    imgVWS = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SlidSwich.jpg"]];
    imgVWS.userInteractionEnabled = YES;
    imgVWS.frame = CGRectMake(0, 0, 180, 29);
    slider = [[SliderSwitch alloc]init];
    [slider setFrameHorizontal:CGRectMake(0, 0, 180, 29) numberOfFields:3 withCornerRadius:4.f];
    [slider setTextColor:[UIColor whiteColor]];
    [slider setText:@"热点" forTextIndex:1];
    [slider setText:@"周末" forTextIndex:2];
    [slider setText:@"今日" forTextIndex:3];
    [slider setFrameBackgroundColor:[UIColor clearColor]];
    [slider setSwitchFrameColor:[UIColor clearColor]];
    [slider setSwitchBorderWidth:2.f];
    [slider setBackgroundColor:[UIColor clearColor]];
    slider.delegate =self;
    [imgVWS addSubview:slider];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc]initWithCustomView:imgVWS];
    self.navigationItem.leftBarButtonItem = bar;
    [imgVWS.layer setCornerRadius:5.f];
    [imgVWS.layer setMasksToBounds:YES];
    //
    [self.collectionView registerNib:[UINib nibWithNibName:@"GalleryCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_nav_right_bg"] forState:UIControlStateNormal ] ;
    btn.frame = CGRectMake(0, 0, 40, 30);
    [btn setTitle:@"城市" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont fontWithName:@"Arial" size:14.f]];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barbtn;
  
     //添加观察者，观察对象只能用 self.XXX 来赋值
    [self addObserver:self forKeyPath:@"dayType" options: NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self loadData];
}



#pragma mark - 自定义函数
-(void)loadData
{
    UIActivityIndicatorView  *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	activity.center = self.view.center;
	activity.hidesWhenStopped = TRUE;
	[self.view addSubview:activity];
	[activity startAnimating];
    NSURL *url = [[NSURL alloc]init];
    if (_city.Id == nil) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.douban.com/v2/event/list?loc=108296&day_type=%@&type=all",_dayType]];
    }
    else{
        url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.douban.com/v2/event/list?loc=%@&day_type=%@&type=all",_city.Id,_dayType]];
    }
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];

    //future未来, week星期, weekend周末, today今天, tomorrow明天
    
   
    
    [request setCompletionBlock:^{
        dataList = [[NSMutableArray alloc]init];
        bigImgArr = [[NSMutableArray alloc]init];
        NSError *error = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:kNilOptions error:&error];
        
        NSArray *arr1 = [dic objectForKey:@"events"];
        for (NSDictionary*temp in arr1) {
            EventData *event = [[EventData alloc]initWithDictionary:temp];
            NSLog(@"--------------------%@------------------",[event debugDescription]);
            //[bigImgArr addObject:event.image_hlarge];
            [dataList addObject:event];
            [bigImgArr addObject:event.event_hLargeImageURL];
        }
        NSLog(@"bigImgArr%@",bigImgArr);
        NSLog(@"%@",dataList);
        [self.collectionView reloadData];
        
		[activity stopAnimating];
		[activity removeFromSuperview];

    }];
    
    [request setFailedBlock:^{
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请检查网络" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alt show];
    }];
    [request startAsynchronous];
}

#pragma mark Collection View Methods
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section { return UIEdgeInsetsMake(10, 10, 10, 10); }

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section { return [bigImgArr count]; }

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {	return CGSizeMake(140, 140); }

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
	GalleryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
	cell.picView.imageUrl = [bigImgArr objectAtIndex:indexPath.row];
	return cell;
}


-(void)push
{
    MenuVC *menuVC = [[MenuVC alloc]init];
    [self.navigationController pushViewController:menuVC animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    EventData *data = [dataList objectAtIndex:indexPath.row];
    WebViewController *webView = [[WebViewController alloc]init];
    webView.str = data.event_Adapt_URL;
    NSLog(@"=====%@",data.event_Adapt_URL);
    [self.navigationController pushViewController:webView animated:YES];
    NSLog(@"%@",data.event_Alt);
}
-(void)slideView:(SliderSwitch *)slideswitch switchChangedAtIndex:(NSUInteger)index
{
    NSLog(@"%i",index);
    switch (index) {
        case 0:
            self.dayType = @"week";
            break;
        case 1:
            self.dayType = @"weekend";
            break;
        case 2:
            self.dayType = @"today";
            break;
        default:
            break;
    }
}
@end
