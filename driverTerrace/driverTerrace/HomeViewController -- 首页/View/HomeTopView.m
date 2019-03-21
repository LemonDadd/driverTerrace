//
//  HomeTopView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/14.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomeTopView.h"
#import "MyViewController.h"
#import "RouteViewController.h"
#import "SettingViewController.h"
#import "MyWalletViewController.h"
#import "LeaveViewController.h"


@interface HomeTopView()

@property (nonatomic, strong)UIImageView *headerView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *countLabel;
@property (nonatomic, strong)UILabel *peopleLabel;
@property (nonatomic, strong)UIView *contentV;

@end

@implementation HomeTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _headerView = [UIImageView new];
        _headerView.backgroundColor = [UIColor redColor];
        _headerView.layer.masksToBounds = YES;
        _headerView.layer.cornerRadius = 25.f;
        [self addSubview:_headerView];
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self.mas_top);
            make.width.height.equalTo(@50);
        }];
        
        
        _nameLabel = [UILabel new];
        _nameLabel.text = @"郑萌萌";
        _nameLabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.headerView);
            make.top.equalTo(self.headerView.mas_bottom).offset(10);
        }];
        
        _countLabel = [UILabel new];
       
        _countLabel.textColor = kColorWithHex(0x9F9F9F);
        _countLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_countLabel];
        [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_centerX).offset(-5);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
        }];
        
        _peopleLabel = [UILabel new];
        _peopleLabel.textColor = kColorWithHex(0x9F9F9F);
        _peopleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_peopleLabel];
        [_peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_centerX).offset(5);
            make.centerY.equalTo(self.countLabel);
        }];
        
        _contentV = [UIView new];
        [self addSubview:_contentV];
        [_contentV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.peopleLabel.mas_bottom).offset(20);
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.equalTo(@80);
            make.bottom.equalTo(self);
        }];
        
        NSMutableArray *btns = [NSMutableArray array];
        
        NSArray *imageArray = @[@"ico_home_user",@"ico_home_route",@"ico_home_wallet",@"ico_home_qingjia",@"ico_home_sys"];
        NSArray *titleArray = @[@"资料",@"行程",@"钱包",@"请假",@"设置"];
        for (int i=0; i<imageArray.count; i++) {
            UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
            [btn setTitle:titleArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:kColorWithHex(0x8B8B8B) forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.tag =i;
            [btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
            [_contentV addSubview:btn];
            [btns addObject:btn];
            
        }
        [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
        
        [btns mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentV);
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            for (UIButton *btn in btns) {
                // button标题的偏移量
                btn.titleEdgeInsets = UIEdgeInsetsMake(btn.imageView.frame.size.height+5, -btn.imageView.bounds.size.width, 0,0);
                // button图片的偏移量
                btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel.frame.size.width/2, btn.titleLabel.frame.size.height+5, -btn.titleLabel.frame.size.width/2);
            }
           
        });
        [self reloadData];
        [self layoutIfNeeded];
    }
    return self;
}

- (void)reloadData {
    UserInfoModel *model =[UserInfoModel getUserInfoModel];
    [_headerView sd_setImageWithURL:[NSURL URLWithString:model.portrait]];
    _nameLabel.text =model.drivernickname;
    _countLabel.text =[NSString stringWithFormat:@"累计发车:%ld次",(long)model.carcount];
    _peopleLabel.text =[NSString stringWithFormat: @"接送:%ld人",(long)model.totalpeople];
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

- (void)btnEvent:(UIButton *)btn {
 
    
    if (btn.tag == 0) {
        MyViewController *vc= [MyViewController new];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag ==1) {
        RouteViewController *vc= [RouteViewController new];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag ==2) {
        MyWalletViewController *vc= [MyWalletViewController new];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag ==3) {
        LeaveViewController *vc = [LeaveViewController new];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag ==4) {
        SettingViewController *vc= [SettingViewController new];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
}

@end
