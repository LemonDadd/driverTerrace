//
//  LoginView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "LoginView.h"
#import "LoginTextView.h"
#import "RegisterViewController.h"
#import "ResetPassViewController.h"

@interface LoginView ()<UITextFieldDelegate>

@property (nonatomic, strong)LoginTextView *userText;
@property (nonatomic, strong)LoginTextView *passText;
@property (nonatomic, strong)UIButton *loginBtn;
@property (nonatomic, strong)UIButton *registerBtn;
@property (nonatomic, strong)UILabel *changeLabel;
@property (nonatomic, strong)UIButton *changeButton;
@property (nonatomic, strong)UIButton *rememberBtn;
@property (nonatomic, strong)UIButton *forgetBtn;

@property (nonatomic, assign) BOOL loginChange;



@end

@implementation LoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIImageView *bg = [UIImageView new];
        bg.image = [UIImage imageNamed:@"ico_home_bg"];
        [self addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        
        UIImageView *header = [UIImageView new];
        header.image = [UIImage imageNamed:@"ico_logo"];
        [self addSubview:header];
        [header mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(80);
        }];
        
        
        _userText = [LoginTextView new];
        _userText.textField.delegate =self;
        _userText.placeholder = @"请输入手机号";
        [self addSubview:_userText];
        [_userText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.left.equalTo(self).offset(30);
            make.right.equalTo(self).offset(-30);
            make.top.equalTo(header.mas_bottom).offset(40);
        }];
        
        kWeakSelf(self);
        _passText = [LoginTextView new];
        _passText.msgEvent = ^{
            [weakself sendCode];
        };
        _passText.placeholder = @"请输入验证码";
        _passText.type = LoginTextViewTypeMsg;
        [self addSubview:_passText];
        [_passText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userText.mas_bottom);
            make.left.right.equalTo(self.userText);
        }];
        
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetBtn.hidden = YES;
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_forgetBtn addTarget:self action:@selector(forgetBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_forgetBtn];
        [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.passText);
            make.top.equalTo(self.passText.mas_bottom).offset(8);
        }];
        
        _rememberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rememberBtn.hidden = YES;
        [_rememberBtn setTitle:@"  记住密码" forState:UIControlStateNormal];
        [_rememberBtn setImage:[UIImage imageNamed:@"ico_pass"] forState:UIControlStateNormal];
        [_rememberBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_rememberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rememberBtn addTarget:self action:@selector(forgetBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rememberBtn];
        [_rememberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.passText);
            make.top.equalTo(self.passText.mas_bottom).offset(8);
            
        }];
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"ico_login"] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:kRGBColor(37, 124, 229) forState:UIControlStateNormal];
//        [_loginBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.left.right.equalTo(self.passText);
            make.top.equalTo(self.passText.mas_bottom).offset(60);
        }];
        
        
        UILabel *registerLabel = [UILabel new];
        registerLabel.textColor = kRGBColor(166, 161, 225);
        registerLabel.font = [UIFont systemFontOfSize:15];
        registerLabel.text = @"没有账号?马上注册";
        [self addSubview:registerLabel];
        [registerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.loginBtn.mas_bottom).offset(20);
        }];
        
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn addTarget:self action:@selector(pushRegister) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(registerLabel);
        }];
        
        
        
        _changeLabel = [UILabel new];
        _changeLabel.font = [UIFont systemFontOfSize:14];
        _changeLabel.text = @"密码登录";
        _changeLabel.textColor = [UIColor whiteColor];
        [self addSubview:_changeLabel];
        [_changeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-40);
        }];
        
        _changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_changeButton addTarget:self action:@selector(changeLogin
                                                       ) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_changeButton];
        [_changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.changeLabel);
        }];
        
        UILabel *lineLabel = [UILabel new];
        lineLabel.text = @"其它登录方式";
        lineLabel.textColor = [UIColor whiteColor];
        [self addSubview:lineLabel];
        [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.changeLabel.mas_top).offset(-35);
            make.centerX.equalTo(self);
        }];
        
        
        UIView *leftline = [UIView new];
        leftline.backgroundColor =kRGBColor(116, 96, 211);
        [self addSubview:leftline];
        [leftline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(lineLabel.mas_left).offset(-5);
            make.centerY.equalTo(lineLabel);
            make.height.equalTo(@1);
        }];
        
        UIView *rightLine = [UIView new];
        rightLine.backgroundColor =kRGBColor(116, 96, 211);
        [self addSubview:rightLine];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.left.equalTo(lineLabel.mas_right).offset(5);
            make.centerY.equalTo(leftline);
            make.height.equalTo(@1);
        }];
    }
    return self;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.userText.textField ) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (self.userText.textField.text.length >= 11) {
           self.userText.textField.text = [textField.text substringToIndex:11];
            return NO;
        }
    }
    
