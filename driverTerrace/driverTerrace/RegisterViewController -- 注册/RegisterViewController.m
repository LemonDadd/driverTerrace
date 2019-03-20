//
//  RegisterViewController.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"

@interface RegisterViewController ()

@property (nonatomic, strong)RegisterView *registerView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _registerView = [RegisterView new];
    [self.view addSubview:_registerView];
    [_registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
