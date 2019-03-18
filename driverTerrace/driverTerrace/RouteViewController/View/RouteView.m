//
//  RouteView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "RouteView.h"
#import "RouteViewTableViewCell.h"

@interface RouteView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tab;

@end

@implementation RouteView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tab.backgroundColor = kRGBColor(249, 249, 248);
        _tab.delegate =self;
        _tab.dataSource =self;
        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tab.sectionFooterHeight = 0;
        _tab.sectionHeaderHeight = 40;
        [self addSubview:_tab];
        [self setExtraCellLineHidden:_tab];
        [_tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
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
        return 5;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
//    return CGFLOAT_MIN;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RouteViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RouteViewTableViewCell"];
    if (!cell) {
        cell = [[RouteViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RouteViewTableViewCell"];
    };
    return cell;
}

//添加TableView头视图标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"未完成订单";
    } else {
        return @"已完成订单";
    }
}

@end
