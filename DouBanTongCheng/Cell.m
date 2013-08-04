//
//  Cell.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "Cell.h"
#import "EGOImageView.h"
#import "EGOImageButton.h"
#import "EventData.h"
@implementation Cell
@synthesize ImageView,TitleLable,TimeLable,TypeLable,WisherLable,ParticipantLable,AddressLable,backGroundImageview;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backGroundImageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell.png"]];
        self.backGroundImageview.frame = CGRectMake(10, 6, 300,174);
        [self addSubview:self.backGroundImageview];

        
        
        self.TitleLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 6, 300, 32)];
        [self.TitleLable setFont:[UIFont fontWithName:@"Arial" size:18]];
//        UIColor* testcolor = [UIColor colorWithRed:89.f/250 green:149.f/250 blue:230.f/250 alpha:0.9f];
//        self.TitleLable.backgroundColor = testcolor;
        self.TitleLable.backgroundColor=[UIColor clearColor];
        [self addSubview:self.TitleLable];
        
        
        self.ImageView = [[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"Pic_thumb.png"] delegate:self];
         self.ImageView.frame = CGRectMake(210, 48, 96, 120) ;
        self.ImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.ImageView];
        
        self.LableTime = [[UILabel alloc]initWithFrame:CGRectMake(20, 45, 18, 18)] ;
        
//        self.LableTime.text = @"时间:";
        UIImageView *imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_date"]];
        imageview.frame=self.LableTime.bounds;
        [imageview setContentMode:UIViewContentModeScaleAspectFit];
        [self.LableTime addSubview:imageview];
        self.LableTime.backgroundColor = [UIColor clearColor];
        self.TimeLable = [[UILabel alloc]initWithFrame:CGRectMake(42, 44, 154, 24)];
        self.TimeLable.backgroundColor = [UIColor clearColor];
        [self.LableTime setFont:[UIFont fontWithName:@"Arial" size:14]];
        [self.TimeLable setFont:[UIFont fontWithName:@"Arial" size:13]];
        
        [self addSubview:self.LableTime];
        [self addSubview:self.TimeLable];
        
        self.LableAddress = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 18, 18)] ;
        //        self.LableAddress.text = @"地址:";
        UIImageView *imageview2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_spot"]];
        imageview2.frame=self.LableAddress.bounds;
        [self.LableAddress addSubview:imageview2];
        [imageview2 setContentMode:UIViewContentModeScaleAspectFit];
        self.LableAddress.backgroundColor = [UIColor clearColor];
        self.AddressLable = [[UILabel alloc]initWithFrame:CGRectMake(42, 70, 152, 54)];
        self.AddressLable.numberOfLines = 3;
        self.AddressLable.backgroundColor = [UIColor clearColor];
     //   [self.LableAddress setFont:[UIFont fontWithName:@"Arial" size:14]];
        
        [self.AddressLable setFont:[UIFont fontWithName:@"Arial" size:13]];
        
        [self addSubview:self.LableAddress];
        [self addSubview:self.AddressLable];
        
        
        self.LableType = [[UILabel alloc]initWithFrame:CGRectMake(20, 122, 18, 18)] ;
        //        self.LableType.text = @"类型:";
        UIImageView *imageview3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_catalog"]];
        imageview3.frame=self.LableType.bounds;
        [self.LableType addSubview:imageview3];
        [imageview3 setContentMode:UIViewContentModeScaleAspectFit];
        self.LableType.backgroundColor = [UIColor clearColor];
        self.TypeLable = [[UILabel alloc]initWithFrame:CGRectMake(42, 122, 77, 24)]; ;
        
        self.TypeLable.backgroundColor = [UIColor clearColor];
        [self.LableType setFont:[UIFont fontWithName:@"Arial" size:14]];
        [self.TypeLable setFont:[UIFont fontWithName:@"Arial" size:13]];
        
        [self addSubview:self.LableType];
        [self addSubview:self.TypeLable];
        
        
        self.LableParticipant = [[UILabel alloc]initWithFrame:CGRectMake(59, 149, 51, 24)];
        self.LableParticipant.text = @"感兴趣";
        self.LableParticipant.textAlignment = NSTextAlignmentCenter;
        self.LableParticipant.backgroundColor = [UIColor clearColor];
        self.ParticipantLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 149, 46, 24)] ;
        self.ParticipantLable.backgroundColor = [UIColor clearColor];
        [self.LableParticipant setFont:[UIFont fontWithName:@"Arial" size:14]];
        [self.ParticipantLable setFont:[UIFont fontWithName:@"Arial" size:13]];
        [self.ParticipantLable setTextAlignment:NSTextAlignmentRight];
        self.ParticipantLable.textColor=[UIColor orangeColor];
        [self addSubview:self.LableParticipant];
        [self addSubview:self.ParticipantLable];
        
        self.LableWisher = [[UILabel alloc]initWithFrame:CGRectMake(163, 149, 40, 24)];;
        self.LableWisher.text = @"参加";
        self.LableWisher.textAlignment = NSTextAlignmentCenter;
        self.LableWisher.backgroundColor = [UIColor clearColor];
        self.WisherLable = [[UILabel alloc]initWithFrame:CGRectMake(118, 149, 43, 24)] ;
        self.WisherLable.backgroundColor = [UIColor clearColor];
        [self.WisherLable setTextAlignment:NSTextAlignmentRight];
        self.WisherLable.textColor=[UIColor orangeColor];
        [self.LableWisher setFont:[UIFont fontWithName:@"Arial" size:14]];
        [self.WisherLable setFont:[UIFont fontWithName:@"Arial" size:13]];
        
        [self addSubview:self.LableWisher];
        [self addSubview:self.WisherLable];
        
        
        
        
    }
    return self;
}

