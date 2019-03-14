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
        
        self.layer.cornerRadius =5.f;
        self.layer.borderColor =[UIColor blackColor].CGColor;
        self.layer.borderWidth = .5f;
        
        UIView *bg = [UIView new];
        [self.contentView addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        _lineLabel = [UILabel new];
        [bg addSubview:_lineLabel];
        [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@8);
        }];
        
        _arrImage = [UIImageView new];
        [bg addSubview:_arrImage];
        [_arrImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lineLabel);
            make.right.equalTo(bg).offset(-8);
        }];
        
        _rightLabel = [UILabel new];
        [bg addSubview:_rightLabel];
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.lineLabel);
            make.right.equalTo(self.arrImage.mas_left).offset(-8);
        }];
        
        _sitImage = [UIImageView new];
        [bg addSubview:_sitImage];
        [_sitImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLabel);
            make.top.equalTo(self.lineLabel.mas_bottom).offset(8);
        }];
        
        _sitLabel = [UILabel new];
        [bg addSubview:_sitLabel];
        [_sitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.sitImage);
            make.left.equalTo(self.sitImage.mas_right);
        }];
        
        
        _priceLabel = [UILabel new];
        [bg addSubview:_priceLabel];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.sitImage);
            make.left.equalTo(self.sitLabel.mas_right).offset(8);
        }];
        
        _timeImage = [UIImageView new];
        [bg addSubview:_timeImage];
        [_timeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLabel);
            make.top.equalTo(self.sitImage.mas_bottom).offset(8);
        }];
        
        _timeLabel = [UILabel new];
        [bg addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.timeLabel);
            make.left.equalTo(self.timeLabel.mas_right);
            make.bottom.equalTo(bg).offset(-8);
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
