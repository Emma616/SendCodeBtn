//
//  SendBtnTableViewCell.h
//  SendCodeBtn
//
//  Created by LONG on 2019/11/26.
//  Copyright © 2019 MYY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SendBtnTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
- (IBAction)sendBtnClick:(id)sender;

@property (nonatomic,strong)void (^transBlock)(void);



@end

NS_ASSUME_NONNULL_END
