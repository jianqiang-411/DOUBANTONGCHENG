//
//  PViewController.h
//  DouBanTongCheng
//
//  Created by zhuming on 13-7-17.
//  Copyright (c) 2013年 ZZZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIPickerView *pickerVC;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *okBtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancelBtn;

- (IBAction)btnClike:(UIBarButtonItem *)sender;

@end
