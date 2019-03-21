//
//  HomeCarView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomeCarView.h"

@interface HomeCarView ()


@property (nonatomic, strong)UIView *cardView;

@property (nonatomic, strong)UIImageView *picImageV;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *count;
@property (nonatomic, strong)UILabel *fromLabel;
@property (nonatomic, strong)UILabel *toLabel;
@property (nonatomic, strong)UIImageView *fromImg;
@property (nonatomic, strong)UIImageView *toImg;
@property (nonatomic, strong)UILabel *inCarLabel;
@property (nonatomic, strong)UIImageView *inCarImg;
@property (nonatomic, strong)UILabel *payLabel;
@property (nonatomic, strong)UIImageView *payImg;

@property (nonatomic, strong)UIButton *locationBtn;
@property (nonatomic, strong)UIButton *closeBtn;


@end

@implementation HomeCarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        
        _cardView = [UIView new];
        _cardView.backgroundColor = [UIColor whiteColor];
        _cardView.layer.cornerRadius = 8.f;
        [self addSubview:_cardView];
        [_cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.right.equalTo(@-15);
            make.top.equalTo(@50);
            make.bottom.equalTo(self);
        }];
        
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [_closeBtn setImage:[UIImage imageNamed:@"ico_home_close"] forState:UIControlStateNormal];
        [self addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self.cardView.mas_top);
        }];
        
        
        _picImageV = [UIImageView new];
        _picImageV.layer.masksToBounds = YES;
        _picImageV.layer.cornerRadius = 25.f;
        _picImageV.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.cardView addSubview:_picImageV];
        [_picImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.top.equalTo(@30);
            make.height.width.equalTo(@50);
        }];
        
        _name = [UILabel new];
        _name.textColor = kRGBColor(153, 153, 153);
        _name.text = @"haha";
        _name.font = [UIFont systemFontOfSize:14];
        [self.cardView  addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.picImageV).offset(-5);
            make.left.equalTo(self.picImageV.mas_right).offset(8);
        }];
        
        _count = [UILabel new];
        _count.text = @"1人";
        _count.font = [UIFont systemFontOfSize:15];
        [self.cardView  addSubview:_count];
        [_count mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.name);
            make.left.equalTo(self.name.mas_right).offset(5);
        }];
        
        _inCarLabel = [UILabel new];
        _inCarLabel.textColor = kRGBColor(37, 124, 225);
        _inCarLabel.text = @"已上车";
        _inCarLabel.font = [UIFont systemFontOfSize:14];
        [self.cardView  addSubview:_inCarLabel];
        [_inCarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.name);
            make.right.equalTo(self.cardView).offset(-10);
        }];
        
        _inCarImg = [UIImageView new];
        _inCarImg.image = [UIImage imageNamed:@"ico_home_inCar"];
        [self.cardView  addSubview:_inCarImg];
        [_inCarImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.inCarLabel);
            make.right.equalTo(self.inCarLabel.mas_left).offset(-5);
        }];
        
        _payLabel = [UILabel new];
        _payLabel.font = [UIFont systemFontOfSize:14];
        _payLabel.textColor = kRGBColor(237, 116, 70);
        _payLabel.text = @"已付款";
        [self.cardView  addSubview:_payLabel];
        [_payLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inCarLabel.mas_bottom).offset(10);
            make.right.equalTo(self.inCarLabel);
        }];
        
        _payImg = [UIImageView new];
        _payImg.image = [UIImage imageNamed:@"ico_home_pay"];
        [self.cardView  addSubview:_payImg];
        [_payImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.payLabel);
            make.right.equalTo(self.payLabel.mas_left).offset(-5);
        }];
        
        
        _fromImg = [UIImageView new];
        _fromImg.image = [UIImage imageNamed:@"ico_home_green"];
        [self.cardView  addSubview:_fromImg];
        [_fromImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.picImageV);
            make.top.equalTo(self.picImageV.mas_bottom).offset(40);
        }];
        
        _fromLabel = [UILabel new];
        _fromLabel.textColor = kRGBColor(153, 153, 153);
        _fromLabel.font = [UIFont systemFontOfSize:14];
        _fromLabel.text = @"运城市";
        [self.cardView  addSubview:_fromLabel];
        [_fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fromImg.mas_right).offset(8);
            make.centerY.equalTo(self.fromImg);
        }];
        
        _toLabel = [UILabel new];
        _toLabel.font = [UIFont systemFontOfSize:14];
        _toLabel.text = @"河津市";
        [self.cardView  addSubview:_toLabel];
        [_toLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fromLabel);
            make.top.equalTo(self.fromLabel.mas_bottom).offset(5);
        }];
        
        _toImg  = [UIImageView new];
        _toImg.image = [UIImage imageNamed:@"ico_home_red"];
        [self.cardView  addSubview:_toImg];
        [_toImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.toLabel);
            make.centerX.equalTo(self.fromImg);
            make.bottom.equalTo(self.cardView).offset(-50);
        }];
        
        _locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         [_locationBtn setImage:[UIImage imageNamed:@"ico_route_location"] forState:UIControlStateNormal];
        [self.cardView  addSubview:_locationBtn];
        [_locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.payImg);
            make.width.height.equalTo(@30);
            make.centerY.equalTo(self.fromLabel.mas_bottom);
        }];
    }
    return self;
}

-(void)setModel:(OrderListModel *)model {
    [_picImageV sd_setImageWithURL:[NSURL URLWithString:model.user.portrait]];
    _name.text = model.user.nickname;
    _count.text = [NSString stringWithFormat:@"%ld人",(long)model.personNum];
    _fromLabel.text = model.startName;
    _toLabel.text = model.destinationName;
    
    if (model.payStatus == 2) {
        _payLabel.text = @"未支付";
        _payLabel.textColor = [UIColor grayColor];
        _picImageV.image = [UIImage imageNamed:@"ico_home_pay_gary"];
    } else {
        _payLabel.text = @"已支付";
        _payLabel.textColor = kRGBColor(237, 116, 70);
        _picImageV.image = [UIImage imageNamed:@"ico_home_pay"];
    }
    NSString *carType = [OrderStatusTool getCarStatu:model.orderStatus];
    if ([carType isEqualToString:@"已上车"]) {
        _inCarImg.image = [UIImage imageNamed:@"ico_home_inCar"];
        _inCarLabel.textColor = kRGBColor(37, 124, 225);
        _inCarLabel.text =carType;
    }
    if ([carType isEqualToString:@"已下车"]) {
        _inCarLabel.text =carType;
        _inCarLabel.textColor = [UIColor grayColor];
        _inCarImg.image = [UIImage imageNamed:@"ico_home_inCar_gary"];
    }
}

- (void)close {
    [[CustomView getInstancetype]closeWindowAlertWithanimated:YES];
}

@end
