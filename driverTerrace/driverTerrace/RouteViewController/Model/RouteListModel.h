//
//  RouteListModel.h
//  driverTerrace
//
//  Created by quanqiuwa on 2019/3/20.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RouteListModel : NSObject

@property (nonatomic, copy)NSString *circuitname;
@property (nonatomic, copy)NSString *endDate;
@property (nonatomic, copy)NSString *id;
@property (nonatomic, assign)CGFloat price;
@property (nonatomic, copy)NSString *startDate;
@property (nonatomic, assign)NSInteger orderState;
@property (nonatomic, copy)NSString *personSum;
@end

NS_ASSUME_NONNULL_END
