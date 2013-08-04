//
//  ModelData.m
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import "ModelData.h"

@implementation ModelData

static ModelData *modelData = nil;


+(ModelData*)shareModelData
{
    if (modelData == nil) {
        modelData = [[ModelData alloc]init];
    }
    return modelData;
}

-(id)init
{
    if (self == [super init]) {
        self.City = [[Citys alloc]init];
        self.arrCity = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
