//
//  BaseViewController.m
//  zhuangxiu
//
//  Created by quanqiuwa on 2019/2/14.
//  Copyright © 2019 TestProject. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"
#import "BaseNavController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kRGBColor(249, 249, 248);
    self.edgesForExtendedLayout =UIRectEdgeNone;
}

- (void)toLoginViewController {
    LoginViewController * vc = [LoginViewController new];
    BaseNavController *nav = [[BaseNavController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:NO completion:nil];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
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
