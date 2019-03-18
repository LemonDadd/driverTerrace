//
//  MyView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "MyView.h"
#import "MyHeaderTableViewCell.h"
#import "MyTextFieldTableViewCell.h"
#import "LZPickerView.h"

@interface MyView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tab;
@property (nonatomic, strong)NSArray *array;
@property (nonatomic, strong)NSArray *parray;
@property (nonatomic,strong)LZPickerView *lzPickerVIew;
@property (nonatomic, strong)UIView *bg;

@end

@implementation MyView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = @[@"头像",@"姓名",@"性别",@"手机号",@"身份证",@"驾驶证",@"牌照",@"车型",@"驾龄"];
        _parray = @[@"头像",@"请输入姓名",@"选择性别",@"请输入手机号",@"请输入身份证",@"请输入驾驶证",@"请输入牌照",@"请输入车型",@"请选择驾龄"];
        
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
        self.lzPickerVIew  = views[0];
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (indexPath.row == 0) {
        MyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyHeaderTableViewCell"];
        if (cell == nil) {
            cell = [[MyHeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyHeaderTableViewCell"];
        }
        cell.leftLabel.text = _array[indexPath.row];
        return cell;
    } else {
        MyTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTextFieldTableViewCell"];
        if (cell == nil) {
            cell = [[MyTextFieldTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTextFieldTableViewCell"];
        }
        
        cell.textField.placeholder = _parray[indexPath.row];
        cell.leftLabel.text = _array[indexPath.row];
        cell.textField.enabled =true;
        if (indexPath.row == 2|| indexPath.row == 8) {
            cell.textField.enabled =false;
        }
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
    }
    
    if (indexPath.row == 2) {
        [self resignFirstResponder];
        [self.lzPickerVIew lzPickerVIewType:LZPickerViewTypeSexAndHeight];
        self.lzPickerVIew.dataSource =@[@"男",@"女"];
        self.lzPickerVIew.titleText = @"性别";
        self.lzPickerVIew.selectValue  = ^(NSString *value){
            
        };
        [self.lzPickerVIew show];
    }
    
    if (indexPath.row == 8) {
        [self resignFirstResponder];
        [self.lzPickerVIew lzPickerVIewType:LZPickerViewTypeSexAndHeight];
        self.lzPickerVIew.dataSource = @[@"1年以下",@"1年",@"2年",@"3年",@"4年",@"5年",@"6年",@"7年",@"8年",@"9年",@"10年",@"10年以上"];
        self.lzPickerVIew.titleText = @"驾龄";
        self.lzPickerVIew.selectValue  = ^(NSString *value){
        };
        [self.lzPickerVIew show];
        
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
