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

@end

@implementation HomeUserView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _picImageV = [UIImageView new];
        _picImageV.layer.masksToBounds = YES;
        _picImageV.layer.cornerRadius = 20.f;
        [self addSubview:_picImageV];
        [_picImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.height.width.equalTo(@30);
        }];
        
        _name = [UILabel new];
        [self addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.picImageV).offset(-5);
            make.left.equalTo(self.picImageV.mas_right).offset(8);
        }];
        
        _count = [UILabel new];
        [self addSubview:_count];
        [_count mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.picImageV.mas_bottom).offset(5);
            make.left.equalTo(self.name.mas_right).offset(5);
        }];
        
        _inCarLabel = [UILabel new];
        [self addSubview:_inCarLabel];
        [_inCarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.name);
            make.right.equalTo(self).offset(-10);
        }];
        
        _inCarImg = [UIImageView new];
        [self addSubview:_inCarImg];
        [_inCarImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.inCarLabel);
            make.right.equalTo(self.inCarLabel.mas_left);
        }];
        
        _payLabel = [UILabel new];
        [self addSubview:_payLabel];
        [_payLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.count);
            make.right.equalTo(self.inCarLabel);
        }];
        
        _payImg = [UIImageView new];
        [self addSubview:_payImg];
        [_payImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.payLabel);
            make.right.equalTo(self.payLabel.mas_left);
        }];
        
        
        _fromImg = [UIImageView new];
        [self addSubview:_fromImg];
        [_fromImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.picImageV);
            make.top.equalTo(self.picImageV.mas_bottom).offset(20);
        }];
        
        _fromLabel = [UILabel new];
        [self addSubview:_fromLabel];
        [_fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fromImg.mas_right).offset(8);
            make.centerY.equalTo(self.fromImg);
        }];
        
        _toLabel = [UILabel new];
        [self addSubview:_toLabel];
        [_toLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.fromLabel);
            make.top.equalTo(self.fromLabel.mas_bottom).offset(5);
        }];
        
        _toImg  = [UIImageView new];
        [self addSubview:_toImg];
        [_toImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.toLabel);
            make.centerX.equalTo(self.fromImg);
        }];
    
        
        _addImageVeiw = [UIImageView new];
        _addImageVeiw.image = [UIImage imageNamed:@""];
        _addImageVeiw.hidden = YES;
        [self addSubview:_addImageVeiw];
        [_addImageVeiw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
    }
    return self;
}

@end
