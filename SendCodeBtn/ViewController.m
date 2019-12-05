//
//  ViewController.m
//  SendCodeBtn
//
//  Created by LONG on 2019/11/26.
//  Copyright © 2019 MYY. All rights reserved.
//

#define SWidth [UIScreen mainScreen].bounds.size.width
#define SHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "SendBtnTableViewCell.h"
#import "BugTwoTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView* tbView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    
    [self tbView];
    
    
    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        static NSString* cellID = @"SendBtnTableViewCell";
//        SendBtnTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//        if (!cell) {
//            cell = [[[NSBundle mainBundle]loadNibNamed:@"SendBtnTableViewCell" owner:self options:nil]lastObject];
//        }
        SendBtnTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SendBtnTableViewCell" forIndexPath:indexPath];
        [cell.sendBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        
        return cell;
    }else if (indexPath.row == 1){
        
        BugTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BugTwoTableViewCell" forIndexPath:indexPath];
        [cell.sendBtn setTitle:@"发送验证码2" forState:UIControlStateNormal];
        return cell;
        
//        static NSString* cellID = @"BugTwoTableViewCell";
//        BugTwoTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//        if (!cell) {
//            cell = [[[NSBundle mainBundle]loadNibNamed:@"BugTwoTableViewCell" owner:self options:nil]lastObject];
//            [cell.sendBtn setTitle:@"发送验证码2" forState:UIControlStateNormal];
//        }
//        return cell;
    }
    else{
        
        static NSString* cellID = @"cellId";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld",(long)indexPath.row];
         return cell;
    }
    
}



- (UITableView*)tbView{
    
    _tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SWidth, SHeight) style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    [_tbView registerNib:[UINib nibWithNibName:@"BugTwoTableViewCell" bundle:nil] forCellReuseIdentifier:@"BugTwoTableViewCell"];
    [_tbView registerNib:[UINib nibWithNibName:@"SendBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"SendBtnTableViewCell"];
    [self.view addSubview:_tbView];
    
    return _tbView;
}


@end
