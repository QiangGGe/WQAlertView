//
//  WQAlertView.m
//  豆芽学堂
//
//  Created by douya on 15/7/13.
//  Copyright (c) 2015年 douya. All rights reserved.
//

#import "WQAlertView.h"

#define WQ_Width [UIScreen mainScreen].bounds.size.width/2
#define Screen_height [UIScreen mainScreen].bounds.size.height

@implementation WQAlertView

- (id)initWithTitle:(NSString *)title withDelegate:(id)delegate
{
    if ([super init])
    {
        self.delegate = delegate;
       CGFloat title_height = [self heightWithString:title stringWidth:WQ_Width-20 fontSize:15];
        CGFloat self_height = title_height +20;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, WQ_Width-20, title_height)];
        titleLabel.text = title;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.numberOfLines = 3;
        [self addSubview:titleLabel];
        _contentLabel = titleLabel;
        
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.8;
        ;
        self.frame = CGRectMake(WQ_Width-WQ_Width/2, Screen_height/2-self_height/2, WQ_Width, self_height);
        
    }
    return self;
}

+ (void)showNotNetwork
{
    WQAlertView *wqAlertView = [[WQAlertView alloc] initWithTitle:@"网络不给力，请稍候再试" withDelegate:self];
    [wqAlertView show];
}
+ (void)showConnectWWAN
{
    WQAlertView *wqAlertView = [[WQAlertView alloc] initWithTitle:@"您现在正在使用移动网络" withDelegate:self];
    [wqAlertView show];
}
+ (void)showConnectWifi
{
    WQAlertView *wqAlertView = [[WQAlertView alloc] initWithTitle:@"您现在正在使用Wi-Fi网络" withDelegate:self];
    [wqAlertView show];
}

- (void)show
{
    if (self.alpha !=0)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self.delegate selector:@selector(clearWQAlertView) object:nil];
        self.alpha = 0.8;
    }
    
    UIWindow *mainWindow = [UIApplication sharedApplication].windows[0];
    [mainWindow addSubview:self];
    if (_hideTime == 0)
    {
        [self performSelector:@selector(clearWQAlertView) withObject:nil afterDelay:2];
    }
    else
    {
        [self performSelector:@selector(clearWQAlertView) withObject:nil afterDelay:_hideTime];
    }
    
}

- (void)clearWQAlertView
{
    [UIView animateWithDuration:2 animations:^{
        self.alpha = 0.0f;
    }completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}
#pragma  mark - 计算文字的高度的方法
- (CGFloat)heightWithString:(NSString *)string stringWidth:(float)stringWidth fontSize:(float)fontSize
{
    //返回的是rect（宽高） 参数3:字典
    CGRect rect= [string boundingRectWithSize:CGSizeMake(stringWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    
    //向上取整 因为有误差 所以通常将余数取整
    return  ceilf(rect.size.height);//3.4-->4
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
