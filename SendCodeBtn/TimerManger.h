//
//  TimerManger.h
//  SendCodeBtn
//
//  Created by LONG on 2019/11/27.
//  Copyright © 2019 MYY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerManger : NSObject
/**
 单利
 */
+ (instancetype)shareTimer;


@property (nonatomic,copy)void (^returnTime)(NSInteger time);

/**
 结束定时器
 */
- (void)stopTimer;

/**
 开始定时器
 */
- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal withTimelong:(NSTimeInterval )time;



@end
