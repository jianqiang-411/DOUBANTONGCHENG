//
//  Events.h
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Events : NSObject
//
@property (nonatomic,strong) NSString *is_priv;
//参加的人数
@property (nonatomic,assign) NSInteger participant_count;
//图片
@property (nonatomic,strong) NSString *image;
//
@property (nonatomic,strong) NSString *adapt_url;
//开始时间
@property (nonatomic,strong) NSString *begin_time;
//头像
@property (nonatomic,strong) NSString *owner_avatar;
//
@property (nonatomic,strong) NSString *owner_alt;

@property (nonatomic,strong) NSString *owner_id;

@property (nonatomic,strong) NSString *owner_name;

@property (nonatomic,strong) NSString *owner_uid;
//图片描述
@property (nonatomic,strong) NSString *alt;
//全球
@property (nonatomic,strong) NSString *geo;

@property (nonatomic,strong) NSString *ID;
//相册
@property (nonatomic,strong) NSString *album;
//标题
@property (nonatomic,strong) NSString *title;
//感兴趣的人数
@property (nonatomic,assign) NSInteger wisher_count;
//内容
@property (nonatomic,strong) NSString *content;
//大图
@property (nonatomic,strong) NSString *image_hlarge;
//结束时间
@property (nonatomic,strong) NSString *end_time;
//移动手机图片
@property (nonatomic,strong) NSString *image_lmobile;
//被邀请
@property (nonatomic,strong) NSString *has_invited;
//能邀请
@property (nonatomic,strong) NSString *can_invite;
//地址
@property (nonatomic,strong) NSString *address;
//城市名称
@property (nonatomic,strong) NSString *loc_name;
//城市ID
@property (nonatomic,strong) NSString *loc_id;



-(Events*)initWithEvents:(NSDictionary*)dic;



@end
