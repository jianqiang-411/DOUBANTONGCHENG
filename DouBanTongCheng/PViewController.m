//
//  PViewController.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-17.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "PViewController.h"

@interface PViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)NSArray *arr1Picker;

@property(nonatomic,strong)NSArray *arr2Picker;

@end

@implementation PViewController

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
    // Do any additional setup after loading the view from its nib.
    self.pickerVC.dataSource =self;
    self.pickerVC.delegate =self;
    self.arr1Picker=[[NSArray alloc]initWithObjects:@"全部时间",@"一周",@"今天",@"明天",@"周末", nil];
    self.arr2Picker=[[NSArray alloc]initWithObjects:@"全部类型",@"音乐",@"戏剧",@"展览",@"沙龙",@"聚会",@"运动",@"旅行",@"公益",@"电影",@"其他", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClike:(UIBarButtonItem *)sender {
    
    switch (sender.tag) {
        case 100:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case 101:
             [self dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            break;
    }
    
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

@end
