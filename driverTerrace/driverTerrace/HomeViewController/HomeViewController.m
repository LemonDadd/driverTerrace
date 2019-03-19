//
//  HomeViewController.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTopView.h"
#import "HomePeopleView.h"

@interface HomeViewController ()

@property (nonatomic, strong)HomeTopView *homeTopView;
@property (nonatomic, strong)HomePeopleView *homePeopleView;

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([UserInfoModel getUserInfoClass] == nil) {
         [self toLoginViewController];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"司机";
    
    UIImageView *bgView = [UIImageView new];
    bgView.image = [UIImage imageNamed:@"ico_home_bg"];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@150);
    }];
    
    _homeTopView = [HomeTopView new];
    [self.view addSubview:_homeTopView];
    [_homeTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView.mas_bottom);
        make.left.equalTo(@13);
        make.right.equalTo(@-13);
    }];
    
    _homePeopleView = [HomePeopleView new];
    [self.view addSubview:_homePeopleView];
    [_homePeopleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.homeTopView);
        make.top.equalTo(self.homeTopView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view).offset(-30);
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
