//
//  LoginTextView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "LoginTextView.h"

@implementation LoginTextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _textField = [UITextField new];
        _textField.font = [UIFont fontWithName:@"" size:16];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(@44);
        }];
        
        UIView *line = [UIView new];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(self);
            make.top.equalTo(self.textField.mas_bottom).offset(2);
        }];
        
    }
    return self;
}

-(void)setShowMsgBtn:(BOOL)showMsgBtn {
    _showMsgBtn = showMsgBtn;
    if (showMsgBtn) {
        _msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _msgBtn.backgroundColor = [UIColor clearColor];
        [_msgBtn addTarget:self action:@selector(msgBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_msgBtn];
        [_msgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.right.equalTo(self);
            make.top.equalTo(self).offset(5);
            make.bottom.equalTo(self).offset(-5);
        }];
        
        [_textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self);
            make.height.equalTo(@44);
            make.right.equalTo(self.msgBtn.mas_left).offset(-10);
        }];
        [self layoutIfNeeded];
    }
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
                [self.msgBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
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



@end
