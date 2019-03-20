//
//  RouteView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/15.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "RouteView.h"
#import "RouteViewTableViewCell.h"
#import "RouteDetailViewController.h"

@interface RouteView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tab;
@property (nonatomic, strong)NSMutableArray *allResource;
@property (nonatomic, strong)NSMutableArray *orderOverListArray;
@property (nonatomic, strong)NSMutableArray *orderListArray;
@property (nonatomic, assign) NSInteger page;

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
        _tab.sectionHeaderHeight = 0;
        [self addSubview:_tab];
        [self setExtraCellLineHidden:_tab];
        [_tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self addHistoryData];
        //[self upPull];
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
}

/**
 *  刷新数据
 */
- (void)addHistoryData{
    
    __weak __typeof(self) weakSelf = self;
    self.tab.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf load];
    }];
    // 马上进入刷新状态
    [self.tab.mj_header beginRefreshing];
}

- (void)upPull {
    __weak __typeof(self) weakSelf = self;
    self.tab.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page++;
        [weakSelf load];
    }];
}

- (void)load {
    [AllRequest requestGetOrderListByDriveridByDriverid:[UserInfoModel getUserInfoModel].driverid pageNo:_page request:^(NSArray * _Nonnull message, NSString * _Nonnull errorMsg) {
        if (message) {
            [self update:message];
        }
    }];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _orderListArray.count;
    } else {
        return _orderOverListArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return _orderListArray.count?40:CGFLOAT_MIN;
    } else {
        return _orderOverListArray.count?40:CGFLOAT_MIN;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RouteViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RouteViewTableViewCell"];
    if (!cell) {
        cell = [[RouteViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RouteViewTableViewCell"];
    };
    
    if (indexPath.section == 0) {
        cell.model =_orderListArray[indexPath.row];
    } else {
        cell.model = _orderOverListArray[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        RouteListModel *model =_orderListArray[indexPath.row];
        RouteDetailViewController *vc = [RouteDetailViewController new];
        vc.model = model;
        vc.title = @"进行中";
        [self.viewController.navigationController pushViewController:vc animated:YES];
    } else {
        RouteListModel *model = _orderOverListArray[indexPath.row];
         RouteDetailViewController *vc = [RouteDetailViewController new];
        vc.model = model;
        vc.title = @"已完成";
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
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

- (void)update:(NSArray *)list {
    
    if (self.page == 1) {
        [self.allResource removeAllObjects];
    }
    [self.allResource addObjectsFromArray:list];
    _orderListArray = [NSMutableArray new];
    _orderOverListArray = [NSMutableArray new];
    
    for (RouteListModel *model in self.allResource) {
        if (model.orderState == 1) {
            [_orderOverListArray addObject:model];
        }
        if (model.orderState == 2) {
             [_orderListArray addObject:model];
        }
    }
    [self.tab.mj_header endRefreshing];
    [self.tab reloadData];
}

- (NSMutableArray *)allResource {
    if (!_allResource) {
        _allResource = [NSMutableArray array];
    }
    return _allResource;
}

@end
