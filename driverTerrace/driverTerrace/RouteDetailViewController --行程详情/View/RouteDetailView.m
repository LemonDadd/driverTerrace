//
//  RouteDetailView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "RouteDetailView.h"
#import "RouteDetailTableViewCell.h"
#import "RouteDetailTopTableViewCell.h"

@interface RouteDetailView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tab;
@property (nonatomic, strong)NSMutableArray *userList;

@end

@implementation RouteDetailView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tab.backgroundColor = kRGBColor(249, 249, 248);
        _tab.delegate =self;
        _tab.dataSource =self;
        _tab.separatorColor = kRGBColor(37, 124, 225);
        _tab.layer.masksToBounds  = YES;
        _tab.layer.cornerRadius = 8.f;
        _tab.sectionFooterHeight = 0;
        _tab.sectionHeaderHeight = 0;
        [self addSubview:_tab];
        [self setExtraCellLineHidden:_tab];
        [_tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        if ([_tab respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tab setSeparatorInset:UIEdgeInsetsZero];
        }
        [_tab registerNib:[UINib nibWithNibName:NSStringFromClass([RouteDetailTopTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"RouteDetailTopTableViewCell"];
    }
    return self;
}
- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return _userList.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section ==0) {
         RouteDetailTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RouteDetailTopTableViewCell"];
        cell.priceLabel.text = [NSString stringWithFormat:@"%.2f/位",_model.circutiMap.price];
        cell.sitLabel.text = [NSString stringWithFormat:@"%@/4",_model.circutiMap.personNum];
        cell.timeLabel.text = _model.circutiMap.startTime;
        cell.rightLabel.text =  [OrderStatusTool getOrderStatus:_model.orderState];
        
        return cell;
    } else {
        RouteDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RouteDetailTableViewCell"];
        if (!cell) {
            cell = [[RouteDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RouteDetailTableViewCell"];
        };
        OrderListModel *model =_userList[indexPath.row];
        cell.model =model;
        return cell;
    }
  
}

-(void)setModel:(RouteDetailModel *)model {
    _model = model;
    _userList = [NSMutableArray new];
    for (int i=0; i<model.userOrderMaps.count; i++) {
        //用户
        OrderListModel *user = [OrderListModel mj_objectWithKeyValues:model.userOrderMaps[i]];
        user.type = OrderTypeUser;
        user.startName = model.circutiMap.startName;
        user.destinationName = model.circutiMap.destinationName;
        [_userList addObject:user];
        if (user.personNum >1) {
            //同行
            for (int j=0; j<user.personNum-1; j++) {
                OrderListModel *fellow = [OrderListModel mj_objectWithKeyValues:model.userOrderMaps[i]];
                fellow.type = OrderTypeFellow;
                fellow.startName = model.circutiMap.startName;
                fellow.destinationName = model.circutiMap.destinationName;
                [_userList addObject:fellow];
            }
        }
    }
    [_tab reloadData];
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
