//
//  WQAlertView.h
//  豆芽学堂
//
//  Created by douya on 15/7/13.
//  Copyright (c) 2015年 douya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WQAlertViewDelegate <NSObject>

@end
@interface WQAlertView : UIView

@property (nonatomic,assign) id<WQAlertViewDelegate>delegate;
@property (nonatomic,assign) CGFloat hideTime;
@property (nonatomic,strong) UILabel *contentLabel;
- (id)initWithTitle:(NSString *)title withDelegate:(id)delegate;
- (void)show;
+ (void)showNotNetwork;
+ (void)showConnectWWAN;
+ (void)showConnectWifi;

@end
