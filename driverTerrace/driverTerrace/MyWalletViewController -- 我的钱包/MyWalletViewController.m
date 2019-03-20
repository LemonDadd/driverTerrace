//
//  MyWalletViewController.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/20.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "MyWalletViewController.h"
#import "MyWalletView.h"

@interface MyWalletViewController ()
@property (nonatomic, strong)UILabel *priceLabel;

@property (nonatomic, strong)MyWalletView *myWalletView;

@end

@implementation MyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的钱包";
    
    UIView *line = [UIView new];
    line.backgroundColor = kRGBColor(37, 124, 225);
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.left.equalTo(@100);
        make.right.equalTo(@-100);
        make.height.equalTo(@1);
    }];
    
    UILabel *title = [UILabel new];
    title.backgroundColor = self.view.backgroundColor;
    title.text = @"  账户余额  ";
    title.font = [UIFont systemFontOfSize:14];
    title.textColor = kRGBColor(37, 124, 225);
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(line);
    }];
    
    _priceLabel = [UILabel new];
    _priceLabel.text = @"￥200.00";
    _priceLabel.font = [UIFont boldSystemFontOfSize:35];
    _priceLabel.textColor = kRGBColor(37, 124, 225);
    [self.view addSubview:_priceLabel];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(title.mas_bottom).offset(20);
    }];
    
    _myWalletView = [MyWalletView new];
    [self.view addSubview:_myWalletView];
    [_myWalletView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).offset(30);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.bottom.equalTo(@-30);
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
