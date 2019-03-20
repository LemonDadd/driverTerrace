//
//  RouteDetailViewController.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "RouteDetailViewController.h"
#import "RouteDetailView.h"

@interface RouteDetailViewController ()

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)RouteDetailView *routeDetailView;

@end

@implementation RouteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *bg =[UIImageView new];
    bg.image = [UIImage imageNamed:@"ico_home_bg"];
    [self.view addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _titleLabel = [UILabel new];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.text = _model.circuitname;
    [self.view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.centerX.equalTo(self.view);
    }];
    _routeDetailView = [RouteDetailView new];
    [self.view addSubview:_routeDetailView];
    [_routeDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.bottom.equalTo(@-40);
    }];
    [self loadData];
}

- (void)loadData {
    [AllRequest requestgGetPassengerInfoByUserOrderId:_model.id request:^(NSArray * _Nonnull message, NSString * _Nonnull errorMsg) {
        
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
