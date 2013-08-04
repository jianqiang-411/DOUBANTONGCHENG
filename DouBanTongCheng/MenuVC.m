//
//  MenuVC.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-4.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "MenuVC.h"
#import "ASIHTTPRequest.h"
#import "Citys.h"
#import "ModelData.h"
@interface MenuVC ()<UISearchDisplayDelegate,UISearchBarDelegate, UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)NSMutableArray *cityArr;
@property(nonatomic,strong)UITableView *cityTable;
@property(nonatomic,strong)UISearchDisplayController *citySearchDC;
@property(nonatomic,strong)UISearchBar *citySearchBar;

@end

@implementation MenuVC
@synthesize cityArr,cityTable,citySearchDC,citySearchBar;
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
    cityArr = [[NSMutableArray alloc]init];
	// Do any additional setup after loading the view.
    [self loadData];
    citySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    cityTable = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.cityTable.tableHeaderView = citySearchBar;
    citySearchDC = [[UISearchDisplayController alloc]initWithSearchBar:citySearchBar contentsController:self];
    citySearchDC.delegate = self;
    citySearchDC.searchResultsDataSource = self;
    citySearchDC.searchResultsDelegate = self;
    
    
    
    cityTable.dataSource = self;
    cityTable.delegate = self;
    self.view = cityTable;
    self.title = @"选择城市";
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 30);
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_nav_back_bg"] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backbtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backbtn;
}
#pragma mark - 自定义函数
-(void)loadData
{
    NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/loc/list"];
    
    ASIHTTPRequest* request = [ASIHTTPRequest requestWithURL:url];
    [request setCompletionBlock:^{
        NSError* error = nil;
        NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:kNilOptions error:&error];
        if (error) {
            NSLog(@"NSJSONSerialization error : %@", [error localizedDescription]);
            return;
        }
        
        NSArray *arr = [dic objectForKey:@"locs"];
        NSLog(@"dic%@",arr);
        for (NSDictionary *temp in arr) {
            Citys *city = [[Citys alloc]initWithCity:temp];
            [self.cityArr addObject:city];
        }
        ModelData *data = [ModelData shareModelData];
        data.arrCity = self.cityArr;
        [cityTable reloadData];
    }];
    
    [request startAsynchronous];

}
-(void)pop
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cityArr count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"nnnn";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text = ((Citys*)[cityArr objectAtIndex:indexPath.row]).name;
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelData *data = [ModelData shareModelData];
    data.City = [cityArr objectAtIndex:indexPath.row];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - UISearchDisplayDelegate ？？？
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    for (Citys *temp in cityArr) {
        if ([temp.name isEqualToString:searchString]) {
            cityArr = [[NSMutableArray alloc]init];
            [cityArr addObject:temp];
        }
    }
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
