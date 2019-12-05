//
//  TimerManger.m
//  SendCodeBtn
//
//  Created by LONG on 2019/11/27.
//  Copyright © 2019 MYY. All rights reserved.
//

#import "TimerManger.h"

static NSString * TIMER_NOTIFICATION = @"TIMER_NOTIFICATION";

@interface TimerManger ()
/**
 定时器
 */
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger timeLong; //倒计时总时长

@end

@implementation TimerManger

+ (instancetype)shareTimer
{
    static dispatch_once_t onceToken;
    static TimerManger *instance;
    dispatch_once(&onceToken, ^{
        instance = [[TimerManger alloc]init];
    });
    return instance;
}

- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal withTimelong:(NSTimeInterval )time
{
    self.timeLong = time;
    if (_timer) return;
    _timer = [NSTimer timerWithTimeInterval:timeInterVal
                                     target:self
                                   selector:@selector(timerAction:)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer
                              forMode:NSRunLoopCommonModes];
}
/**
 定时器调用事件
 
 @param timer timer
 */
- (void)timerAction:(NSTimer *)timer
{
    self.timeLong -- ;
    if (self.returnTime) {
        self.returnTime(self.timeLong);
    }
}

-(void)setReturnTime:(void (^)(NSInteger))returnTime{
    _returnTime = returnTime;
}
/**
 结束定时器
 */
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

@end
