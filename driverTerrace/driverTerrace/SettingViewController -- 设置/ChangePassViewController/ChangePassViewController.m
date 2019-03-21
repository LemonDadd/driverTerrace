//
//  ChangePassViewController.m
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "ChangePassViewController.h"
#import "ChangePassView.h"

@interface ChangePassViewController ()

@property (nonatomic, strong)ChangePassView *changePassView;

@end

@implementation ChangePassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _changePassView = [ChangePassView new];
    [self.view addSubview:_changePassView];
    [_changePassView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
    }];
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton setBackgroundImage:[UIImage imageNamed:@"ico_logout"] forState:UIControlStateNormal];
    [saveButton setTitle:@"完成" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [saveButton addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    [saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-50);
    }];
}

- (void)change {
    [_changePassView change];
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
