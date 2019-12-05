//
//  SendBtnTableViewCell.m
//  SendCodeBtn
//
//  Created by LONG on 2019/11/26.
//  Copyright © 2019 MYY. All rights reserved.
//

#import "SendBtnTableViewCell.h"
#import "UIButton+Extension.h"


@implementation SendBtnTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)sendBtnClick:(UIButton*)sender {
    //原思路
    [sender startTime:60 title:@"请重新发送" waitTittle:@"s" finished:^(UIButton *button) {

    }];
    
// mark 错误思路2 将定时器提到外面，没有效果
//        __block NSInteger timeOut = 60; //The countdown time
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
//        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //To perform a second
//        dispatch_source_set_event_handler(_timer, ^{
//            if(timeOut<=0){ //it is time to
//                dispatch_source_cancel(_timer);
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    //it is time to  set title
//                    [sender setTitle:@"重新" forState:UIControlStateNormal];
//    //                [self setBackgroundColor:UIColorFromRGB(0xFFB500)];
//                    [sender setBackgroundColor:[UIColor redColor]];
//                    sender.userInteractionEnabled = YES;
//
//                });
//            }else{
//
//                NSString *strTime = [NSString stringWithFormat:@"%ld", timeOut];
//                dispatch_async(dispatch_get_main_queue(), ^{
//
//                    [sender setTitle:[NSString stringWithFormat:@"%@%@",strTime,@"s"] forState:UIControlStateNormal];
//                    [sender setBackgroundColor:[UIColor grayColor]];
//                    sender.userInteractionEnabled = NO;
//
//                });
//                timeOut--;
//
//            }
//        });
//        dispatch_resume(_timer);
    
    if (_transBlock) {
        _transBlock();
    }
    
}



@end
