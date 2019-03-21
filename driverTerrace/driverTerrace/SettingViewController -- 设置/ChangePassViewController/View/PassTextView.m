//
//  PassTextView.m
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "PassTextView.h"

@implementation PassTextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _textField = [UITextField new];
        _textField.textColor = [UIColor whiteColor];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.font = [UIFont fontWithName:@"" size:14];
        _textField.tintColor = [UIColor whiteColor];
        
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(@50);
        }];
        
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(self);
            make.top.equalTo(self.textField.mas_bottom);
            make.height.equalTo(@1);
        }];
        
    }
    return self;
}


-(void)setType:(PassTextViewType)type {
    if (type == PassTextViewTypeMsg) {
        self.passBtn.hidden = YES;
        self.msgBtn.hidden = NO;
        self.textField.secureTextEntry = NO;
        [self.msgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.right.equalTo(self);
        }];
        
        [_textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self);
            make.height.equalTo(@44);
            make.right.equalTo(self.msgBtn.mas_left).offset(-10);
        }];
        [self layoutIfNeeded];
    } else {
        self.passBtn.hidden = NO;
        self.msgBtn.hidden = YES;
        self.passBtn.selected = NO;
        self.textField.secureTextEntry = YES;
        [self.passBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.right.equalTo(self);
        }];
        
        [_textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self);
            make.height.equalTo(@44);
            make.right.equalTo(self.passBtn.mas_left).offset(-10);
        }];
        [self layoutIfNeeded];
    }
}

- (void)passEvent:(UIButton *)sender {
    sender.selected = !sender.selected;
    _textField.secureTextEntry = !sender.selected;
}

- (void)msgBtnEvent:(UIButton *)sender {
    
    if (_msgEvent) {
        _msgEvent();
    }
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.msgBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                sender.userInteractionEnabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [self.msgBtn setTitle:[NSString stringWithFormat:@"%zds",(long)timeout] forState:UIControlStateNormal];
                [UIView commitAnimations];
                sender.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

-(void)setPlaceholder:(NSString *)placeholder {
    UIColor *color = [UIColor grayColor];
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:[UIFont systemFontOfSize:14]}];
}

-(UIButton *)passBtn {
    if (!_passBtn) {
        _passBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_passBtn setImage:[UIImage imageNamed:@"ico_eye"] forState:UIControlStateNormal];
        [_passBtn setImage:[UIImage imageNamed:@"ico_eye"] forState:UIControlStateSelected];
        _passBtn.backgroundColor = [UIColor clearColor];
        [_passBtn addTarget:self action:@selector(passEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_passBtn];
    }
    return _passBtn;
}

-(UIButton *)msgBtn {
    if (!_msgBtn) {
        _msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_msgBtn setBackgroundImage:[UIImage imageNamed:@"ico_msg_pass"] forState:UIControlStateNormal];
        [_msgBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_msgBtn setTitleColor:kRGBColor(37, 124, 229) forState:UIControlStateNormal];
        [_msgBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        _msgBtn.backgroundColor = [UIColor clearColor];
        [_msgBtn addTarget:self action:@selector(msgBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_msgBtn];
    }
    return _msgBtn;
}

@end
