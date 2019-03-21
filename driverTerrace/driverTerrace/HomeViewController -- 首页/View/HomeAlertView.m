//
//  HomeAlertView.m
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomeAlertView.h"
#import "HomeCarView.h"
#import "LWDPageControl.h"


@interface HomeAlertView ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scr;
@property (nonatomic, strong)UIView *contentV;
@property (nonatomic, strong)LWDPageControl *pageControl;

@end

@implementation HomeAlertView

- (instancetype)initWithList:(NSArray *)list
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _scr = [UIScrollView new];
        _scr.backgroundColor = [UIColor clearColor];
        _scr.showsVerticalScrollIndicator = false;
        _scr.showsHorizontalScrollIndicator =false;
        _scr.pagingEnabled = YES;
        _scr.delegate =self;
        [self addSubview:_scr];
        [_scr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _contentV = [UIView new];
        _contentV.backgroundColor = [UIColor clearColor];
        [_scr addSubview:_contentV];
        [_contentV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.scr);
            make.height.equalTo(self.scr);
        }];
        
        UIView *last = nil;
        for (int i=0; i<list.count; i++) {
            OrderListModel *model = list[i];
            HomeCarView *v = [HomeCarView new];
            v.model = model;
            [_contentV addSubview:v];
            if (last == nil) {
                [v mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.centerY.equalTo(self.contentV);
                    make.width.equalTo(self);
                }];
            } else {
                [v mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(last.mas_right);
                    make.width.top.equalTo(last);
                }];
            }
            last = v;
        }
        
        [_contentV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(last);
        }];
        
        _pageControl = [[LWDPageControl alloc] initWithFrame:CGRectMake(0, kScreenHeight-80, kScreenWidth, 40) indicatorMargin:3.f indicatorWidth:20.f currentIndicatorWidth:20.f indicatorHeight:5.f];
        _pageControl.numberOfPages = 4;
        [self addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(last.mas_bottom).offset(20);
        }];
    }
    return self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = currentPage;
}


@end
