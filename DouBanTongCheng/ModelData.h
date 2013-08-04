//
//  ModelData.h
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citys.h"
@interface ModelData : NSObject

@property(nonatomic,strong)Citys *City;
@property(nonatomic,strong)NSMutableArray *arrCity;


+(ModelData*)shareModelData;

@end
