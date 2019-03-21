//
//  HomeUserView.m
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomeUserView.h"

@interface HomeUserView ()

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
@property (nonatomic, strong)UIImageView *addImageVeiw;

@property (nonatomic, strong)UIView *orderTypeFellowView;
@property (nonatomic, strong)UIView *orderTypeNoneView;

@end

@implementation HomeUserView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _picImageV = [UIImageView new];
        _picImageV.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _picImageV.layer.masksToBounds = YES;
        _picImageV.layer.cornerRadius = 15.f;
        [self addSubview:_picImageV];
        [_picImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.height.width.equalTo(@30);
        }];
        
        _name = [UILabel new];
        _name.textColor = kRGBColor(153, 153, 153);
        _name.text = @"haha";
        _name.font = [UIFont systemFontOfSize:12];
        [self addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.picImageV);
            make.left.equalTo(self.picImageV.mas_right).offset(8);
            make.right.equalTo(self.mas_centerX).offset(30);
        }];
        
        _count = [UILabel new];
        _count.text = @"1人";
        _count.font = [UIFont systemFontOfSize:15];
        [self addSubview:_count];
        [_count mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.picImageV.mas_bottom).offset(5);
            make.left.equalTo(self.picImageV);
        }];
        
        _inCarLabel = [UILabel new];
        _inCarLabel.textColor = kRGBColor(37, 124, 225);
        _inCarLabel.text = @"已上车";
        _inCarLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_inCarLabel];
        [_inCarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.name);
            make.right.equalTo(self).offset(-8);
        }];
        
        
        
        _inCarImg = [UIImageView new];
        _inCarImg.image = [UIImage imageNamed:@"ico_home_inCar"];
        [self addSubview:_inCarImg];
        [_inCarImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.inCarLabel);
            make.right.equalTo(self.inCarLabel.mas_left);
        }];

        
        _payLabel = [UILabel new];
        _payLabel.font = [UIFont systemFontOfSize:12];
        _payLabel.textColor = kRGBColor(237, 116, 70);
        _payLabel.text = @"已付款";
        [self addSubview:_payLabel];
        [_payLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.count);
            make.right.equalTo(self.inCarLabel);
        }];
        
        _payImg = [UIImageView new];
        _payImg.image = [UIImage imageNamed:@"ico_home_pay"];
        [self addSubview:_payImg];
        [_payImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.payLabel);
            make.right.equalTo(self.payLabel.mas_left);
        }];
        
        
        _fromImg = [UIImageView new];
        _fromImg.image = [UIImage imageNamed:@"ico_home_green"];
        [self addSubview:_fromImg];
        [_fromImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.picImageV);
            make.top.equalTo(self.count.mas_bottom).offset(20);
        }];

        _fromLabel = [UILabel new];
        _fromLabel.textColor = kRGBColor(153, 153, 153);
        _fromLabel.font = [UIFont systemFontOfSize:14];
        _fromLabel.text = @"运城市";
        [self addSubview:_fromLabel];
        [_fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fromImg.mas_right).offset(8);
            make.centerY.equalTo(self.fromImg);
        }];

        _toLabel = [UILabel new];
        _toLabel.font = [UIFont systemFontOfSize:14];
        _toLabel.text = @"河津市";
        [self addSubview:_toLabel];
        [_toLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fromLabel);
            make.top.equalTo(self.fromLabel.mas_bottom).offset(5);
        }];

        _toImg  = [UIImageView new];
        _toImg.image = [UIImage imageNamed:@"ico_home_red"];
        [self addSubview:_toImg];
        [_toImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.toLabel);
            make.centerX.equalTo(self.fromImg);
        }];


        _orderTypeFellowView = [UIView new];
        _orderTypeFellowView.backgroundColor = [UIColor whiteColor];
        _orderTypeFellowView.hidden = YES;
        [self addSubview:_orderTypeFellowView];
        [_orderTypeFellowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.count.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
        
        _addImageVeiw = [UIImageView new];
        _addImageVeiw.image = [UIImage imageNamed:@"ico_home_add"];
        [_orderTypeFellowView addSubview:_addImageVeiw];
        [_addImageVeiw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.orderTypeFellowView);
        }];
        
        _orderTypeNoneView = [UIView new];
        _orderTypeNoneView.hidden = YES;
        _orderTypeNoneView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_orderTypeNoneView];
        [_orderTypeNoneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];

        UILabel *label = [UILabel new];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"手动\n添加乘客";
        label.numberOfLines = 0;
        [_orderTypeNoneView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.orderTypeNoneView);
        }];
    }
    return self;
}

-(void)setModel:(OrderListModel *)model {
    
    
   
    if (model.type == OrderTypeNone) {
        self.orderTypeNoneView.hidden = NO;
    }
    if (model.type == OrderTypeFellow) {
        self.inCarImg.hidden = YES;
        self.inCarLabel.hidden = YES;
        self.payImg.hidden = YES;
        self.payLabel.hidden = YES;
        self.orderTypeFellowView.hidden = NO;
    }
    
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

@end
