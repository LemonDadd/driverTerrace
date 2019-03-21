//
//  HomePeopleView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/14.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomePeopleView.h"
#import "HomeUserView.h"
#import "AddPassengerViewController.h"
#import "HomeAlertView.h"

@interface HomePeopleView()

@property (nonatomic, strong)UILabel *lineLabel;
@property (nonatomic, strong)UIImageView *leftImageV;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIImageView *rightImageV;
@property (nonatomic, strong)UIView *contentView;

@property (nonatomic, strong)NSMutableArray *userListArray;

@end

@implementation HomePeopleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _lineLabel = [UILabel new];
        _lineLabel.font = [UIFont boldSystemFontOfSize:18];
        _lineLabel.textColor = [UIColor blackColor];
        [self addSubview:_lineLabel];
        [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
        }];
        
        _leftImageV = [UIImageView new];
        _leftImageV.image = [UIImage imageNamed:@"ico_home_Set"];
        [self addSubview:_leftImageV];
        [_leftImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineLabel);
            make.top.equalTo(self.lineLabel.mas_bottom).offset(5);
        }];
        
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_priceLabel];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.leftImageV);
            make.left.equalTo(self.leftImageV.mas_right).offset(5);
        }];
        
        
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.leftImageV);
            make.right.equalTo(self).offset(-10);
        }];
        
        
        _rightImageV = [UIImageView new];
        _rightImageV.image = [UIImage imageNamed:@"ico_home_time"];
        [self addSubview:_rightImageV];
        [_rightImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.timeLabel);
            make.right.equalTo(self.timeLabel.mas_left).offset(-5);
        }];
        
        UIView *line= [UIView new];
        line.backgroundColor = kRGBColor(204, 204, 204);
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self.leftImageV.mas_bottom).offset(5);
            make.height.equalTo(@.5);
        }];
        
        
        _contentView = [UIView new];
        [self addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self).offset(-5);
            make.top.equalTo(line.mas_bottom);
        }];
        [self layoutIfNeeded];
        
    }
    return self;
}



- (void)createUser {
    
    for (UIView *v in self.contentView.subviews) {
        [v removeFromSuperview];
    }
    
    UIView *line1= [UIView new];
    line1.backgroundColor = kRGBColor(204, 204, 204);
    [_contentView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.top.bottom.equalTo(self.contentView);
        make.width.equalTo(@.5);
    }];
    
    UIView *line2= [UIView new];
    line2.backgroundColor = kRGBColor(204, 204, 204);
    [_contentView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.left.right.equalTo(self.contentView);
        make.height.equalTo(@.5);
    }];
    
    for (int i=0; i<_userListArray.count; i++) {
        OrderListModel *model = _userListArray[i];
        HomeUserView *view = [HomeUserView new];
        view.model = model;
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userEvente:)];
        view.tag = i;
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:gr];
        [_contentView addSubview:view];
        switch (i) {
            case 0:{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.top.equalTo(self.contentView);
                    make.right.equalTo(line1.mas_left);
                    make.bottom.equalTo(line2.mas_top);
                }];
            }
                break;
            case 1:{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.top.equalTo(self.contentView);
                    make.left.equalTo(line1.mas_right);
                    make.bottom.equalTo(line2.mas_top);
                }];
            }
                break;
            case 2:{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.bottom.equalTo(self.contentView);
                    make.right.equalTo(line1.mas_left);
                    make.top.equalTo(line2.mas_bottom);
                }];
            }
                break;
            case 3:{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.bottom.equalTo(self.contentView);
                    make.left.equalTo(line1.mas_right);
                    make.top.equalTo(line2.mas_bottom);
                }];
            }
                break;
            default:
                break;
        }
    }
}

- (void)userEvente:(UITapGestureRecognizer *)gr {
    
    NSInteger tag = [gr view].tag;
    OrderListModel *user  =_userListArray[tag];
    if (user.type == OrderTypeNone) {
        AddPassengerViewController *vc= [AddPassengerViewController new];
        vc.model = _model;
        [self.viewController.navigationController pushViewController:vc animated:YES];
    } else {
        HomeAlertView *alert = [[HomeAlertView alloc]initWithList:_userListArray];
        alert.indx = tag;
        [[CustomView getInstancetype] windowAlertBy:alert isTouchClose:false color:nil animated:YES addDelegate:nil];
        [alert mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(alert.superview);
            make.width.height.equalTo(self);
        }];
        [alert layoutIfNeeded];
    }
    
}

-(void)setModel:(OrderModel *)model {
    
    _model = model;
    _lineLabel.text = [NSString stringWithFormat:@"线路车:%@-%@",model.circuit.startName,model.circuit.destinationName];
    _priceLabel.text = [NSString stringWithFormat:@"%.2f/位", model.circuit.price];
    _timeLabel.text = model.circuit.starttime;
    
    
    //用户逻辑
    _userListArray = [NSMutableArray new];
    for (int i=0; i<model.orderList.count; i++) {
        //用户
        OrderListModel *user = [OrderListModel mj_objectWithKeyValues:model.orderList[i]];
        user.startName = model.circuit.startName;
        user.destinationName = model.circuit.destinationName;
        user.lineId = model.circuit.id;
        user.type = OrderTypeUser;
        [_userListArray addObject:user];
        if (user.personNum >1) {
            //同行
            for (int j=0; j<user.personNum-1; j++) {
                OrderListModel *fellow = [OrderListModel mj_objectWithKeyValues:model.orderList[i]];
                fellow.type = OrderTypeFellow;
                fellow.startName = model.circuit.startName;
                fellow.destinationName = model.circuit.destinationName;
                fellow.lineId = model.circuit.id;
                [_userListArray addObject:fellow];
            }
        }
    }
    if (_userListArray.count<4) {
        NSInteger cont =4-_userListArray.count;
        //添加乘客
        for (int i=0; i<cont; i++) {
            OrderListModel *user = [OrderListModel new];
            user.type =OrderTypeNone;
            user.startName = model.circuit.startName;
            user.destinationName = model.circuit.destinationName;
            user.lineId = model.circuit.id;
            [_userListArray addObject:user];
        }
    }
    
    [self createUser];
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
