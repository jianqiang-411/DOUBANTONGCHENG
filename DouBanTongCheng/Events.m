//
//  Events.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "Events.h"

@implementation Events

@synthesize is_priv,participant_count,image,adapt_url,begin_time,owner_avatar,owner_alt,owner_id,owner_name,owner_uid,alt,geo,ID,album,title,wisher_count,content,image_hlarge,end_time,image_lmobile,has_invited,can_invite,address,loc_name,loc_id;

-(Events*)initWithEvents:(NSDictionary*)dic
{
    if (self == [super init]) {
        is_priv = [dic objectForKey:@"is_priv"];
        participant_count = [[dic objectForKey:@"participant_count"]integerValue];
        image = [dic objectForKey:@"image"];
        adapt_url = [dic objectForKey:@"adapt_url"];
        begin_time = [dic objectForKey:@"begin_time"];
        NSDictionary *dic1 = [dic objectForKey:@"owner"];
        owner_avatar = [dic1 objectForKey:@"avatar"];
        owner_alt = [dic1 objectForKey:@"alt"];
        owner_id = [dic1 objectForKey:@"id"];
        owner_name = [dic1 objectForKey:@"name"];
        owner_uid = [dic1 objectForKey:@"uid"];
        alt = [dic objectForKey:@"alt"];
        geo = [dic objectForKey:@"geo"];
        ID = [dic objectForKey:@"id"];
        album = [dic objectForKey:@"album"];
        title = [dic objectForKey:@"title"];
        wisher_count = [[dic objectForKey:@"wisher_count"]integerValue];
        content = [dic objectForKey:@"content"];
        image_hlarge = [dic objectForKey:@"image_hlarge"];
        end_time = [dic objectForKey:@"end_time"];
        image_lmobile = [dic objectForKey:@"image_lmobile"];
        has_invited = [dic objectForKey:@"has_invited"];
        can_invite = [dic objectForKey:@"can_invite"];
        address = [dic objectForKey:@"address"];
        loc_name = [dic objectForKey:@"loc_name"];
        loc_id = [dic objectForKey:@"loc_id"];
    }
    return self;
}

-(NSString*)debugDescription
{
    return [NSString stringWithFormat:@"%@,%d,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%d,%@,%@,%@,%@,%@,%@,%@,%@,%@,",is_priv,participant_count,image,adapt_url,begin_time,owner_avatar,owner_alt,owner_id,owner_name,owner_uid,alt,geo,ID,album,title,wisher_count,content,image_hlarge,end_time,image_lmobile,has_invited,can_invite,address,loc_name,loc_id];
}



@end
