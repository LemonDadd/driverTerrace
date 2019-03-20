//
//  RouteDetailTableViewCell.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "RouteDetailTableViewCell.h"

@interface RouteDetailTableViewCell ()

@property (nonatomic, strong)UIImageView *picImageV;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *count;
@property (nonatomic, strong)UILabel *serve;
@property (nonatomic, strong)UILabel *fromLabel;
@property (nonatomic, strong)UILabel *toLabel;
@property (nonatomic, strong)UIImageView *fromImg;
@property (nonatomic, strong)UIImageView *toImg;
@property (nonatomic, strong)UILabel *inCarLabel;
@property (nonatomic, strong)UIImageView *inCarImg;
@property (nonatomic, strong)UILabel *payLabel;
@property (nonatomic, strong)UIImageView *payImg;
@property (nonatomic, strong)UILabel *outCarLabel;
@property (nonatomic, strong)UIImageView *outarImg;
@property (nonatomic, strong)UIButton *locationBtn;


@end

@implementation RouteDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _picImageV = [UIImageView new];
        _picImageV.backgroundColor = [UIColor redColor];
        _picImageV.layer.masksToBounds = YES;
        _picImageV.layer.cornerRadius = 20.f;
        [self.contentView addSubview:_picImageV];
        [_picImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@15);
            make.height.width.equalTo(@40);
        }];
        
        _name = [UILabel new];
        _name.textColor = kRGBColor(153, 153, 153);
        _name.text = @"haha";
        _name.font = [UIFont systemFontOfSize:12];
        [self addSubview:_name];
        [self.contentView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.picImageV).offset(-5);
            make.left.equalTo(self.picImageV.mas_right).offset(8);
        }];
        
        _count = [UILabel new];
        _count.text = @"1人";
        _count.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_count];
        [_count mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.name);
            make.left.equalTo(self.name.mas_right).offset(5);
        }];
        
        _serve = [UILabel new];
        _serve.text = @"门 —— 站";
        _serve.textColor = kRGBColor(37, 124, 225);
        _serve.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_serve];
        [_serve mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.name);
            make.top.equalTo(self.name.mas_bottom).offset(8);
        }];
        
        _inCarLabel = [UILabel new];
        _inCarLabel.textColor = kRGBColor(37, 124, 225);
        _inCarLabel.text = @"已上车";
        _inCarLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_inCarLabel];
        [_inCarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.name);
            make.right.equalTo(self.contentView).offset(-10);
        }];
        
        _inCarImg = [UIImageView new];
        _inCarImg.image = [UIImage imageNamed:@"ico_home_inCar"];
        [self.contentView addSubview:_inCarImg];
        [_inCarImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.inCarLabel);
            make.right.equalTo(self.inCarLabel.mas_left).offset(-5);
        }];
        
        _payLabel = [UILabel new];
        _payLabel.font = [UIFont systemFontOfSize:12];
        _payLabel.textColor = kRGBColor(237, 116, 70);
        _payLabel.text = @"已付款";
        [self.contentView addSubview:_payLabel];
        [_payLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.serve);
            make.right.equalTo(self.inCarLabel);
        }];
        
        _payImg = [UIImageView new];
        _payImg.image = [UIImage imageNamed:@"ico_home_pay"];
        [self.contentView addSubview:_payImg];
        [_payImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.payLabel);
            make.right.equalTo(self.payLabel.mas_left).offset(-5);
        }];
        
        
        _fromImg = [UIImageView new];
        _fromImg.image = [UIImage imageNamed:@"ico_home_green"];
        [self.contentView addSubview:_fromImg];
        [_fromImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.picImageV);
            make.top.equalTo(self.picImageV.mas_bottom).offset(20);
        }];
        
        _fromLabel = [UILabel new];
        _fromLabel.textColor = kRGBColor(153, 153, 153);
        _fromLabel.font = [UIFont systemFontOfSize:14];
        _fromLabel.text = @"运城市";
        [self.contentView addSubview:_fromLabel];
        [_fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fromImg.mas_right).offset(8);
            make.centerY.equalTo(self.fromImg);
        }];
        
        _toLabel = [UILabel new];
        _toLabel.font = [UIFont systemFontOfSize:14];
        _toLabel.text = @"河津市";
        [self.contentView addSubview:_toLabel];
        [_toLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fromLabel);
            make.top.equalTo(self.fromLabel.mas_bottom).offset(5);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        _toImg  = [UIImageView new];
        _toImg.image = [UIImage imageNamed:@"ico_home_red"];
        [self.contentView addSubview:_toImg];
        [_toImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.toLabel);
            make.centerX.equalTo(self.fromImg);
        }];
        
        
        _outCarLabel = [UILabel new];
        _outCarLabel.textColor = kRGBColor(37, 124, 225);
        _outCarLabel.text = @"已下车";
        _outCarLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_outCarLabel];
        [_outCarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.toLabel);
            make.right.equalTo(self.contentView).offset(-10);
        }];
        
        _outarImg = [UIImageView new];
        _outarImg.image = [UIImage imageNamed:@"ico_route_car"];
        [self.contentView addSubview:_outarImg];
        [_outarImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.outCarLabel);
            make.right.equalTo(self.outCarLabel.mas_left).offset(-5);
        }];
        
        _locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_locationBtn setImage:[UIImage imageNamed:@"ico_route_location"] forState:UIControlStateNormal];
        [self.contentView addSubview:_locationBtn];
        [_locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.payImg);
            make.top.equalTo(self.fromLabel);
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
