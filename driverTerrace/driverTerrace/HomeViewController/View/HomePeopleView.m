//
//  HomePeopleView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/14.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomePeopleView.h"

@interface HomePeopleView()

@property (nonatomic, strong)UILabel *lineLabel;
@property (nonatomic, strong)UIImageView *leftImageV;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIImageView *rightImageV;
@property (nonatomic, strong)UIView *contentView;



@end

@implementation HomePeopleView

- (instancetype)init
{
    self = [super init];
    if (self) {
       
        _lineLabel = [UILabel new];
        [self addSubview:_lineLabel];
        [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
        }];
        
        _leftImageV = [UIImageView new];
        [self addSubview:_leftImageV];
        [_leftImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLabel);
            make.top.equalTo(self.lineLabel.mas_bottom).offset(5);
        }];
        
        _priceLabel = [UILabel new];
        [self addSubview:_priceLabel];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.leftImageV);
            make.left.equalTo(self.leftImageV.mas_right);
        }];
        
        
        _timeLabel = [UILabel new];
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.leftImageV);
            make.right.equalTo(self).offset(-10);
        }];
        
        
        _rightImageV = [UIImageView new];
        [self addSubview:_rightImageV];
        [_rightImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.timeLabel);
            make.right.equalTo(self.rightImageV.mas_left);
        }];
        
        UIView *line= [UIView new];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self.leftImageV.mas_bottom).offset(5);
            make.height.equalTo(@.5);
        }];
        
        
        _contentView = [UIView new];
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.top.equalTo(line.mas_bottom);
            make.height.equalTo(self.mas_width);
        }];
        
        UIView *line1= [UIView new];
        [self addSubview:line1];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.top.bottom.equalTo(self.contentView);
            make.width.equalTo(@.5);
        }];
        
        UIView *line2= [UIView new];
        [self addSubview:line2];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.left.right.equalTo(self.contentView);
            make.height.equalTo(@.5);
        }];
        
         [self layoutIfNeeded];
        
    }
    return self;
}



- (void)createUser {
    
    for (UIView *v in self.contentView.subviews) {
        [v removeFromSuperview];
    }
    for (int i=0; i<4; i++) {
        UIView *view = [UIView new];
        [self.contentView addSubview:view];
        switch (i) {
            case 1:{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.top.equalTo(self.contentView);
                    make.right.equalTo(self.contentView.mas_centerX).offset(-.5);
                    make.bottom.equalTo(self.contentView.mas_centerY).offset(-.5);
                }];
            }
                break;
            case 2:{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.top.equalTo(self.contentView);
                    make.left.equalTo(self.contentView.mas_centerX).offset(.5);
                    make.bottom.equalTo(self.contentView.mas_centerY).offset(-.5);
                }];
            }
                break;
            case 3:{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.bottom.equalTo(self.contentView);
                    make.right.equalTo(self.contentView.mas_centerX).offset(-.5);
                    make.top.equalTo(self.contentView.mas_centerY).offset(.5);
                }];
            }
                break;
            case 4:{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.bottom.equalTo(self.contentView);
                    make.left.equalTo(self.contentView.mas_centerX).offset(.5);
                    make.top.equalTo(self.contentView.mas_centerY).offset(.5);
                }];
            }
                break;
            default:
                break;
        }
    }
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
