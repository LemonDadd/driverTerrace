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
@property (nonatomic, strong)UIButton *changeButton;
@property (nonatomic, strong)UIButton *rememberBtn;
@property (nonatomic, strong)UIButton *forgetBtn;



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
        
    }
    return self;
}

@end
