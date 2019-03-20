//
//  ResetPassViewController.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "ResetPassViewController.h"
#import "LoginTextView.h"

@interface ResetPassViewController ()

@property (nonatomic, strong)LoginTextView *userText;
@property (nonatomic, strong)LoginTextView *code;
@property (nonatomic, strong)LoginTextView *passText;
@property (nonatomic, strong)LoginTextView *passText1;

@property (nonatomic, strong)UIButton *resetPassBtn;

@end

@implementation ResetPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *bg = [UIImageView new];
    bg.image = [UIImage imageNamed:@"ico_home_bg"];
    [self.view addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    UIImageView *header = [UIImageView new];
    header.image = [UIImage imageNamed:@"ico_logo"];
    [self.view addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(80);
    }];
    
    _userText = [LoginTextView new];
    _userText.placeholder = @"请输入手机号";
    [self.view addSubview:_userText];
    [_userText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.top.equalTo(header.mas_bottom).offset(40);
    }];
    
    kWeakSelf(self);
    _code = [LoginTextView new];
    _code.msgEvent = ^{
        [weakself sendCode];
    };
    _code.placeholder = @"请输入验证码";
    _code.type = LoginTextViewTypeMsg;
    [self.view addSubview:_code];
    [_code mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userText.mas_bottom);
        make.left.right.equalTo(self.userText);
    }];
    
    _passText = [LoginTextView new];
    _passText.placeholder = @"请输入密码";
    _passText.textField.secureTextEntry = YES;
    [self.view addSubview:_passText];
    [_passText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.code.mas_bottom);
        make.left.right.equalTo(self.userText);
    }];
    
    _passText1 = [LoginTextView new];
    _passText1.placeholder = @"请输入密码";
    _passText1.textField.secureTextEntry = YES;
    [self.view addSubview:_passText1];
    [_passText1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passText.mas_bottom);
        make.left.right.equalTo(self.userText);
    }];
    
    _resetPassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_resetPassBtn setBackgroundImage:[UIImage imageNamed:@"ico_login"] forState:UIControlStateNormal];
    [_resetPassBtn setTitle:@"完成" forState:UIControlStateNormal];
    [_resetPassBtn setTitleColor:kRGBColor(37, 124, 229) forState:UIControlStateNormal];
    //        [_loginBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_resetPassBtn addTarget:self action:@selector(resetPassBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_resetPassBtn];
    [_resetPassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.right.equalTo(self.passText);
        make.top.equalTo(self.passText1.mas_bottom).offset(40);
    }];
}

- (void)resetPassBtnEvent {
    if (!self.userText.textField.text.length) {
        [CustomView alertMessage:@"请输入手机号码" view:self.view];
        return;
    }
    if (!self.code.textField.text.length) {
        [CustomView alertMessage:@"请输入验证码" view:self.view];
        return;
    }
    if (!self.passText.textField.text.length) {
        [CustomView alertMessage:@"请输入密码" view:self.view];
        return;
    }
    if (!self.passText1.textField.text.length) {
        [CustomView alertMessage:@"请输入密码" view:self.view];
        return;
    }
    
    if (![self.passText1.textField.text isEqualToString:self.passText.textField.text]) {
        [CustomView alertMessage:@"两次密码输入不一致" view:self.view];
        return;
    }
    [[CustomView getInstancetype]showWaitView:@"请稍后..." byView:self.view];
    [AllRequest requestDriveralterByPhone:self.userText.textField.text password:self.passText1.textField.text phoneCode:self.code.textField.text request:^(BOOL message, NSString * _Nonnull errorMsg) {
        [[CustomView getInstancetype]closeHUD];
        if (message) {
            [CustomView alertMessage:@"修改成功" view:self.view];
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [CustomView alertMessage:errorMsg view:self.view];
        }
    }];
    
}

- (void)sendCode {
    
    if (!self.userText.textField.text.length) {
        [CustomView alertMessage:@"请输入手机号码" view:self.view];
        return;
    }
    [AllRequest requestSendPhoneCodeByPhone:self.userText.textField.text Key:2 request:^(BOOL message, NSString * _Nonnull errorMsg) {
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