//    if (textField == self.bottomTextField && (_styleType == LoginInputStyleTypeRegisterCode || _styleType == LoginInputStyleTypeCodeLogin)) {
//        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
//        if (range.length == 1 && string.length == 0) {
//            return YES;
//        }
//        //so easy
//        else if (self.bottomTextField.text.length >= 6) {
//            self.bottomTextField.text = [textField.text substringToIndex:6];
//            return NO;
//        }
//    }
    
    return YES;
}

//登录
- (void)login {
    if (_loginChange) {
        if ( self.userText.textField.text.length != 11 || ![self checkPhoneNumInput:self.userText.textField.text]) {
            [CustomView alertMessage:@"请输入正确的手机号" view:self];
            return;
        }
        if (self.passText.textField.text.length == 0) {
            [CustomView alertMessage:@"请输入密码" view:self];
            return;
        }
        
    } else {
        if (!self.userText.textField.text.length) {
            [CustomView alertMessage:@"请输入手机号" view:self];
            return;
        }
        
        if (!self.passText.textField.text.length) {
            [CustomView alertMessage:@"请输入验证码" view:self];
            return;
        }
    }
    
    [AllRequest requestDriverLoginByPhone:self.userText.textField.text password:self.passText.textField.text key:_loginChange?2:1 request:^(UserInfoModel * _Nonnull message, NSString * _Nonnull errorMsg) {
        if (message) {
            [message saveUserInfoModel];
            //首页刷新界面
            [[NSNotificationCenter defaultCenter]postNotificationName:kGetUnderwayOrder object:nil];
            [self.viewController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

//注册
- (void)pushRegister {
    RegisterViewController *vc= [RegisterViewController new];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

//切换密码登录
- (void)changeLogin {
    _loginChange = !_loginChange;
    _changeLabel.text = _loginChange?@"验证码登录":@"密码登录";
    if (_loginChange) {
        _passText.placeholder = @"请输入密码";
        _passText.type = LoginTextViewTypePass;
        
    } else {
        _passText.placeholder = @"请输入验证码";
        _passText.type = LoginTextViewTypeMsg;
    }
    _rememberBtn.hidden = !_loginChange;
    _forgetBtn.hidden = !_loginChange;
}

//忘记密码
- (void)forgetBtnEvent {
    ResetPassViewController *vc= [ResetPassViewController new];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

- (void)sendCode {
    if (!self.userText.textField.text.length) {
        [CustomView alertMessage:@"请输入手机号" view:self];
        return;
    }
    [AllRequest requestSendPhoneCodeByPhone:self.userText.textField.text Key:3 request:^(BOOL message, NSString * _Nonnull errorMsg) {
    }];
}

- (BOOL)checkPhoneNumInput:(NSString *)str
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|99|8[09])[0-9]|349)\\d{7}$";
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:str];
    BOOL res2 = [regextestcm evaluateWithObject:str];
    BOOL res3 = [regextestcu evaluateWithObject:str];
    BOOL res4 = [regextestct evaluateWithObject:str];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
