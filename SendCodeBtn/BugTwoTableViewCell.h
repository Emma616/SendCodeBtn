//
//  BugTwoTableViewCell.h
//  SendCodeBtn
//
//  Created by LONG on 2019/11/27.
//  Copyright © 2019 MYY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BugTwoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
- (IBAction)sendBtnClick:(id)sender;

/**
 时间差
 */
@property (nonatomic, copy) NSString * diffTimestr;

@property (nonatomic, assign) double diffTime;

@end

NS_ASSUME_NONNULL_END
