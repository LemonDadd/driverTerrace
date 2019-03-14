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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.homeTopView.layer.masksToBounds = YES;
       
    });
    
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
