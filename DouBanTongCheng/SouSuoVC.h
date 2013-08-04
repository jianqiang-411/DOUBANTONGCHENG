//
//  SouSuoVC.h
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-4.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SouSuoVC : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (assign, nonatomic) getEvents geteventstype;
@property (strong, nonatomic)  UIPickerView *pickerVC;
@property (strong, nonatomic)  UIToolbar *toolbar;
@property (strong, nonatomic)  UIView *frontpickerview;
@property (strong, nonatomic)  UIBarButtonItem *okBtn;
@property (strong, nonatomic)  UIBarButtonItem *cancelBtn;

- (void)btnClike:(UIBarButtonItem *)sender;
@end
