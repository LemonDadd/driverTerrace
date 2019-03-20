//
//  OrderModel.h
//  driverTerrace
//
//  Created by 关云秀 on 2019/3/18.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, OrderType) {
    OrderTypeUser,
    OrderTypeFellow,
    OrderTypeNone,
};
@class CircuitModel;
@class OrderListModel;
@class OrderUserModel;

@interface OrderModel : NSObject

@property (nonatomic, strong)CircuitModel *circuit;
@property (nonatomic, strong)NSArray *orderList;

@end


@interface CircuitModel : NSObject

@property (nonatomic, copy)NSString *circuitname;
@property (nonatomic, assign)CGFloat price;
@property (nonatomic, copy)NSString *starttime;

@end


@interface OrderListModel : NSObject

@property (nonatomic, copy)NSString *id;//
@property (nonatomic, assign)NSInteger orderStatus;//订单状态
@property (nonatomic, copy)NSString *originlatitude;//精度
@property (nonatomic, copy)NSString *originlongitude;//纬度
@property (nonatomic, assign)NSInteger payStatus;//支付状态;
@property (nonatomic, assign)NSInteger personNum;//人数
@property (nonatomic, strong)OrderUserModel *user;

@property (nonatomic, assign)OrderType type;//扩展字段

@end

@interface OrderUserModel : NSObject

@property (nonatomic, copy)NSString * nickname;
@property (nonatomic, copy)NSString *portrait;

@end



NS_ASSUME_NONNULL_END
