//
//  lawViewController.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "lawViewController.h"
#import "lawView.h"

@interface lawViewController ()

@property (nonatomic, strong)lawView *lawview;

@end

@implementation lawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lawview = [lawView new];
    [self.view addSubview:_lawview];
    [_lawview  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
        make.height.equalTo(@150);
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
