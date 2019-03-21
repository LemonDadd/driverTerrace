//
//  ChangePassView.m
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "ChangePassView.h"
#import "PassTextView.h"

@interface ChangePassView ()

@property (nonatomic, strong)PassTextView *userText;
@property (nonatomic, strong)PassTextView *code;
@property (nonatomic, strong)PassTextView *passText;
@property (nonatomic, strong)PassTextView *passText1;

@end

@implementation ChangePassView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _userText = [PassTextView new];
        _userText.placeholder = @"请输入手机号";
        [self addSubview:_userText];
        [_userText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(self);
        }];
        
        kWeakSelf(self);
        _code = [PassTextView new];
        _code.msgEvent = ^{
            [weakself sendCode];
        };
        _code.placeholder = @"请输入验证码";
        _code.type = PassTextViewTypeMsg;
        [self addSubview:_code];
        [_code mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userText.mas_bottom);
            make.left.right.equalTo(self.userText);
        }];
        
        _passText = [PassTextView new];
        _passText.placeholder = @"请输入密码";
        _passText.textField.secureTextEntry = YES;
        [self addSubview:_passText];
        [_passText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.code.mas_bottom);
            make.left.right.equalTo(self.userText);
        }];
        
        _passText1 = [PassTextView new];
        _passText1.placeholder = @"请输入密码";
        _passText1.textField.secureTextEntry = YES;
        [self addSubview:_passText1];
        [_passText1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passText.mas_bottom);
            make.left.right.equalTo(self.userText);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}

- (void)sendCode {
    
    if (!self.userText.textField.text.length) {
        [CustomView alertMessage:@"请输入手机号码" view:self];
        return;
    }
    [AllRequest requestSendPhoneCodeByPhone:self.userText.textField.text Key:2 request:^(BOOL message, NSString * _Nonnull errorMsg) {
    }];
}

- (void)change {
    if (!self.userText.textField.text.length) {
        [CustomView alertMessage:@"请输入手机号码" view:self];
        return;
    }
    if (!self.code.textField.text.length) {
        [CustomView alertMessage:@"请输入验证码" view:self];
        return;
    }
    if (!self.passText.textField.text.length) {
        [CustomView alertMessage:@"请输入密码" view:self];
        return;
    }
    if (!self.passText1.textField.text.length) {
        [CustomView alertMessage:@"请输入密码" view:self];
        return;
    }
    
    if (![self.passText1.textField.text isEqualToString:self.passText.textField.text]) {
        [CustomView alertMessage:@"两次密码输入不一致" view:self];
        return;
    }
    [[CustomView getInstancetype]showWaitView:@"请稍后..." byView:self];
    [AllRequest requestDriveralterByPhone:self.userText.textField.text password:self.passText1.textField.text phoneCode:self.code.textField.text request:^(BOOL message, NSString * _Nonnull errorMsg) {
        [[CustomView getInstancetype]closeHUD];
        if (message) {
            [CustomView alertMessage:@"修改成功" view:self];
        } else {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = 8.f;
    self.layer.shadowColor = kColorWithHex(0x9F9F9F).CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 1;//阴影透明度，默认0
    self.layer.shadowRadius = 3;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = self.bounds.size.width;
    float height = self.bounds.size.height;
    float x = self.bounds.origin.x;
    float y = self.bounds.origin.y;
    float addWH = 5;
    
    CGPoint topLeft      = self.bounds.origin;
    CGPoint topMiddle = CGPointMake(x+(width/2),y-addWH);
    CGPoint topRight     = CGPointMake(x+width,y);
    
    CGPoint rightMiddle = CGPointMake(x+width+addWH,y+(height/2));
    
    CGPoint bottomRight  = CGPointMake(x+width,y+height);
    CGPoint bottomMiddle = CGPointMake(x+(width/2),y+height+addWH);
    CGPoint bottomLeft   = CGPointMake(x,y+height);
    
    
    CGPoint leftMiddle = CGPointMake(x-addWH,y+(height/2));
    
    [path moveToPoint:topLeft];
    //添加四个二元曲线
    [path addQuadCurveToPoint:topRight
                 controlPoint:topMiddle];
    [path addQuadCurveToPoint:bottomRight
                 controlPoint:rightMiddle];
    [path addQuadCurveToPoint:bottomLeft
                 controlPoint:bottomMiddle];
    [path addQuadCurveToPoint:topLeft
                 controlPoint:leftMiddle];
    //设置阴影路径
    self.layer.shadowPath = path.CGPath;
}

@end
