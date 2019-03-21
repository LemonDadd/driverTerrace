//
//  LeaveView.m
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "LeaveView.h"
#import "LeaveTableViewCell.h"

@interface LeaveView()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIScrollView *scr;
@property (nonatomic, strong)UIView *content;
@property (nonatomic, strong)UIView *line;

@end

@implementation LeaveView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _topView = [UIView new];
        [self addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(@40);
        }];
        
        _scr = [UIScrollView new];
        [self addSubview:_scr];
        [_scr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
        
        _content = [UIView new];
        [self addSubview:_content];
        [_content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.scr);
            make.height.equalTo(self.scr);
        }];
        
        NSArray *titles = @[@"审批中",@"已通过",@"未通过"];
        NSMutableArray *ma= [NSMutableArray new];
        for (int i=0; i<3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i;
            [_topView addSubview:btn];
            [ma addObject:btn];
            if (i == 0) {
                _line = [UIView new];
                _line.backgroundColor = kRGBColor(37, 124, 225);
                [_topView addSubview:_line];
                [_line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(btn);
                    make.width.equalTo(btn).multipliedBy(.5);
                    make.bottom.equalTo(self.topView);
                    make.height.equalTo(@1);
                }];
            }
            
        }
        [ma mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
        [ma mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(@0);
        }];
        
       
        
        UIView *last = nil;
        for (int i=0; i<2; i++) {
            UITableView *tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            tab.backgroundColor = kRGBColor(249, 249, 248);
            tab.delegate =self;
            tab.dataSource =self;
            tab.sectionFooterHeight = 0;
            tab.sectionHeaderHeight = 0;
            [_content addSubview:tab];
            [self setExtraCellLineHidden:tab];
            if ([tab respondsToSelector:@selector(setSeparatorInset:)]) {
                [tab setSeparatorInset:UIEdgeInsetsZero];
            }
            [tab registerNib:[UINib nibWithNibName:NSStringFromClass([LeaveTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"LeaveTableViewCell"];
            [tab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self.content);
                make.width.equalTo(self);
                if (last == nil) {
                    make.left.equalTo(self.content);
                } else {
                    make.left.equalTo(last.mas_right);
                }
            }];
            last = tab;
        }
        [_content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(last);
        }];
        
    }
    return self;
}

- (void)btnEvent:(UIButton *)sender {
    
    for (UIView *btn in _topView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [(UIButton *)btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    [sender setTitleColor:kRGBColor(249, 249, 248) forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.1 animations:^{
        [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(sender);
            make.width.equalTo(sender).multipliedBy(.5);
            make.height.equalTo(@1);
            make.bottom.equalTo(self.topView);
        }];
        [self layoutIfNeeded];
    }];
    [self seletedItem:sender.tag];
}


- (void)seletedItem:(NSInteger)indx {
    [_scr setContentOffset:CGPointMake((kScreenWidth-20)*indx, 0) animated:YES];
}


- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeaveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeaveTableViewCell"];
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
