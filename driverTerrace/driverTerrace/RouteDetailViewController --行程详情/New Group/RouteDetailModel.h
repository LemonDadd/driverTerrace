//
//  RouteDetailModel.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CircutiMapModel;

@interface RouteDetailModel : NSObject

@property (nonatomic, strong)CircutiMapModel *circutiMap;
@property (nonatomic, assign)NSInteger orderState;
@property (nonatomic, strong)NSArray *userOrderMaps;

@end

@interface CircutiMapModel : NSObject

@property (nonatomic, copy)NSString *personNum;
@property (nonatomic, assign)CGFloat price;
@property (nonatomic, copy)NSString *startTime;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *startName;
@property (nonatomic, copy)NSString *destinationName;

@end

NS_ASSUME_NONNULL_END