-(void)configCell:(EventData*)event
{
    
    
    NSString* strTitle = [NSString stringWithFormat:@"  %@",event.event_title];
    
    self.TitleLable.text = strTitle;
    NSString* timestr = [NSString stringWithFormat:@"%@至%@",[event.event_BeginTime substringWithRange:NSMakeRange(5, 11)],[event.event_EndTime substringWithRange:NSMakeRange(5, 11)]];
    // NSLog(@"%@",timestr);
    self.TimeLable.text = timestr;
    
    self.AddressLable.text = event.event_Address;
    UIFont *font =[UIFont fontWithName:@"Arial" size:13];
    
    CGSize size = [self.AddressLable.text sizeWithFont:font constrainedToSize:CGSizeMake(152, 100) lineBreakMode:NSLineBreakByWordWrapping];
    
    [self.AddressLable setFrame:CGRectMake(42, 70, 152, size.height)];
    
    NSArray* arr=[NSArray arrayWithObjects:@"音乐",@"戏剧",@"展览",@"沙龙",@"聚会",@"运动",@"旅行",@"公益",@"电影",nil];
    NSArray* arrkey = [NSArray arrayWithObjects:@"music",@"drama",@"exhibition",@"salon",@"party",@"sports",@"travel",@"commonweal",@"film", nil];
    NSDictionary* dic = [NSDictionary dictionaryWithObjects:arr forKeys:arrkey];
    self.TypeLable.text =[dic objectForKey:event.event_Category];
    //  NSLog(@"%@,%@",event.event_participant_count,event.event_wisher_count);
    int count = [event.event_wisher_count intValue];
    NSString* str = [NSString stringWithFormat:@"%i",count];
    self.WisherLable.text =str;
    count = [event.event_participant_count intValue];
    str = [NSString stringWithFormat:@"%i",count];
    self.ParticipantLable.text = str;
    [self.ImageView setImageURL:[NSURL URLWithString:event.event_hLargeImageURL]];

    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    
    
    // Configure the view for the selected state
}

@end
