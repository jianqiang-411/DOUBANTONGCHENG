//
//  Citys.h
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citys : NSObject

@property(nonatomic,strong)NSString *Id;

@property(nonatomic,strong)NSString *name;

@property(nonatomic,strong)NSString *uid;


-(Citys*)initWithCity:(NSDictionary*)dic;

@end
