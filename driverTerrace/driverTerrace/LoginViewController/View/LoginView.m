//
//  LoginView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "LoginView.h"
#import "LoginTextView.h"

@interface LoginView ()

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
        bg.image = [UIImage imageNamed:@""];
        [self addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        
        UIImageView *header = [UIImageView new];
        [self addSubview:header];
        [header mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(80);
        }];
        
        
        _userText = [LoginTextView new];
        _userText.textField.placeholder = @"请输入手机号";
        [self addSubview:_userText];
        [_userText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
        }];
        
        _passText = [LoginTextView new];
        _passText.textField.placeholder = @"请输入验证码";
        _passText.showMsgBtn = YES;
        [self addSubview:_passText];
        [_passText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userText).offset(5);
            make.left.right.equalTo(self.userText);
        }];
        
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.left.right.equalTo(self.passText);
            make.top.equalTo(self.passText.mas_bottom).offset(30);
        }];
        
        
        UILabel *registerLabel = [UILabel new];
        registerLabel.text = @"没有账号?马上注册";
        [self addSubview:registerLabel];
        [registerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.loginBtn.mas_bottom).offset(10);
        }];
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn addTarget:self action:@selector(pushRegister) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(registerLabel);
        }];
        
        
        
        _changeLabel = [UILabel new];
        _changeLabel.text = @"密码登录";
        [self addSubview:_changeLabel];
        [_changeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-30);
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
        [self addSubview:lineLabel];
        [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.changeLabel.mas_top).offset(-20);
            make.centerX.equalTo(self);
        }];
        
        
        UIView *leftline = [UIView new];
        leftline.backgroundColor = [UIColor whiteColor];
        [self addSubview:leftline];
        [leftline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(lineLabel.mas_left).offset(-2);
            make.centerY.equalTo(lineLabel);
            make.height.equalTo(@1);
        }];
        
        UIView *rightLine = [UIView new];
        rightLine.backgroundColor = [UIColor whiteColor];
        [self addSubview:rightLine];
        [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.left.equalTo(lineLabel.mas_right).offset(-2);
            make.centerY.equalTo(leftline);
            make.height.equalTo(@1);
        }];
    }
    return self;
}


//登录
- (void)login {
    
}

//注册
- (void)pushRegister {
    
}

//切换密码登录
- (void)changeLogin {
    _loginChange = !_loginChange;
    _changeLabel.text = _loginChange?@"验证码登录":@"密码登录";
    if (_loginChange) {
        
    } else {
        
    }
}

@end
