//
//  RouteViewTableViewCell.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "RouteViewTableViewCell.h"

@interface RouteViewTableViewCell ()

@property (nonatomic, strong)UILabel *lineLabel;

@property (nonatomic, strong)UILabel *rightLabel;
@property (nonatomic, strong)UIImageView *arrImage;

@property (nonatomic, strong)UIImageView *sitImage;
@property (nonatomic, strong)UILabel *sitLabel;

@property (nonatomic, strong)UILabel *priceLabel;

@property (nonatomic, strong)UIImageView *timeImage;
@property (nonatomic, strong)UILabel *timeLabel;

@end

@implementation RouteViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        UIView *bg = [UIView new];
        bg.backgroundColor = [UIColor whiteColor];
        bg.layer.cornerRadius =5.f;
        bg.layer.borderColor =[UIColor blackColor].CGColor;
        bg.layer.borderWidth = .5f;
        [self.contentView addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.left.equalTo(@15);
            make.right.equalTo(@-15);
        }];
        
        _lineLabel = [UILabel new];
        _lineLabel.text = @"太原市-运城市";
        _lineLabel.font = [UIFont boldSystemFontOfSize:18];
        _lineLabel.textColor = [UIColor blackColor];
        [bg addSubview:_lineLabel];
        [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@8);
        }];
        
        _arrImage = [UIImageView new];
        _arrImage.image = [UIImage imageNamed:@"ico_right"];
        [bg addSubview:_arrImage];
        [_arrImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lineLabel);
            make.right.equalTo(bg).offset(-8);
        }];
        
        _rightLabel = [UILabel new];
        _rightLabel.text = @"进行中";
        _rightLabel.font = [UIFont systemFontOfSize:15];
        _rightLabel.textColor = kRGBColor(37, 124, 229);
        [bg addSubview:_rightLabel];
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lineLabel);
            make.right.equalTo(self.arrImage.mas_left).offset(-8);
        }];
        
        _sitImage = [UIImageView new];
        _sitImage.image = [UIImage imageNamed:@"ico_route_sit"];
        [bg addSubview:_sitImage];
        [_sitImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLabel);
            make.top.equalTo(self.lineLabel.mas_bottom).offset(8);
        }];
        
        _sitLabel = [UILabel new];
        _sitLabel.text = @"3/5";
        _sitLabel.font = [UIFont systemFontOfSize:12];
        [bg addSubview:_sitLabel];
        [_sitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.sitImage);
            make.left.equalTo(self.sitImage.mas_right).offset(5);
        }];
        
        
        _priceLabel = [UILabel new];
        _priceLabel.text = @"￥170.00/座";
        _priceLabel.font = [UIFont systemFontOfSize:12];
        [bg addSubview:_priceLabel];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.sitImage);
            make.left.equalTo(self.sitLabel.mas_right).offset(8);
        }];
        
        _timeImage = [UIImageView new];
        _timeImage.image = [UIImage imageNamed:@"ico_route_time"];
        [bg addSubview:_timeImage];
        [_timeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLabel);
            make.top.equalTo(self.sitImage.mas_bottom).offset(8);
        }];
        
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        [bg addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.timeImage);
            make.left.equalTo(self.timeImage.mas_right).offset(5);
            make.bottom.equalTo(bg).offset(-8);
        }];
        
    }
    return self;
}

-(void)setModel:(RouteListModel *)model {
    _model = model;
    _lineLabel.text = model.circuitname;
    _rightLabel.text = [OrderStatusTool getOrderStatus:model.orderState];
    _timeLabel.text = [NSString stringWithFormat:@"%@ - %@",model.startDate,model.endDate];
    _priceLabel.text = [NSString stringWithFormat:@"￥%.2f/座",model.price];
    _sitLabel.text = [NSString stringWithFormat:@"%@/4",model.personSum];
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
