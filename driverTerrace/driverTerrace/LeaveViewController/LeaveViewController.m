//
//  LeaveViewController.m
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "LeaveViewController.h"
#import "LeaveView.h"
@interface LeaveViewController ()

@property (nonatomic, strong)LeaveView *leaveView;
@property (nonatomic, strong)UIButton *bottonBtn;

@end

@implementation LeaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _bottonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bottonBtn setBackgroundImage:[UIImage imageNamed:@"ico_nav"] forState:UIControlStateNormal];
    [_bottonBtn setTitle:@"请假" forState:UIControlStateNormal];
    [_bottonBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:_bottonBtn];
    [_bottonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
    }];
    
    _leaveView = [LeaveView new];
    [self.view addSubview:_leaveView];
    [_leaveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.bottom.equalTo(self.bottonBtn.mas_top).offset(-20);
    }];
    
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
