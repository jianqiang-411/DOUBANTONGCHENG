//
//  Cell.h
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-5.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "EGOImageButton.h"
@class EventData;
@interface Cell : UITableViewCell<EGOImageViewDelegate>


@property (retain, nonatomic) EGOImageView *ImageView;

@property (retain, nonatomic) UILabel *TitleLable;

@property (retain, nonatomic) UILabel* LableTime;
@property (retain, nonatomic) UILabel *TimeLable;

@property (retain, nonatomic) UILabel* LableAddress;
@property (retain, nonatomic) UILabel *AddressLable;

@property (retain, nonatomic) UILabel* LableType;
@property (retain, nonatomic) UILabel *TypeLable;

@property (retain, nonatomic) UILabel* LableParticipant;
@property (retain, nonatomic) UILabel *ParticipantLable;

@property (retain, nonatomic) UILabel* LableWisher;
@property (retain, nonatomic) UILabel *WisherLable;
@property (retain, nonatomic) UIImageView* backGroundImageview;

-(void)configCell:(EventData*)event;

@end
