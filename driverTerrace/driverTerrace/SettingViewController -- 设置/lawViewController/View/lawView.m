//
//  lawView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "lawView.h"

@interface lawView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tab;
@property (nonatomic, strong)NSArray *array;

@end

@implementation lawView

- (instancetype)init
{
    self = [super init];
    if (self) {
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
        [_tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        if ([_tab respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tab setSeparatorInset:UIEdgeInsetsZero];
        }
        _array = @[@"软件使用协议",@"个人信息保护协议",@"乘客用户协议"];
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    };
    cell.textLabel.text = _array[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
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
