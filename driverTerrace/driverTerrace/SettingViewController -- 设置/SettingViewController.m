//
//  SettingViewController.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingView.h"

@interface SettingViewController ()

@property (nonatomic, strong)SettingView *settingView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    _settingView = [SettingView new];
    [self.view addSubview:_settingView];
    [_settingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
        make.height.equalTo(@150);
    }];
    
    UIButton *outButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [outButton setBackgroundImage:[UIImage imageNamed:@"ico_logout"] forState:UIControlStateNormal];
    [outButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [outButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    outButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [outButton addTarget:self action:@selector(outlogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:outButton];
    [outButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-50);
    }];
}

- (void)outlogin {
    
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
