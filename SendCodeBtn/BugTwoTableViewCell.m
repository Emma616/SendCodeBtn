//
//  BugTwoTableViewCell.m
//  SendCodeBtn
//
//  Created by LONG on 2019/11/27.
//  Copyright © 2019 MYY. All rights reserved.
//

#import "BugTwoTableViewCell.h"
#import "TimerManger.h"
@implementation BugTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TimerSelector) name:@"TIMER_NOTIFICATION" object:nil];
    [TimerManger shareTimer].returnTime = ^(NSInteger time) {
        self.sendBtn.titleLabel.text = [NSString stringWithFormat:@"%zi s",time];
    };
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)sendBtnClick:(id)sender {
    
    self.diffTimestr = @"30";
    
}

- (void)setDiffTimestr:(NSString *)diffTimestr
{
    _diffTime = [diffTimestr integerValue];
        if (_diffTime > 0 ) {
        [[TimerManger shareTimer] startTimerWithTimeInterVal:1 withTimelong:_diffTime];
            
    }
}

- (void)TimerSelector
{
    if (_diffTime <= 0) {
        self.sendBtn.titleLabel.text = @"请重新发送";
    }else{
        self.sendBtn.titleLabel.text = [NSString stringWithFormat:@"%fs",_diffTime];
    }
    _diffTime -- ;

}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"TIMER_NOTIFICATION" object:nil];
}

//- (NSString *)gettimestrWithdifftime:(double)difftime
//{
//    //天数
//    NSString *days = [NSString stringWithFormat:@"%02ld", (NSInteger)((difftime)/1000/60/60/24)];
//    //小时数
//    NSString *hours = [NSString stringWithFormat:@"%02ld", (NSInteger)((difftime)/1000/60/60)%24];
//    //分钟数
//    NSString *minute = [NSString stringWithFormat:@"%02ld", (NSInteger)((difftime)/1000/60)%60];
//    //秒数
//        NSString *second = [NSString stringWithFormat:@"%02ld", ((NSInteger)(difftime))/1000%60];
//
//    return [NSString stringWithFormat:@"%@天%@小时%@分%@",days,hours,minute,second];
//}

@end
