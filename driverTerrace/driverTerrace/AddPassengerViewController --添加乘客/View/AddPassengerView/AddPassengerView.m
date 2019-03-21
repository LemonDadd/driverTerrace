//
//  AddPassengerView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "AddPassengerView.h"
#import "AddSelectedTableViewCell.h"
#import "MyTextFieldTableViewCell.h"
#import "LZPickerView.h"
#import "CityViewController.h"

@interface AddPassengerView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tab;
@property (nonatomic, strong)NSArray *array;
@property (nonatomic, strong)NSArray *parray;
@property (nonatomic, strong)NSArray *payTypeList;
@property (nonatomic, strong)NSArray *carTypeList;
@property (nonatomic,strong)LZPickerView *lzPickerView;

@property (nonatomic,strong) UITextField *name;
@property (nonatomic,strong) UITextField *fuwu;
@property (nonatomic,strong) UITextField *fromField;
@property (nonatomic,strong) UITextField *toField;
@property (nonatomic,strong) UITextField *timeField;
@property (nonatomic,strong) NSString *payType;
@property (nonatomic,strong) NSString *inCarType;


@end

@implementation AddPassengerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = @[@"乘客姓名",@"服务方式",@"出发地",@"目的地",@"乘车时间",@"是否支付车费",@"当前是否上车"];
        _parray = @[@"请填写乘客姓名",@"站——站",@"请选择出发地",@"请选择目的地",@"请选择乘车时间",@"已付款",@"已上车"];
        _tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tab.backgroundColor = [UIColor whiteColor];
        _tab.layer.masksToBounds  = YES;
        _tab.layer.cornerRadius = 8.f;
        _tab.delegate =self;
        _tab.dataSource =self;
        _tab.estimatedRowHeight =50;
        _tab.estimatedSectionFooterHeight=0;
        _tab.estimatedSectionHeaderHeight =0;
        _tab.separatorColor = kRGBColor(237, 237, 237);
        [self addSubview:_tab];
        [self setExtraCellLineHidden:_tab];
        [_tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        if ([_tab respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tab setSeparatorInset:UIEdgeInsetsZero];
        }
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"LZPickerView" owner:nil options:nil];
        self.lzPickerView  = views[0];
        
        EBDropdownListItem *item1 = [[EBDropdownListItem alloc] initWithItem:@"2" itemName:@"未支付"];
        EBDropdownListItem *item2 = [[EBDropdownListItem alloc] initWithItem:@"3" itemName:@"已支付"];
        EBDropdownListItem *item3 = [[EBDropdownListItem alloc] initWithItem:@"2" itemName:@"未上车"];
        EBDropdownListItem *item4 = [[EBDropdownListItem alloc] initWithItem:@"1" itemName:@"已上车"];
        _payTypeList = @[item1,item2];
        _carTypeList = @[item3,item4];
        
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    //kWeakSelf(self);
    //    if (indexPath.row == 5) {
    //        AddSelectedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddSelectedTableViewCell"];
    //        if (cell == nil) {
    //            cell = [[AddSelectedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddSelectedTableViewCell"];
    //        }
    //        cell.leftLabel.text = _array[indexPath.row];
    //        cell.dropdownListView.dataSource = _payTypeList;
    //        [cell.dropdownListView setDropdownListViewSelectedBlock:^(EBDropdownListView *dropdownListView) {
    //            weakself.payType =dropdownListView.selectedItem.itemName;
    //        }];
    //        return cell;
    //    }else if (indexPath.row ==6){
    //        AddSelectedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddSelectedTableViewCell1"];
    //        if (cell == nil) {
    //            cell = [[AddSelectedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddSelectedTableViewCell2"];
    //        }
    //        cell.leftLabel.text = _array[indexPath.row];
    //        cell.dropdownListView.dataSource = _carTypeList;
    //        [cell.dropdownListView setDropdownListViewSelectedBlock:^(EBDropdownListView *dropdownListView) {
    //             weakself.inCarType =dropdownListView.selectedItem.itemName;
    //        }];
    //        return cell;
    //    }else  {
    MyTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTextFieldTableViewCell"];
    if (cell == nil) {
        cell = [[MyTextFieldTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTextFieldTableViewCell"];
    }
    
    cell.textField.placeholder = _parray[indexPath.row];
    cell.leftLabel.text = _array[indexPath.row];
    cell.textField.enabled =false;
    cell.textField.placeholder = _parray[indexPath.row];
    if (indexPath.row == 0) {
        cell.textField.enabled =true;
        _name = cell.textField;
    }
    if (indexPath.row == 1) {
        cell.textField.text = _parray[indexPath.row];
        _fuwu = cell.textField;
    }
    if (indexPath.row == 2) {
        _fromField = cell.textField;
        _fromField.text = _model.circuit.startName;
    }
    if (indexPath.row == 3) {
        _toField = cell.textField;
        _toField.text = _model.circuit.destinationName;
    }
    if (indexPath.row == 4) {
        _timeField = cell.textField;
    }
    if (indexPath.row == 5 || indexPath.row == 6) {
        cell.textField.text = _parray[indexPath.row];
    }
    
    return cell;
    //    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    kWeakSelf(self);
    if (indexPath.row == 4) {
        [self.lzPickerView lzPickerVIewType:LZPickerViewTypeWeigth];
        self.lzPickerView.dataSource = @[[self getOneWeek],[self getTime]];
        self.lzPickerView.titleText = @"乘车时间";
        self.lzPickerView.selectValue  = ^(NSString *value){
            weakself.timeField.text = value;
        };
        [self.lzPickerView show];
    }
}

- (NSArray *)getOneWeek {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<7; i++) {
        NSDate  *date = [NSDate jk_dateAfterDate:[NSDate date] day:i+1];
        NSString * timeStr =[NSDate jk_stringWithDate:date format:@"MM-dd"];
        [arr addObject:timeStr];
    }
    return [NSArray arrayWithArray:arr];
}

- (NSArray *)getTime {
    NSMutableArray *arr = [NSMutableArray array];
    NSDate *date = [[NSDate jk_zeroTodayDate] jk_dateByAddingMinutes:30];
    for (int i=0; i<46; i++) {
        date =[date jk_dateByAddingMinutes:30];
        NSString * timeStr =[NSDate jk_stringWithDate:date format:@"HH:mm"];// [NSString stringWithFormat:@"%lu:%lu",(unsigned long)[NSDate jk_hour:date],(unsigned long)[NSDate jk_minute:date]];
        [arr addObject:timeStr];
    }
    return [NSArray arrayWithArray:arr];
}



- (void)save {
    
    if (!self.name.text.length) {
        [CustomView alertMessage:@"请输入姓名" view:self];
        return;
    }
    if (!self.timeField.text.length) {
        [CustomView alertMessage:@"请选择出发时间" view:self];
        return;
    }
//    if (!self.payType.length) {
//        [CustomView alertMessage:@"请选择是否支付车费" view:self];
//        return;
//    }
//    if (!self.inCarType.length) {
//        [CustomView alertMessage:@"请选择是否上车" view:self];
//        return;
//    }
    
    [AllRequest requestOfflineUserByServicetype:@"站到站" bytime:_timeField.text pay:@"" getoncar:@"" name:_name.text driverOrderid:_model.orderId request:^(BOOL message, NSString * _Nonnull errorMsg) {
        if (message) {
            [self.viewController.navigationController popViewControllerAnimated:YES];
        } else {
            [CustomView alertMessage:errorMsg view:self];
        }
    }];
}

-(void)setModel:(OrderModel *)model {
    _model =model;
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
