//
//  EventData.h
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.

//

#import <Foundation/Foundation.h>

@interface EventData : NSObject

//收集屏幕自适应链接
@property (nonatomic, strong) NSString* event_Adapt_URL;
//详细地址信息
@property (nonatomic, strong) NSString* event_Address;
//签名ID数字
@property (nonatomic, strong) NSString* event_Album;
//PC链接地址
@property (nonatomic, strong) NSString* event_Alt;
//活动网络ID
@property (nonatomic, strong) NSString* event_id;
//活动开始时间
@property (nonatomic, strong) NSString* event_BeginTime;
//活动结束时间
@property (nonatomic, strong) NSString* event_EndTime;
//活动类型
@property (nonatomic, strong) NSString* event_Category;
//活动主办方信息
@property (nonatomic, strong) NSDictionary* event_Ownerinfor_dic;
//活动主办方图片地址
@property (nonatomic, strong) NSString* event_avatarURL;
//手机图片地址  小图
@property (nonatomic, strong) NSString* event_lMobileImageURL;
//大图地址
@property (nonatomic, strong) NSString* event_hLargeImageURL;



//活动主办方名字
@property (nonatomic, strong) NSString* event_OwnerName;
//活动内容介绍
@property (nonatomic, strong) NSString* event_content;
//感兴趣的人数
@property (nonatomic, strong) NSString* event_wisher_count;
//参加的人数
@property (nonatomic, strong) NSString* event_participant_count;
//活动标题
@property (nonatomic, strong) NSString* event_title;
//举办所在城市


@property (nonatomic, strong) NSString* event_locCity;
@property (nonatomic, strong) NSString* event_locID;

@property (nonatomic, strong) NSString* events_Total;

@property (nonatomic, strong) NSString* events_Geo;

-(id)initWithDictionary:(NSDictionary*)_dic;
@end

