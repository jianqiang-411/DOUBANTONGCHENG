//
//  Citys.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "Citys.h"

@implementation Citys
@synthesize Id,name,uid;



-(Citys*)initWithCity:(NSDictionary*)dic
{
    if (self = [super init]) {
        Id = [dic objectForKey:@"id"];
        name = [dic objectForKey:@"name"];
        uid = [dic objectForKey:@"uid"];
    }
    return self;
}

-(NSString*)debugDescription
{
    return [NSString stringWithFormat:@"id = %@,name = %@,uid = %@",Id,name,uid];
}


@end
