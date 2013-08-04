//
//  EventData.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//


#import "EventData.h"

@implementation EventData

@synthesize event_Adapt_URL,event_Address,event_Album,event_Alt,event_avatarURL,event_BeginTime,event_Category,event_content,event_EndTime,event_hLargeImageURL,event_id,event_lMobileImageURL,event_locCity,event_locID;
@synthesize event_Ownerinfor_dic,event_OwnerName,event_participant_count,event_title,event_wisher_count,events_Total,events_Geo;

-(EventData*)initWithDictionary:(NSDictionary*)_dic
{
    
    if (self = [super init]) {
        self.event_Adapt_URL = [_dic objectForKey:@"adapt_url"];
        self.event_Address = [_dic objectForKey:@"address"];
        self.event_Album = [_dic objectForKey:@"album"];
        self.event_Alt = [_dic objectForKey:@"alt"];
        self.event_BeginTime = [_dic objectForKey:@"begin_time"];
        self.event_Category = [_dic objectForKey:@"category"];
        self.event_content = [_dic objectForKey:@"content"];
        self.event_EndTime = [_dic objectForKey:@"end_time"];
        self.event_id = [_dic objectForKey:@"id"];
        self.event_Ownerinfor_dic = [_dic objectForKey:@"owner"];
        self.event_locCity = [_dic objectForKey:@"loc_name"];
        self.event_locID = [_dic objectForKey:@"loc_id"];
        self.event_participant_count = [_dic objectForKey:@"participant_count"];
        self.event_wisher_count = [_dic objectForKey:@"wisher_count"];
        self.event_title = [_dic objectForKey:@"title"];
        self.event_OwnerName = [[_dic objectForKey:@"owner"] objectForKey:@"name"];
        self.event_lMobileImageURL = [_dic objectForKey:@"image_lmobile"];
        self.event_hLargeImageURL = [_dic objectForKey:@"image_hlarge"];
        self.event_avatarURL = [[_dic objectForKey:@"owner"] objectForKey:@"avatar"];
        self.events_Total = self.events_Total;
        self.events_Geo =[_dic objectForKey:@"geo"];
        
    }
    
    
    return self;
}


@end
