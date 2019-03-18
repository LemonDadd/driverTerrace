//
//  RegisterView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/19.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "RegisterView.h"
#import "LoginTextView.h"

@interface RegisterView ()

@property (nonatomic, strong)LoginTextView *userText;
@property (nonatomic, strong)LoginTextView *code;
@property (nonatomic, strong)LoginTextView *passText;
@property (nonatomic, strong)LoginTextView *passText1;

@property (nonatomic, strong)UIButton *registerBtn;

@end

@implementation RegisterView

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
        _userText.placeholder = @"请输入手机号";
        [self addSubview:_userText];
        [_userText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.left.equalTo(self).offset(30);
            make.right.equalTo(self).offset(-30);
            make.top.equalTo(header.mas_bottom).offset(40);
        }];
        
        kWeakSelf(self);
        _code = [LoginTextView new];
        _code.msgEvent = ^{
            [weakself sendCode];
        };
        _code.placeholder = @"请输入验证码";
        _code.type = LoginTextViewTypeMsg;
        [self addSubview:_code];
        [_code mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userText.mas_bottom);
            make.left.right.equalTo(self.userText);
        }];
        
        _passText = [LoginTextView new];
        _passText.placeholder = @"请输入密码";
        _passText.textField.secureTextEntry = YES;
        [self addSubview:_passText];
        [_passText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.code.mas_bottom);
            make.left.right.equalTo(self.userText);
        }];
        
        _passText1 = [LoginTextView new];
        _passText1.placeholder = @"请输入密码";
        _passText1.textField.secureTextEntry = YES;
        [self addSubview:_passText1];
        [_passText1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passText.mas_bottom);
            make.left.right.equalTo(self.userText);
        }];
        
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setBackgroundImage:[UIImage imageNamed:@"ico_login"] forState:UIControlStateNormal];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:kRGBColor(37, 124, 229) forState:UIControlStateNormal];
        //        [_loginBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_registerBtn addTarget:self action:@selector(registerBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.left.right.equalTo(self.passText);
            make.top.equalTo(self.passText1.mas_bottom).offset(40);
        }];
        
        
        UILabel *registerLabel = [UILabel new];
        registerLabel.textColor = kRGBColor(166, 161, 225);
        registerLabel.font = [UIFont systemFontOfSize:15];
        registerLabel.text = @"点击注册即表示接受晋运村村通的《用户协议》";
        [self addSubview:registerLabel];
        [registerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.registerBtn.mas_bottom).offset(20);
        }];
    }
    return self;
}

- (void)registerBtnEvent {
    
}

- (void)sendCode {
    
    if (!self.userText.textField.text.length) {
        [CustomView alertMessage:@"请输入验证码" view:self];
        return;
    }
    [AllRequest requestSendPhoneCodeByPhone:self.userText.textField.text Key:1 request:^(BOOL message, NSString * _Nonnull errorMsg) {
    }];
}

@end
